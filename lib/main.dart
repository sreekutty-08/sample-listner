import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listners_app/screens/splash.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if(value){
      Permission.notification.request();
    }
  }
  );
  await Permission.microphone.isDenied.then((value) {
    if(value){
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
