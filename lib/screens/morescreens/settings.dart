import 'package:flutter/material.dart';
import 'package:listners_app/Widgets/AppBarWidget.dart';
import 'package:listners_app/Widgets/BottomNavigationBarWidget.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/morescreens/earnings.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notifications = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarWidget(context),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text('App Notifications'),
            subtitle: const Text('Enable/Disable app notifications'),
            value: _notifications,
            onChanged: (value) {
              setState(() {
                _notifications = value;
                _saveSettings();
              });
            },
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Switch to dark mode'),
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
                _saveSettings();
                // Implement logic to change theme to dark mode
                // Example: Theme.of(context).brightness = Brightness.dark;
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomWidget()
    );
  }

  // Add a method to save the settings
}

// ignore: camel_case_types
class _saveSettings {}
