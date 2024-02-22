import 'dart:async';
import 'dart:convert';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_service/flutter_foreground_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

import '../Constant.dart';
import '../Controller/CallController/CallController.dart';
import '../HelperFunction/HelperFunction.dart';
import 'home.dart';

class Calling extends StatefulWidget {
  final String? personName;
  final String? profileImageUrl;
  final String channelName;
  final String userId;
  final String progressId;
  const Calling({
    Key? key,
    required this.personName,
    required this.profileImageUrl,
    required this.channelName,
    required this.progressId,
    required this.userId
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CallingState createState() => _CallingState();
}

class _CallingState extends State<Calling> {
  bool isVideoCall = false;
  late Timer _timer;
  int _seconds = 0;
  int? _remoteUid;
  late RtcEngine _engine;
  CallController controller=Get.put(CallController());
  String? token;


  @override
  void initState() {
    super.initState();
    ForegroundService().start();
    initializeAgora();
  }


  @override
  void dispose() {
    _engine.leaveChannel();
    _engine.destroy();
    _timer.cancel();
    ForegroundService().stop();
    super.dispose();
  }

  Future<void> initializeAgora() async {
    await [Permission.microphone].request();
    _engine = await RtcEngine.create(appId);
    await _engine.enableAudio();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
            setState(() {
              _seconds++;
            });
          });
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          setState(() {
            _engine.leaveChannel();
            _engine.destroy();
            _remoteUid = null;
            Get.back();
          });
        },
      ),
    );
    await _engine.joinChannel(null, widget.channelName, null, 0);
  }

  @override
  Widget build(BuildContext context) {
    String durationText = 'Call Duration: ${_seconds ~/ 60}:${_seconds % 60}';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.profileImageUrl != null
                        ? CircleAvatar(
                        radius: 80, backgroundImage: NetworkImage("$imageUrl${widget.profileImageUrl}"))
                        : const CircleAvatar(
                      backgroundColor: Color(0xffE6E6E6),
                      radius: 80,
                      child: Icon(
                        Icons.person,
                        color: Color(0xffCCCCCC),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.personName!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(durationText,
                        style: const TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: (){
                        _engine.disableAudio();
                      },
                      icon: const Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.call_end,
                        color: Colors.red,
                        size: 64,
                      ),
                      onTap: ()async {
                       await controller.callCut(widget.progressId);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}