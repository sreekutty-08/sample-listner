import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listners_app/screens/splash.dart';
import 'package:get/get.dart';

import 'Controller/CallController/CallController.dart';

void main() {
  // Set the system UI overlay style to have a transparent status bar
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  // Run the Flutter application by calling runApp and passing the MyApp widget
  runApp(const MyApp());
}

// MyApp is a StatelessWidget representing your Flutter application
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
