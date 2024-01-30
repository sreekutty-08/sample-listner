
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:get/get.dart';
import 'package:listners_app/screens/home.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Constant.dart';


class VideoCall extends StatefulWidget {
  String channelName;
  String userId;
  VideoCall({super.key,required this.channelName,required this.userId,});
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  late RtcEngine _engine;
  int? _remoteUid;
  AudioPlayer ringtonePlayer = AudioPlayer();
  bool isRinging = true;
  AudioCache cache = AudioCache();

  @override
  void initState() {
    super.initState();
    _playRingtone();
    // initializeAgora();
  }

  Future<void> initializeAgora() async {
    await [Permission.microphone, Permission.camera].request();
    _engine = await RtcEngine.create(appId);
    await _engine.enableAudio();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
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
    print("isRinging $isRinging");
    return Scaffold(
      body:
      Stack(
        children: [
          // Center(
          //   child: _remoteVideo(),
          // ),
          isRinging?
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Incoming Call...',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onVerticalDragEnd: (details) {
                      if (details.primaryVelocity! > 0) {
                        _answerCall(); // Slide down to answer the call
                      } else {
                        _endCall(); // Slide up to reject the call
                      }
                    },
                    child: Icon(
                      Icons.arrow_downward,
                      size: 50,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ):
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 100,
              height: 100,
              child: RtcLocalView.SurfaceView(),
            ),
          ),
          Positioned(
            bottom: 5,
            left: MediaQuery.of(context).size.width / 2 - 28,
            child: FloatingActionButton(
              onPressed: () {
                _endCall();
              },
              child: Icon(Icons.call_end, color: Colors.red),
            ),
          ),
        ],
      )
    );
  }


  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(uid: _remoteUid!, channelId: widget.channelName,);
    } else {
      return Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }

  @override
  void dispose() {
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }


  void _playRingtone() async {
   await ringtonePlayer.play(AssetSource("assets/Audio/feid.mp3"));

  }

  void _answerCall() {
    initializeAgora();
    ringtonePlayer.stop();
    isRinging = false;
    setState(() {});
    // Add logic to answer the call
  }
  void _endCall(){
    _engine.leaveChannel();
    _engine.destroy();
    _engine.disableAudio();
    Get.offAll(Home(languages: ["languages"], language: ["hjk"]));
  }
}

