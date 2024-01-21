import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listners_app/Constant.dart';
import 'package:listners_app/Controller/AuthController/AuthController.dart';
import 'package:listners_app/Models/current_user/current_user.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/morescreens/callhistory.dart';
import 'package:listners_app/screens/morescreens/earnings.dart';
import 'package:listners_app/screens/morescreens/profile.dart';

class Home extends StatelessWidget {
  final List<String> languages;

  const Home({
    super.key,
    required this.languages,
    required List<String> language,
  });

  BuildContext? get builderContext => null;

  @override
  Widget build(BuildContext context) {
    AuthController controller=Get.find();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Profile(),
                    ),
                  );
                },
                child:  Row(
                  children: [
                    controller.currentUser.value.data![0].profileImage != null
                        ? CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "$imageUrl${controller.currentUser.value.data![0].profileImage}"))
                        : const CircleAvatar(
                      backgroundColor: Color(0xffE6E6E6),
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        color: Color(0xffCCCCCC),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.currentUser.value.data![0].name!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const Text(
                          'Online',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the "Earnings" page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const Earnings(), // Replace with the actual page you want to navigate to
                      ),
                    );
                  },
                  child: _buildStyledContainer(
                    'Coin Earned',
                    Icons.currency_exchange,
                    '2000',
                    Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the "Earnings" page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const Earnings(), // Replace with the actual page you want to navigate to
                      ),
                    );
                  },
                  child: _buildStyledContainer(
                    'Free Coin Earned',
                    Icons.attach_money_rounded,
                    '400',
                    Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the "Call History" page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CallHistory(), // Replace with the actual page you want to navigate to
                      ),
                    );
                  },
                  child: _buildStyledContainer(
                    'No of Call',
                    Icons.phone_callback_rounded,
                    '10',
                    Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the "Call History" page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CallHistory(), // Replace with the actual page you want to navigate to
                      ),
                    );
                  },
                  child: _buildStyledContainer(
                    'Total Call Hours',
                    Icons.timer_rounded,
                    '11.25',
                    Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Home(
                    languages: [],
                    language: [],
                  ),
                ),
              );
              break;

            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Coins(),
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
                  builder: (BuildContext context) => const Notifications(),
                ),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const More(),
                ),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), label: 'Coins'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}

// ignore: avoid_types_as_parameter_names
Widget _buildStyledContainer(
    String label, IconData icon, String title, Color containerColor) {
  return Container(
    height: 90.0,
    width: 170.0,
    decoration: BoxDecoration(
      color: containerColor, // Use the provided parameter name here
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.pink[600],
          size: 25.0,
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
