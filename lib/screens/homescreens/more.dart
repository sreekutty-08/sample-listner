import 'package:flutter/material.dart';
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
      appBar: PreferredSize(
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Home(
                    languages: [],
                    language: [],
                  ), // Replace with your home screen widget
                ),
              );
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
                    builder: (context) => const Coins(),
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
          children: [
            // Menu Items
            buildMenuItem('Dashboard', icon: Icons.dashboard, onTap: () {
              // Navigate to Dashboard screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Home(
                    languages: [],
                    language: [],
                  ),
                ),
              );
            }),
            buildMenuItem('Profile', icon: Icons.person, onTap: () {
              // Navigate to Profile screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Profile(),
                ),
              );
            }),
            buildMenuItem('Notifications', icon: Icons.notifications,
                onTap: () {
              // Navigate to Notifications screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Notifications(),
                ),
              );
            }),
            buildMenuItem('Call History', icon: Icons.history, onTap: () {
              // Navigate to Call History screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const CallHistory(),
                ),
              );
            }),
            buildMenuItem('Earnings', icon: Icons.monetization_on, onTap: () {
              // Navigate to Call History screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Earnings(),
                ),
              );
            }),
            buildMenuItem('Request History', icon: Icons.request_quote_sharp,
                onTap: () {
              // Navigate to Call History screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Request(),
                ),
              );
            }),

            buildMenuItem('Terms and Conditions', icon: Icons.description,
                onTap: () {
              // Navigate to Terms and Conditions screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const TermConditions(),
                ),
              );
            }),
            buildMenuItem('Privacy Policy', icon: Icons.privacy_tip, onTap: () {
              // Navigate to Privacy Policy screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const PrivacyPolicy(),
                ),
              );
            }),
            buildMenuItem('Refund Policy', icon: Icons.assignment_return,
                onTap: () {
              // Navigate to Refund Policy screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const RefundPolicy(),
                ),
              );
            }),
            buildMenuItem('Settings', icon: Icons.settings, onTap: () {
              // Navigate to Settings screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Settings(),
                ),
              );
            }),
            const SizedBox(height: 20),
            // Logout
            buildMenuItem('Logout', icon: Icons.exit_to_app, onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Otppage(),
                ),
              );
            }),
            // Add additional scrolling content here
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 4, // Set the initial selected index (Home in this case)
        onTap: (int index) {
          // Handle navigation based on the selected index
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const Coins(), // Replace 'Home' with your actual screen widget
                ),
              );
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
                  builder: (BuildContext context) =>
                      const Notifications(), // Replace 'Home' with your actual screen widget
                ),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const More(), // Replace 'Home' with your actual screen widget
                ),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), label: 'Coins'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'support'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
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
