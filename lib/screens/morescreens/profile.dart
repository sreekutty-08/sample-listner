import 'package:flutter/material.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/morescreens/earnings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = 'Arunima';
  String mobile = '123-456-7890';
  String email = 'arunima.doe@example.com';
  String walletBalance = '\$500.00';
  int coinBalance = 100;
  String aboutMe = 'I love Friendly Talks!';
  String selectedLanguage = 'English';
  bool showPassword = false; // Track password visibility

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Image and Update Button
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/photo.jpg'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement image upload functionality
                    },
                    child: const Icon(
                      Icons.upload_file,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            // User Details Section
            buildSectionHeader('Listner Details'),
            buildDetailRow('Name', name, () => updateProfileField('Name')),
            buildDetailRow(
                'Mobile', mobile, () => updateProfileField('Mobile')),
            buildDetailRow('Email', email, () => updateProfileField('Email')),
            const SizedBox(height: 20.0),

            // Language Section
            buildSectionHeader('Language'),
            buildDetailRow('Language', selectedLanguage,
                () => updateProfileField('Language')),
            const SizedBox(height: 20.0),

            // Password Section
            buildSectionHeader('Password'),
            buildPasswordRow('Password'),
            buildPasswordRow('Confirm Password'),
            ElevatedButton(
              onPressed: () {
                // Implement update password functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: const Text('UPDATE PASSWORD'),
            ),
            const SizedBox(height: 20.0),

            // About Me Section
            buildSectionHeader('About Me'),
            buildDetailRow(
              'About Me',
              aboutMe,
              () => updateProfileField('About Me'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement update about functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: const Text('UPDATE ABOUT'),
            ),
            const SizedBox(height: 20.0),

            // Delete Account Section
            buildSectionHeader('Delete Account'),
            ElevatedButton(
              onPressed: () {
                // Implement delete account functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: const Text('Delete My Account'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 4,
        onTap: (int index) {
          switch (index) {
            case 0:
              // Reload the Home page
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
          BottomNavigationBarItem(
              icon: Icon(Icons.call, size: 32.0), label: 'support'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget buildDetailRow(String label, String value, VoidCallback onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Row(
          children: [
            Text(value),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onPressed,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPasswordRow(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Row(
          children: [
            // Display asterisks for password
            const Text('************'),
            // Use a conditional statement to switch between password visibility icons
            showPassword
                ? IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  )
                : IconButton(
                    icon: const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
          ],
        ),
      ],
    );
  }
}

updateProfileField(String s) {}
