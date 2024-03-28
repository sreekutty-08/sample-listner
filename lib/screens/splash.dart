// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:listners_app/Controller/AuthController/AuthController.dart';
import 'package:listners_app/screens/StreamDemo.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/otppage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constant.dart';
import '../HelperFunction/HelperFunction.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
    getUserOnlineStatus();
    getUserId();
    Timer(const Duration(seconds: 5), () {
      Get.offAll(_isSignedIn ? const Home() : Otppage());
    });
  }

  bool _isSignedIn = false;
  AuthController controller = Get.put(AuthController());

  getUserLoggedInStatus() async {
    await HelperFunction.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }
  getUserOnlineStatus()async{
    SharedPreferences sf=await SharedPreferences.getInstance();
    bool? value= sf.getBool("isOnline");
    if(value!=null){
      isOnline.value=value;
      return value;
    }else{
      return false;
    }
  }

  getUserId() async {
    await HelperFunction.getUserIdFromSF().then((value) {
      if (value != null) {
        print(value);
        setState(() {
          userId = value;
          controller.fetchDataFromApi();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 176, 39, 151),
              Color.fromARGB(255, 176, 39, 128),
              Color.fromARGB(255, 176, 39, 153),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Remove the Image.asset widget

            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            'assets/images/mainimage.jpg',
                            height: 250,
                            width: 250,
                          ),
                        ),
                      ),
                      const Text(
                        'Friendly Talks',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
