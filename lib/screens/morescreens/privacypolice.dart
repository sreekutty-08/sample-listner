// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:listners_app/Widgets/AppBarWidget.dart';
import 'package:listners_app/Widgets/BottomNavigationBarWidget.dart';
import 'package:listners_app/screens/home.dart';
import 'package:listners_app/screens/homescreens/support.dart';
import 'package:listners_app/screens/homescreens/coins.dart';
import 'package:listners_app/screens/homescreens/more.dart';
import 'package:listners_app/screens/homescreens/notifications.dart';
import 'package:listners_app/screens/morescreens/earnings.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(context),
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
                      'privacy policy',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'privacy policy for friendlytalks',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),

                    Text(
                      'At Friendlytalks, accessible from https://friendlytalks.in, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Friendlytalks and how we use it.If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Friendlytalks. This policy is not applicable to any information collected offline or via channels other than this website.',
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'consent',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'By using our website, you hereby consent to our Privacy Policy and agree to its terms.',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Definitions',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'For the purposes of this Return and Refund Policy:Company (referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to Friendlytalks, Kerala,India.',
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Goods refer to the items offered for sale on the Service.Orders mean a request by You to purchase Goods from Us.Service refers to the Website.Website refers to Friendlytalks, accessible from https://friendlytalks.inYou means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.',
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.justify,
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
        bottomNavigationBar: BottomWidget());
  }
}
