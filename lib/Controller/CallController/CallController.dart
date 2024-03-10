import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:listners_app/HelperFunction/HelperFunction.dart';
import 'package:listners_app/Models/call_model/call_model.dart';
import 'package:listners_app/Models/user_data/user_data.dart';
import 'package:listners_app/screens/IncomingCallScreen.dart';
import 'package:listners_app/screens/home.dart';

class CallController extends GetxController {
  RxBool callScreenPushed = false.obs;
  var callModel = CallModel().obs;
  var userData = UserData().obs;

  void checkIncomingCalls() async {
    final apiUrl =
        "https://friendlytalks.in/admin/api/v1/incoming-call-check.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId&user_level=4";
    try {
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        callModel(CallModel.fromJson(jsonResponse));
        bool hasIncomingCall = callModel.value.datas?[0].userId != null;
        print(hasIncomingCall);
        if (hasIncomingCall && !callScreenPushed.value) {
          // Navigate to the call screen only if it hasn't been pushed already
          callScreenPushed.value = true;
          await fetchCallerDetail(callModel.value.datas![0].userId!);
          AwesomeNotifications().createNotification(
            content: NotificationContent(
              id: 123,
              channelKey: "Call_channel",
              color: Colors.white,
              title: "Incoming Call",
              body: userData.value.data![0].name,
              category: NotificationCategory.Call,
              wakeUpScreen: true,
              fullScreenIntent: true,
              autoDismissible: true,
              backgroundColor: Colors.purple,
            ),
            actionButtons: [
              NotificationActionButton(
                  key: "accept",
                  label: "Accept",
                  color: Colors.green,
                  autoDismissible: true),
              NotificationActionButton(
                  key: "reject",
                  label: "Ignore",
                  color: Colors.red,
                  autoDismissible: true),
            ],
          );
        } else if (!hasIncomingCall) {
          // Reset the flag if there is no incoming call
          callScreenPushed.value = false;
        }
      } else {
        // Handle API error
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or other errors
      print('Error: $e');
    }
  }

  Future callCut(progressId) async {
    final apiUrl =
        "https://friendlytalks.in/admin/api/v1/lisiner-callcut.php?token=c97369129e36336e71096aabf2270aba&progressId=$progressId";
    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        Get.offAll(Home());
        print("call cut api is successfull");
      }
    } catch (e) {
      print("Error : dfgh $e");
    }
  }

  Future fetchCallerDetail(String userId1) async {
    final apiUrl =
        "https://friendlytalks.in/admin/api/v1/index.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId1";
    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        userData(UserData.fromJson(jsonResponse));
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  Future updateOnline() async {
    final apiUrl =
        "https://friendlytalks.in/admin/api/v1/online-update.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return "online status updated";
      } else {
        return "Error with : ${response.statusCode}";
      }
    } catch (e) {
      return "Error :$e";
    }
  }
}
