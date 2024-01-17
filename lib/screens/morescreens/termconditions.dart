// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/morescreens/earnings.dart';

class TermConditions extends StatelessWidget {
  const TermConditions({super.key});

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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Card(
            elevation: 30.0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terms & Conditions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 10.0),

                  Text(
                    ' Terms and Conditions for Friendlytalks',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    ' Introduction',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),

                  Text(
                    'These Website Standard Terms and Conditions written on this webpage shall manage your use of our website, Friendlytalks accessible at https://friendlytalks.in.These Terms will be applied fully and affect to your use of this Website. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this Website if you disagree with any of these Website Standard Terms and Conditions. These Terms and Conditions have been generated with the help of the Terms And Conditiions Sample Generator.Minors or people below 18 years old are not allowed to use this Website.',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Intellectual Property Rights',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),

                  Text(
                    'Other than the content you own, under these Terms, Friendlytalks and/or its licensors own all the intellectual property rights and materials contained in this Website.You are granted limited license only for purposes of viewing the material contained on this Website.',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    'Restrictions',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'You are specifically restricted from all of the following:publishing any Website material in any other mediaselling, sublicensing and/or otherwise commercializing any Website material;publicly performing and/or showing any Website material;using this Website in any way that is or may be damaging to this Website;using this Website in any way that impacts user access to this Website;using this Website contrary to applicable laws and regulations, or in any way may cause harm to the Website, or to any person or business entity;engaging in any data mining, data harvesting, data extracting or any other similar activity in relation to this Website;using this Website to engage in any advertising or marketing.Certain areas of this Website are restricted from being access by you and Friendlytalks may further restrict access by you to any areas of this Website, at any time, in absolute discretion. Any user ID and password you may have for this Website are confidential and you must maintain confidentiality as well.',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Your Content',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'In these Website Standard Terms and Conditions, "Your Content" shall mean any audio, video text, images or other material you choose to display on this Website. By displaying Your Content, you grant Friendlytalks a non-exclusive, worldwide irrevocable, sub licensable license to use, reproduce, adapt, publish, translate and distribute it in any and all media.Your Content must be your own and must not be invading any third-partys rights. Friendlytalks reserves the right to remove any of Your Content from this Website at any time without notice.',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'No warranties',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Your Order Cancellation Rights',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'You are entitled to cancel Your Order within 7 days without giving any reason for doing so.The deadline for cancelling an Order is 7 days from the date on which You received the Goods or on which a third party you have appointed, who is not the carrier, takes possession of the product delivered.In order to exercise Your right of cancellation, You must inform Us of your decision by means of a clear statement. You can inform us of your decision by:By visiting this page on our website: https://friendlytalks.in.We will reimburse You no later than 14 days from the day on which We receive the returned Goods. We will use the same means of payment as You used for the Order, and You will not incur any fees for such reimbursement.',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Conditions for Returns',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'In order for the Goods to be eligible for a return, please make sure that:The Goods were purchased in the last 7 days.The Goods are in the original packagingThe following Goods cannot be returned:.The supply of Goods made to Your specifications or clearly personalized.The supply of Goods which according to their nature are not suitable to be returned, deteriorate rapidly or where the date of expiry is over.The supply of Goods which are not suitable for return due to health protection or hygiene reasons and were unsealed after delivery.The supply of Goods which are, after delivery, according to their nature, inseparably mixed with other items.We reserve the right to refuse returns of any merchandise that does not meet the above return conditions in our sole discretion.Only regular priced Goods may be refunded. Unfortunately, Goods on sale cannot be refunded. This exclusion may not apply to You if it is not permitted by applicable law.',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10.0),

                  // Add more policy details as needed
                ],
              ),
            ),
          ),
          // Add more cards for different sections of the policy if necessary
        ],
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
}
