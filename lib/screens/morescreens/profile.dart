import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listners_app/Controller/AuthController/AuthController.dart';
import '../../Widgets/AppBarWidget.dart';
import '../../Widgets/BottomNavigationBarWidget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthController controller = Get.find();
  // Track password visibility
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    var data = controller.currentUser.value.data![0];
    String? name = controller.currentUser.value.data![0].name;
    String? mobile = data.mobile;
    String? email = data.email;
    String? walletBalance = '\$500.00';
    int? coinBalance = 100;
    String? aboutMe = 'I love Friendly Talks!';
    String? selectedLanguage = 'English';

    return Scaffold(
      appBar: AppBarWidget(context),
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
            buildDetailRow('Name', name!, () => updateProfileField('Name')),
            buildDetailRow(
                'Mobile', mobile!, () => updateProfileField('Mobile')),
            buildDetailRow('Email', email!, () => updateProfileField('Email')),
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
      bottomNavigationBar: const BottomWidget(),
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
