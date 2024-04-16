import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listners_app/Controller/AuthController/AuthController.dart';
import 'package:listners_app/Widgets/AppBarWidget.dart';
import 'package:listners_app/Widgets/BottomNavigationBarWidget.dart';

class Earnings extends StatefulWidget {
  const Earnings({super.key});

  @override
  State<Earnings> createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
  AuthController controller=Get.find();

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    controller.callMethod();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarWidget(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSmallBox('No of Calls', Icons.phone_callback_rounded,
                    '13', Colors.green, Colors.green),
                _buildSmallBox('Total Call Hours', Icons.timer_rounded, '0hrs',
                    Colors.blue, Colors.blue),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 365.0, // Adjust width as needed
              height: 350.0, // Adjust height as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align to the start
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.orange, // Adjust color as needed
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.monetization_on, // Icon for Coins Earned
                              color: Colors.white,
                              size: 25.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                            width:
                                10), // Adjust spacing between the icon box and text
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Coins Earned', // Add your text here
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "As your slab rate coins to cash amount", // Additional text
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 365, // Adjust width to fill the entire main box
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10, // Apply blur to the border
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(() => _buildInnerBox('Your Coins', controller.earnCoin.value)),
                          _buildArrowBox(),
                          _buildInnerBox('Required Coins', '960000'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: EasyButton(
                        borderRadius: 20,
                        buttonColor: int.parse(controller.earnCoin.value) >= 960000?Colors.pink:Colors.grey,
                        loadingStateWidget: const CircularProgressIndicator(),
                        onPressed: () async{
                          if(int.parse(controller.earnCoin.value)>=960000) {
                            await controller.requestPayOut();
                          }
                        },
                        idleStateWidget: Text(int.parse(controller.earnCoin.value) >= 960000?"REQUEST WITHDRAW":'MINIMUM COIN IS NOT PRESENT',style: TextStyle(color: int.parse(controller.earnCoin.value) >= 960000?Colors.white:Colors.black),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: 365.0, // Adjust width as needed
              height: 350.0, // Adjust height as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align to the start
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.yellow, // Adjust color as needed
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.monetization_on, // Icon for Coins Earned
                              color: Colors.white,
                              size: 25.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                            width:
                                10), // Adjust spacing between the icon box and text
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' Free Coins Earned', // Add your text here
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "As your slab rate coins to cash amount", // Additional text
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 365, // Adjust width to fill the entire main box
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10, // Apply blur to the border
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(() => _buildInnerBox('Your Free Coins', controller.freeCoin.value)),
                          _buildArrowBox(),
                          _buildInnerBox('Required Free Coins', '960000'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child:  EasyButton(
                        borderRadius: 20,
                        buttonColor: int.parse(controller.earnCoin.value) >= 960000?Colors.pink:Colors.grey,
                        loadingStateWidget: const CircularProgressIndicator(),
                        onPressed: () async{

                        },
                        idleStateWidget: Text(int.parse(controller.earnCoin.value) >= 960000?"REQUEST WITHDRAW":'MINIMUM COIN IS NOT PRESENT',style: TextStyle(color: int.parse(controller.earnCoin.value) >= 960000?Colors.white:Colors.black),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomWidget(),
    );
  }

  Widget _buildSmallBox(String label, IconData icon, String value,
      Color boxColor, Color iconBoxColor) {
    return Container(
      width: 180.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: Colors.white, // Big box color
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Adjust padding as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 45.0,
              height: 75.0,
              decoration: BoxDecoration(
                color: iconBoxColor, // Icon box color
                borderRadius: BorderRadius.circular(7.0), // Rounded corners
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ), // Adjust spacing between the icon box and text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black, // Adjust text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black, // Adjust text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildInnerBox(String title, String value) {
  return Container(
    width: 100,
    height: 70,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey.withOpacity(0.5),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget _buildArrowBox() {
  return Container(
    width: 50,
    height: 70,
    decoration: BoxDecoration(
      color: Colors.green, // Color of the small box
      borderRadius: BorderRadius.circular(15.0), // Curve the edges
    ),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ],
    ),
  );
}
