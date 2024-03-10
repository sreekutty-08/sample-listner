import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/homescreens/support.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      currentIndex: 4,
      onTap: (int index) {
        switch (index) {
          case 0:
            // Reload the Home page
            Get.to(Home());
            break;
          case 1:
            // Get.to(Coins());
            break;
          case 2:
            Get.to(Support());
            break;
          case 3:
            Get.to(Notifications());
            break;
          case 4:
            Get.to(More());
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on), label: 'Coins'),
        BottomNavigationBarItem(
            icon: Icon(Icons.call, size: 32.0), label: 'support'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: 'Notification'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
      ],
    );
  }
}
