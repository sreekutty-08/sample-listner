import 'dart:convert';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:http/http.dart' as http;

import '../Constant.dart';
import '../HelperFunction/HelperFunction.dart';
class VideoCallAgora extends StatefulWidget {
  String channelName ;
  String userId;
  VideoCallAgora({super.key,required this.userId,required this.channelName});

  @override
  State<VideoCallAgora> createState() => _VideoCallAgoraState();
}

class _VideoCallAgoraState extends State<VideoCallAgora> {
  int? _remoteUid;
  late RtcEngine _engine;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    InitAgora();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _engine.leaveChannel();
    _engine.destroy();
  }

  Future InitAgora()async{
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    _engine.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: (String channel, int uid, int elapsed) async {
        debugPrint('joinChannelSuccess $channel $uid');
        print("joinid is $channel $uid");
      },
      leaveChannel: (stats) {
        debugPrint("leaveChannel ${stats.toJson()}");
      },
      userJoined: (int uid, int elapsed) {
        debugPrint('userJoined $uid');
        _remoteUid = uid;
        print(uid);

      },
      userOffline: (int uid, UserOfflineReason reason) {
        debugPrint('userOffline $uid');
        _remoteUid = null;
      },
    ));

    _engine.enableVideo();
    print(widget.channelName);
    await _engine.joinChannel(null, widget.channelName!, null, 0);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 100,
              height: 100,
              child: RtcLocalView.SurfaceView(),
            ),
          )
        ],
      ),
    );
  }

  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(uid: _remoteUid!, channelId: widget.channelName!,);
    } else {
      return Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
