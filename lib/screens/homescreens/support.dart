import 'package:flutter/material.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/morescreens/earnings.dart';

class Support extends StatelessWidget {
  final String whatsappNumber = '8075064394';
  const Support({super.key});

  void openWhatsAppChat() async {
    String url = 'https://wa.me/$whatsappNumber';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/whatsuplogo.png', // Replace with your logo asset
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: openWhatsAppChat,
                child: const Text('Chat with Us on WhatsApp'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          currentIndex: 2,
          onTap: (int index) {
            switch (index) {
              case 0:
                // Reload the Home page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Home(
                      languages: [], // Provide the necessary data if needed
                      language: [], // Provide the necessary data if needed
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
            BottomNavigationBarItem(
                icon: Icon(Icons.call, size: 32.0), // Increase the icon size
                label: 'support'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: 'More'),
          ],
        ));
  }

  canLaunch(String url) {}

  launch(String url) {}
}
