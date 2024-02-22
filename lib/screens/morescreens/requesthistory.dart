import 'package:flutter/material.dart';
import 'package:listners_app/Widgets/AppBarWidget.dart';
import 'package:listners_app/Widgets/BottomNavigationBarWidget.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/morescreens/earnings.dart';

class Request extends StatelessWidget {
  const Request({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Both sections in the same row
            Row(
              children: [
                Expanded(
                  child: _buildSection('Requested Payout'),
                ),
                const SizedBox(width: 16.0), // Add some space between the boxes
                Expanded(
                  child: _buildSection('New Request'),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            // No Request Yet
            const Center(
              child: Text(
                'No Request Yet',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }

  Widget _buildSection(String title) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          // Add content specific to each section as needed
          // For example, you can add a list of requested payouts or new requests here
        ],
      ),
    );
  }
}
