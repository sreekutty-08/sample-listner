import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listners_app/Widgets/AppBarWidget.dart';
import 'package:listners_app/Widgets/BottomNavigationBarWidget.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/morescreens/callhistory.dart';
import 'package:listners_app/screens/morescreens/earnings.dart';

import 'package:listners_app/screens/morescreens/privacypolice.dart';
import 'package:listners_app/screens/morescreens/profile.dart';
import 'package:listners_app/screens/morescreens/refundpolicy.dart';
import 'package:listners_app/screens/morescreens/requesthistory.dart';
import 'package:listners_app/screens/morescreens/settings.dart';
import 'package:listners_app/screens/morescreens/termconditions.dart';
import 'package:listners_app/screens/otppage.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Menu Items
            buildMenuItem('Dashboard', icon: Icons.dashboard, onTap: () {
              // Navigate to Dashboard screen
              Get.to(Home());
            }),
            buildMenuItem('Profile', icon: Icons.person, onTap: () {
              // Navigate to Profile screen
            Get.to(Profile());
            }),
            buildMenuItem('Notifications', icon: Icons.notifications,
                onTap: () {
              // Navigate to Notifications screen
                  Get.to(Notifications());
            }),
            buildMenuItem('Call History', icon: Icons.history, onTap: () {
              // Navigate to Call History screen
              Get.to(CallHistory());
            }),
            buildMenuItem('Earnings', icon: Icons.monetization_on, onTap: () {
              // Navigate to Call History screen
              Get.to(Earnings());
            }),
            buildMenuItem('Request History', icon: Icons.request_quote_sharp,
                onTap: () {
              // Navigate to Call History screen
             Get.to(Request());
            }),

            buildMenuItem('Terms and Conditions', icon: Icons.description,
                onTap: () {
              // Navigate to Terms and Conditions screen
              Get.to(TermConditions());
            }),
            buildMenuItem('Privacy Policy', icon: Icons.privacy_tip, onTap: () {
              // Navigate to Privacy Policy screen
              Get.to(PrivacyPolicy());
            }),
            buildMenuItem('Refund Policy', icon: Icons.assignment_return,
                onTap: () {
              // Navigate to Refund Policy screen
             Get.to(RefundPolicy());
            }),
            buildMenuItem('Settings', icon: Icons.settings, onTap: () {
              // Navigate to Settings screen
            Get.to(Settings());
            }),
            const SizedBox(height: 20),
            // Logout
            buildMenuItem('Logout', icon: Icons.exit_to_app, onTap: () {

            }),
            // Add additional scrolling content here
          ],
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }

  Widget buildMenuItem(String title, {IconData? icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: icon != null ? Icon(icon) : null,
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
