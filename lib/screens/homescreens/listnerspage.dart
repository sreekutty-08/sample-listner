import 'package:flutter/material.dart';
import 'package:listners_app/Widgets/AppBarWidget.dart';
import 'package:listners_app/Widgets/BottomNavigationBarWidget.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/morescreens/earnings.dart';

class ListnersPage extends StatelessWidget {
  const ListnersPage(
      {super.key, required listenerName, required String imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(context),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/images/photo.jpg'),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      'Athira',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Logic for Language button
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text('Language :'),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Logic for Language button
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink),
                      child: const Text('English'),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Logic for Language button
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink),
                      child: const Text('Malayalam'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: 500,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Logic for Offline button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    side: const BorderSide(width: 1, color: Colors.brown),
                    elevation: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('online'),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
        bottomNavigationBar: BottomWidget()
    );
  }
}
