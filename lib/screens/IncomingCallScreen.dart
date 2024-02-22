
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:listners_app/Controller/CallController/CallController.dart';
import 'package:listners_app/HelperFunction/HelperFunction.dart';
import 'package:listners_app/screens/VoiceCalling.dart';
import 'package:listners_app/screens/home.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Constant.dart';


class InComingCallScreen extends StatefulWidget {
  final String? personName;
  final String? profileImageUrl;
  final String channelName;
  final String userId;
  final String? progressId;
  const InComingCallScreen({super.key,
    required this.channelName,
    required this.userId,
    required this.profileImageUrl,
    required this.progressId,
    required this.personName});
  @override
  _InComingCallScreenState createState() => _InComingCallScreenState();
}

class _InComingCallScreenState extends State<InComingCallScreen> {

  AudioPlayer ringtonePlayer = AudioPlayer();
  bool isRinging = true;
  AudioCache cache = AudioCache();
  CallController callController=Get.find();

  @override
  void initState() {
    super.initState();
    _playRingtone();
    // initializeAgora();
    // FlutterBackgroundService().invoke("setAsBackground");
  }


  @override
  Widget build(BuildContext context) {
    print("isRinging $isRinging");
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple,
                Colors.black87
              ]
            )
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Column(
                 children: [
                   widget.profileImageUrl!=null?
                   CircleAvatar(
                     radius: 60,
                     backgroundImage: NetworkImage("$imageUrl${widget.profileImageUrl}"),
                   ):
                   const CircleAvatar(
                     radius: 60,
                     child: Icon(
                       Icons.person,
                       color: Color(0xffCCCCCC),
                     ), // Add your image asset
                   ),
                   SizedBox(height: 10,),
                   Text(
                     widget.personName!,
                     style: const TextStyle(
                       fontSize: 24,
                       fontWeight: FontWeight.bold,
                       color: Colors.white
                     ),
                   ),
                   const Text(
                     'Incoming Call...',
                     style: TextStyle(
                       fontSize: 18,
                       color: Colors.green,
                     ),
                   ),
                 ],
               ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.call_end),
                      color: Colors.red,
                      iconSize: 40,
                      onPressed: () {
                        stopRingtone();
                        callController.callCut(widget.progressId);
                      },
                    ),
                    const SizedBox(width: 30),
                    IconButton(
                      icon: const Icon(Icons.call),
                      color: Colors.green,
                      iconSize: 40,
                      onPressed: () {
                        stopRingtone();
                        Get.offAll(Calling(
                            personName: widget.personName,
                            profileImageUrl: widget.profileImageUrl,
                            channelName: widget.channelName,
                            progressId:widget.progressId!,
                            userId: widget.userId));
                      },
                    ),
                  ],
                ),
              ],
          ),
        ),
        );

  }




  @override
  void dispose() {
    super.dispose();
    stopRingtone();
    // FlutterBackgroundService().invoke('stopService');
  }


  void _playRingtone() async {
    while (isRinging) {
      await ringtonePlayer.play(AssetSource("Audio/apple.mp3"));
    }
  }

  void stopRingtone() {
    // Set the flag to false to stop the loop
    isRinging = false;
    // Stop the currently playing ringtone
    ringtonePlayer.stop();
  }
}

