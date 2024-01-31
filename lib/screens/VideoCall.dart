
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:get/get.dart';
import 'package:listners_app/Controller/CallController/CallController.dart';
import 'package:listners_app/HelperFunction/HelperFunction.dart';
import 'package:listners_app/screens/VoiceCalling.dart';
import 'package:listners_app/screens/home.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Constant.dart';


class VideoCall extends StatefulWidget {
  final String? personName;
  final String? profileImageUrl;
  final String channelName;
  final String userId;
  final String? progressId;
  VideoCall({super.key,
    required this.channelName,
    required this.userId,
    required this.profileImageUrl,
    required this.progressId,
    required this.personName});
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {

  AudioPlayer ringtonePlayer = AudioPlayer();
  bool isRinging = true;
  AudioCache cache = AudioCache();
  CallController callController=Get.find();

  @override
  void initState() {
    super.initState();
    _playRingtone();
    // initializeAgora();
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {

                            Get.offAll(Calling(
                              progressId: widget.progressId!,
                                personName: widget.personName,
                                profileImageUrl: widget.profileImageUrl,
                                channelName: widget.channelName,
                                userId: widget.userId));
                                // Slide down to answer the call
                        },
                        child: Icon(
                          Icons.call,
                          size: 50,
                          color: Colors.green,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          callController.callCut(widget.progressId);
                        },
                        child: Icon(Icons.call_end,size: 50,color: Colors.red,),
                      )
                    ],
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
        ],
      )
    );
  }




  @override
  void dispose() {
    super.dispose();
    ringtonePlayer.stop();
  }


  void _playRingtone() async {
   await ringtonePlayer.play(AssetSource("Audio/feid.mp3"));
  }


}

