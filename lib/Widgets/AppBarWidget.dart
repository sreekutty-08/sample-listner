import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home.dart';
import '../screens/morescreens/earnings.dart';
PreferredSize AppBarWidget(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60.0),
    child: AppBar(
      backgroundColor: Colors.white,
      elevation: 10,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.purple,
        ),
        onPressed: () {
          // Navigate back to the home screen
          Get.to(const Home());
        },
      ),
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
  );
}