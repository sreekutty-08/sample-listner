import 'package:flutter/material.dart';
import 'package:listners_app/Widgets/AppBarWidget.dart';
import 'package:listners_app/Widgets/BottomNavigationBarWidget.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/morescreens/earnings.dart';
import 'package:listners_app/screens/morescreens/requesthistory.dart';

class Coins extends StatelessWidget {
  const Coins({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(context),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/photo.jpg'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Athira',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to coin collection page
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => CoinCollectionPage()));
                      },
                      child: const Text(
                        ' 900',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Coin Balance

              const SizedBox(height: 20),

              // Debit and Credit Card Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the screen for "COIN EARN"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const Earnings(), // Replace CoinEarnScreen with your actual screen widget
                        ),
                      );
                    },
                    child: const Text('COIN EARN'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the screen for "PAYMENT"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const Request(), // Replace PaymentScreen with your actual screen widget
                        ),
                      );
                    },
                    child: const Text('PAYMENT'),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Credited',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.currency_rupee_sharp,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' 30-04-2023', // Replace with the actual date
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            ' 01:20:24 ', // Replace with the actual time
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(), // Add a spacer to push the next content to the right
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '+200',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'by call',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.currency_rupee_sharp,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' 30-04-2023', // Replace with the actual date
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            ' 00:12:24 ', // Replace with the actual time
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(), // Add a spacer to push the next content to the right
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '+200',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'by call',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.currency_rupee_sharp,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' 20-05-2023', // Replace with the actual date
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            ' 00:20:24 ', // Replace with the actual time
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(), // Add a spacer to push the next content to the right
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '+200',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'by call',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              // Money Symbol and Text
            ],
          ),
        ),
        bottomNavigationBar:BottomWidget());
  }
}
