import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:listners_app/screens/splash.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Controller/CallController/CallController.dart';

void callback() {
  final CallController callController = Get.find();
  callController.checkIncomingCalls();
}

void callApi() async {
  final CallController controller = Get.find();
  controller.checkIncomingCalls();
}

// void startBackgroundTask() async {
//   await FlutterBackground.initialize();
//   await FlutterBackground.enableBackgroundExecution();
//   await FlutterBackground
//
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize GetX
  Get.put(CallController());
  const int periodicID = 0;
  const Duration period = Duration(seconds: 1);
  const Duration timeperiod = Duration(seconds: 4); //
  // Initialize Android Alarm Manager
  await AndroidAlarmManager.initialize();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: "Call_channel",
      channelName: "Call Channel",
      channelDescription: "Channel of calling",
      defaultColor: Colors.redAccent,
      ledColor: Colors.white,
      importance: NotificationImportance.Max,
      channelShowBadge: true,
    )
  ]);
  AndroidAlarmManager.periodic(period, periodicID, callback);
  AndroidAlarmManager.periodic(timeperiod, periodicID, callApi);
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await Permission.microphone.isDenied.then((value) {
    if (value) {
      Permission.microphone.request();
    }
  });
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      title: 'Friendly Talks', // Set the title of the app
      theme: ThemeData(primarySwatch: Colors.purple), // Set the app theme
      home: const Splash(),
      // Set the initial screen to the Splash widget
    );
  }
}
