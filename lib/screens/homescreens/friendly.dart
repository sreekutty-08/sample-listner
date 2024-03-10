import 'package:flutter/material.dart';
import 'package:listners_app/Widgets/AppBarWidget.dart';
import 'package:listners_app/Widgets/BottomNavigationBarWidget.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/morescreens/earnings.dart';

class Friendly extends StatelessWidget {
  const Friendly({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(context),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.grey],
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/slide.jpg',
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set the background color as needed
                    borderRadius: BorderRadius.circular(
                        10), // Set the border radius as needed
                  ),
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  child: _buildCallHistoryTile(
                    'Athira',
                    'assets/images/photo.jpg',
                    'Coins: 200/min | Rating: 4.5',
                    online: false,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set the background color as needed
                    borderRadius: BorderRadius.circular(
                        10), // Set the border radius as needed
                  ),
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  child: _buildCallHistoryTile(
                    'Anitha',
                    'assets/images/photo.jpg',
                    'Coins: 200/min | Rating: 4.5',
                    online: false,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set the background color as needed
                    borderRadius: BorderRadius.circular(
                        10), // Set the border radius as needed
                  ),
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  child: _buildCallHistoryTile(
                    'Amitha',
                    'assets/images/photo.jpg',
                    'Coins: 200/min | Rating: 4.5',
                    online: false,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set the background color as needed
                    borderRadius: BorderRadius.circular(
                        10), // Set the border radius as needed
                  ),
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  child: _buildCallHistoryTile(
                    'susan',
                    'assets/images/photo.jpg',
                    'Coins: 200/min | Rating: 4.5',
                    online: false,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomWidget());
  }

  Widget _buildCallHistoryTile(String name, String imagePath, String subtitle,
      {required bool online}) {
    String statusText = online ? 'In Call' : 'Offline';

    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            statusText,
            style: TextStyle(
              fontSize: 14,
              color: online ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
      trailing: Icon(
        Icons.call,
        color: online ? Colors.yellow : Colors.red,
        size: 32.0,
      ),
    );
  }
}
