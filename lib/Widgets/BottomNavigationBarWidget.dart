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
    RxInt currentIndex=0.obs;
    return BottomNavigationBar(
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      currentIndex:2,
      onTap: (int index) {
        switch (index) {
          case 0:
            // Reload the Home page
          currentIndex.value=index;

            Get.to(const Home());
            break;
          case 1:
            currentIndex.value=index;
            Get.to(Coins());
            break;
          case 2:
            currentIndex.value=index;
            print(currentIndex);
            Get.to(const Support());
            break;
          case 3:
            currentIndex.value=index;
            Get.to(const More());
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on), label: 'Coins'),
        BottomNavigationBarItem(
            icon: Icon(Icons.call, size: 32.0), label: 'support'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
      ],
    );
  }
}
