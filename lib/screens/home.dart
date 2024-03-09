import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listners_app/Constant.dart';
import 'package:listners_app/Controller/AuthController/AuthController.dart';
import 'package:listners_app/Controller/AuthController/PasswordController.dart';
import 'package:listners_app/Controller/CallController/CallController.dart';
import 'package:listners_app/Models/current_user/current_user.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/morescreens/callhistory.dart';
import 'package:listners_app/screens/morescreens/earnings.dart';
import 'package:listners_app/screens/morescreens/profile.dart';

class Home extends StatefulWidget {


  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BuildContext? get builderContext => null;
  CallController callController = Get.put(CallController());
  RxBool isOnline=true.obs;

  AuthController controller = Get.find();
  // PasswordController passwordController=Get.put(PasswordController());
  int _counter = 60;
  late Timer _apiTimer;
  late Timer _timer;
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _apiTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      callController.checkIncomingCalls();
    });
    _timer=Timer.periodic(const Duration(seconds: 4), (timer) {
      if(isOnline.value) {
        callController.updateOnline();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final data=controller.currentUser.value.data?[0];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          leading:Obx(()=>Switch(
            activeColor: Colors.green,
            value: isOnline.value,
            onChanged:(bool value) {
              isOnline.value=value;
            },)) ,

          backgroundColor: Colors.white,
          elevation: 10,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/friendly.png',
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 5.0),
                    const Text(
                      'Friendly Talks',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Earnings(),
                  ),
                );
              },
              icon: const Icon(
                Icons.monetization_on,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Profile(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    data!.profileImage != null
                        ? CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                "$imageUrl${data.profileImage}"))
                        : const CircleAvatar(
                            backgroundColor: Color(0xffE6E6E6),
                            radius: 30,
                            child: Icon(
                              Icons.person,
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Obx(() => Text(
                          isOnline.value?'Online':'Offline',
                          style: TextStyle(
                            color: isOnline.value?Colors.green:Colors.red,
                            fontSize: 20,
                          ),
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the "Earnings" page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const Earnings(), // Replace with the actual page you want to navigate to
                      ),
                    );
                  },
                  child: _buildStyledContainer(
                    'Coin Earned',
                    Icons.currency_exchange,
                    controller.earnCoin.value,
                    Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the "Earnings" page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const Earnings(), // Replace with the actual page you want to navigate to
                      ),
                    );
                  },
                  child: _buildStyledContainer(
                    'Free Coin Earned',
                    Icons.attach_money_rounded,
                    controller.freeCoin.value,
                    Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the "Call History" page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CallHistory(), // Replace with the actual page you want to navigate to
                      ),
                    );
                  },
                  child: _buildStyledContainer(
                    'No of Call',
                    Icons.phone_callback_rounded,
                    controller.callHistory.value.data!.length.toString(),
                    Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the "Call History" page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CallHistory(), // Replace with the actual page you want to navigate to
                      ),
                    );
                  },
                  child: _buildStyledContainer(
                    'Total Call Hours',
                    Icons.timer_rounded,
                    controller.hour.value.toString(),
                    Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Home(

                  ),
                ),
              );
              break;

            case 1:
              // Navigator.pushReplacement(
              //   context,
              //   // MaterialPageRoute(
              //   //   builder: (BuildContext context) => const
              //   //   // Coins(),
              //   // ),
              // );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Support(),
                ),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Notifications(),
                ),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const More(),
                ),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), label: 'Coins'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}

// ignore: avoid_types_as_parameter_names
Widget _buildStyledContainer(
    String label, IconData icon, String title, Color containerColor) {
  return Container(
    height: 90.0,
    width: 170.0,
    decoration: BoxDecoration(
      color: containerColor, // Use the provided parameter name here
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.pink[600],
          size: 25.0,
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
