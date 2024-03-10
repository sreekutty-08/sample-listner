import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:listners_app/Controller/AuthController/AuthController.dart';


import '../../Constant.dart';
import '../../Controller/CallHistoryController/HistoryController.dart';
import '../../HelperFunction/HelperFunction.dart';
import '../../Models/call_history_data/call_history_data.dart';
import '../../Models/user_data/user_data.dart';
import '../../Widgets/AppBarWidget.dart';
import '../../Widgets/BottomNavigationBarWidget.dart';

class CallHistory extends StatelessWidget {
  const CallHistory({super.key});

  @override
  Widget build(BuildContext context) {
    HistoryController controller = Get.put(HistoryController());
    AuthController loginController = Get.find();
    var datas = loginController.currentUser.value.data![0];
    return Scaffold(
        appBar: AppBarWidget(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Call History',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Implement delete all functionality
                      Get.defaultDialog(
                          title: "Alert",
                          middleText: "Do you want clear call history?",
                          onConfirm: () async {
                            await controller.deleteAll();
                            Get.back();
                          },
                          onCancel: () {
                            Get.back();
                          },
                          buttonColor: Colors.purple);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.delete_forever, color: Colors.red),
                        SizedBox(width: 8.0),
                        Text(
                          'Delete All',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white, // Adjust color as needed
                  ),
                  child: FutureBuilder(
                    future: controller.fetchCallHistoryData(userId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        if (snapshot.data is String) {
                          return const Center(
                            child: Text("No History"),
                          );
                        } else {
                          CallHistoryData callHistory = snapshot.data;
                          return ListView.builder(
                            itemCount: callHistory.data!.length,
                            itemBuilder: (context, index) {
                              return FutureBuilder<dynamic>(
                                future: controller.fetchUserData(
                                    callHistory.data![index].userId),
                                builder: (context, userSnapshot) {
                                  if (userSnapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Container();
                                  } else if (userSnapshot.hasError) {
                                    return Text('Error: ${userSnapshot.error}');
                                  } else {
                                    UserData userDetails = userSnapshot.data!;

                                    return _buildCallEntry(
                                        profilePhoto:
                                            userDetails.data![0].profileImage,
                                        name: userDetails.data![0].name!,
                                        date:
                                            callHistory.data![index].updatedOn!,
                                        coin: callHistory
                                            .data![index].coinCredited!,
                                        duration: int.parse(callHistory
                                            .data![index].callDuration!),
                                        isAttended:
                                            callHistory.data![index].callType ==
                                                "CUT",
                                        onDelete: () async {
                                          await controller.delete(
                                              callHistory.data![index].id!);
                                        });
                                  }
                                },
                              );
                            },
                          );
                        }
                      } else {
                        return const Center(
                            child: Text('No History Available'));
                      }
                    },
                  )),
            ),
          ],
        ),
        bottomNavigationBar: const BottomWidget());
  }

  Widget _buildCallEntry({
    required String? profilePhoto,
    required String name,
    required String date,
    required int duration,
    required bool isAttended,
    required String coin,
    required VoidCallback onDelete,
  }) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) {
        onDelete();
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            profilePhoto==null?const CircleAvatar(
              child: Icon(Icons.person),
            ): CircleAvatar(
              backgroundImage: NetworkImage("$imageUrl$profilePhoto"),
              radius: 30,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const Spacer(),
                      isAttended
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.monetization_on,
                                  color: Colors.amber,
                                ),
                                Text(coin)
                              ],
                            )
                          : Container(),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: onDelete,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                isAttended
                    ? Text(
                        '${duration ~/ 60}:${duration % 60}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      )
                    : Container(),
                const SizedBox(height: 4.0),
                Icon(
                  isAttended ? Icons.call_received : Icons.call_missed,
                  color: isAttended ? Colors.green : Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
