import 'package:flutter/material.dart';
import 'package:listners_app/Widgets/AppBarWidget.dart';
import 'package:listners_app/Widgets/BottomNavigationBarWidget.dart';
import 'package:listners_app/screens/calling.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/morescreens/earnings.dart';

class CallHistory extends StatelessWidget {
  const CallHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Call History',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Implement delete all functionality
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.delete_forever, color: Colors.red),
                      SizedBox(width: 8.0),
                      Text(
                        'Delete All',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], // Adjust color as needed
              ),
              child: ListView(
                children: [
                  _buildCallEntry(
                    profilePhoto: 'assets/images/friendly.png',
                    name: 'Rithu mohan',
                    date: '2023-01-01',
                    time: '12:30 PM',
                    duration: '5:23',
                    isAttended: true,
                    onDelete: () {
                      // Implement delete functionality for this entry
                    },
                    onCall: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => const Calling(),
                      //   ),
                      // );
                    },
                  ),
                  _buildCallEntry(
                    profilePhoto: 'assets/images/friendly.png',
                    name: 'Athira',
                    date: '2023-01-02',
                    time: '3:45 PM',
                    duration: '2:15',
                    isAttended: false,
                    onDelete: () {
                      // Implement delete functionality for this entry
                    },
                    onCall: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => const Calling(),
                      //   ),
                      // );
                    },
                  ),
                  _buildCallEntry(
                    profilePhoto: 'assets/images/friendly.png',
                    name: 'Anjali',
                    date: '2023-05-06',
                    time: '2:45 PM',
                    duration: '6:15',
                    isAttended: true,
                    onDelete: () {
                      // Implement delete functionality for this entry
                    },
                    onCall: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => const Calling(),
                      //   ),
                      // );
                    },
                  ),
                  _buildCallEntry(
                    profilePhoto: 'assets/images/friendly.png',
                    name: 'Joel',
                    date: '2023-01-02',
                    time: '3:45 PM',
                    duration: '2:15',
                    isAttended: false,
                    onDelete: () {
                      // Implement delete functionality for this entry
                    },
                    onCall: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => const Calling(),
                      //   ),
                      // );
                    },
                  ),
                  _buildCallEntry(
                    profilePhoto: 'assets/images/friendly.png',
                    name: 'Rohan',
                    date: '2023-01-02',
                    time: '3:45 PM',
                    duration: '2:15',
                    isAttended: false,
                    onDelete: () {
                      // Implement delete functionality for this entry
                    },
                    onCall: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => const Calling(),
                      //   ),
                      // );
                    },
                  ),

                  // Add more call entries as needed
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomWidget()
    );
  }

  Widget _buildCallEntry({
    required String profilePhoto,
    required String name,
    required String date,
    required String time,
    required String duration,
    required bool isAttended,
    required VoidCallback onDelete,
    required VoidCallback onCall, // Added onCall parameter
  }) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) {
        onDelete();
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(profilePhoto),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: onDelete,
                      ),
                      // Added IconButton for making a call
                      IconButton(
                        icon: const Icon(Icons.call, color: Colors.green),
                        onPressed: onCall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '$date, $time',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  duration,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                Icon(
                  isAttended ? Icons.call_received : Icons.call_missed,
                  color: isAttended ? Colors.green : Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
