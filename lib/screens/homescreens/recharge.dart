import 'package:flutter/material.dart';
import 'package:listners_app/Widgets/AppBarWidget.dart';
import 'package:listners_app/Widgets/BottomNavigationBarWidget.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';

class Recharge extends StatelessWidget {
  const Recharge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCard(
                    Icons.payment_outlined,
                    'BASE',
                    '\$99',
                    'Time 15 Mints',
                    '3000 Coins',
                  ),
                  buildCard(
                    Icons.monetization_on,
                    'BASE PLUS',
                    '\$229',
                    'Time 50 ints',
                    '10000 Coins',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCard(
                    Icons.monetization_on,
                    'POPULAR',
                    '\$749.01',
                    'Time 130 ints',
                    '26000 Coins',
                  ),
                  buildCard(
                    Icons.monetization_on,
                    'PREMIUM',
                    '\$999',
                    'Time 180 ints',
                    '36000 Coins',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCard(
                    Icons.monetization_on,
                    'ROYAL',
                    '\$3998.01',
                    'Time 770 Mints',
                    '154000 Coins',
                  ),
                  buildCard(
                    Icons.monetization_on,
                    'ROYAL PLUS',
                    '\$8001.00',
                    'Time 1750 Mints',
                    '350000 Coins',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }

  Widget buildCard(
    IconData icon,
    String title,
    String amount,
    String subtitle,
    String subtitles,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Grey background color
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 170,
        height: 280,
        child: Center(
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the content vertically
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Center the content horizontally
                children: [
                  const SizedBox(height: 10.0),
                  Icon(
                    icon,
                    color: Colors.grey[600], // Grey icon color
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    amount,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(subtitle),
                  const SizedBox(height: 10.0),
                  Text(subtitles),
                  const SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for Buy button
                      },
                      child: const Text('Buy'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLanguageMenuItem(String language) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language),
        const Icon(
          Icons.check,
          color: Colors.purple,
        ),
      ],
    );
  }
}
