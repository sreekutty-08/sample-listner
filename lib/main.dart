import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listners_app/HelperFunction/HelperFunction.dart';

import 'package:listners_app/screens/Notification/notifyPage.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/splash.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'Controller/CallController/CallController.dart';



const fetchBackground = "fetchBackground";
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print("Native called background task: $task");
    switch (task){
      case fetchBackground:
        callApi();
        break;
    }
    await callApi();
    return Future.value(true);
    });
}

callApi()async
{
  CallController controller=Get.put(CallController());
  SharedPreferences sf=await SharedPreferences.getInstance();
  bool? online=sf.getBool("isOnline");
  String? userID=sf.getString('USERIDKEY');
  if (online != null && userID != null) {
    controller.updateOnline(userID);
    controller.checkIncomingCalls(userID);
  } else {
    print("User data not available. Background task aborted.");
  }

}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize GetX
  await Workmanager().initialize(
    callbackDispatcher,
  );
  await Workmanager().registerPeriodicTask(
    "1",
    fetchBackground,
    frequency: const Duration(seconds: 2),
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );
  Get.put(CallController());
  const int periodicID = 0;
  const Duration period = Duration(seconds: 1);
  const Duration timeperiod = Duration(seconds: 4); //
  // Initialize Android Alarm Manager
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod:         NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:    NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:  NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:  NotificationController.onDismissActionReceivedMethod
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(

      navigatorKey: MyApp.navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) =>
               const Splash()
            );

          case '/notification-page':
            return MaterialPageRoute(builder: (context) {
              final ReceivedAction receivedAction = settings
                  .arguments as ReceivedAction;
              return NotificationPage(receivedAction: receivedAction);
            });

          default:
            assert(false, 'Page ${settings.name} not found');
            return null;
        }
      },
      debugShowCheckedModeBanner: false, // Disable debug banner
      title: 'Friendly Talks', // Set the title of the app
      theme: ThemeData(primarySwatch: Colors.purple), // Set the app theme
      home: const Splash(),
      // Set the initial screen to the Splash widget
    );
  }
}
