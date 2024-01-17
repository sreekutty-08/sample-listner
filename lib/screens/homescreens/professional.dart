import 'package:flutter/material.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';

class Professional extends StatelessWidget {
  const Professional({super.key});

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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
        onTap: (int index) {
          // Handle navigation based on the selected index
          switch (index) {
            case 0:
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
              icon: Icon(Icons.call, size: 32.0), label: 'support'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
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
