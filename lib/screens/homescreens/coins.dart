import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:listners_app/Controller/AuthController/AuthController.dart';
import 'package:listners_app/screens/homescreens/recharge.dart';

import '../../Constant.dart';
import '../../Controller/CoinDataController/CoinController.dart';
import '../../Models/coin_model/coin_model.dart';
import '../../Models/current_user/current_user.dart';
import '../../Widgets/AppBarWidget.dart';

import '../../Widgets/BottomNavigationBarWidget.dart';
import '../widgets/CoinBuilder.dart';

class Coins extends StatefulWidget {
  const Coins({
    super.key,
  });

  @override
  State<Coins> createState() => _CoinsState();
}

class _CoinsState extends State<Coins> with TickerProviderStateMixin {
  CoinController controller = Get.put(CoinController());

  CurrentUser currentUser = CurrentUser();

  AuthController loginController = Get.find();

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var datas = loginController.currentUser.value.data![0];
    return Scaffold(
        appBar: AppBarWidget(context),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          // Colors.purple,
                          Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    datas.profileImage != null
                        ? CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage("$imageUrl${datas.profileImage}"))
                        : const CircleAvatar(
                            backgroundColor: Color(0xffE6E6E6),
                            radius: 30,
                            child: Icon(
                              Icons.person,
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                    const SizedBox(height: 10),
                    Text(
                      datas.name!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent,
                        ),
                        onPressed: () {
                          // Navigate to coin collection page
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => CoinCollectionPage()));
                        },
                        child: Text(
                          loginController.earnCoin.value,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 42),
                        )),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Coin Balance,

              TabBar(
                  labelStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), // Creates border
                      color: Colors.purple.shade200),
                  controller: tabController,
                  tabs: const [
                    Tab(
                      text: '   COIN CREDIT  ',
                    ),
                    Tab(
                      text: "   PURCHASE    ",
                    ),
                  ]),
              Expanded(
                child: TabBarView(controller: tabController, children: [
                  CoinBuilder(
                    filterKey: 'Coin credited due to call',
                  ),
                  CoinBuilder(
                    filterKey: 'Coin Purchased',
                  )
                ]),
              ),

              const SizedBox(height: 20),

              const SizedBox(height: 20),

              // Money Symbol and Text
            ],
          ),
        ),
        bottomNavigationBar: const BottomWidget());
  }
}
