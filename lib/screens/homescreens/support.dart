import 'package:flutter/material.dart';
import 'package:listners_app/Widgets/AppBarWidget.dart';
import 'package:listners_app/Widgets/BottomNavigationBarWidget.dart';
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
        appBar: AppBarWidget(context),
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
        bottomNavigationBar: BottomWidget(),
    );
  }

  canLaunch(String url) {}

  launch(String url) {}
}
