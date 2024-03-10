import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';
import 'package:listners_app/Controller/AuthController/AuthController.dart';
import 'package:listners_app/Models/current_user/current_user.dart';
import 'package:listners_app/Models/user_data/user_data.dart';

import '../../HelperFunction/HelperFunction.dart';
import '../../screens/home.dart';

class PasswordController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController controller = Get.put(AuthController());
  late String password;
  var userData = CurrentUser().obs;

  void generateMd5(String input) {
    password = md5.convert(utf8.encode(input)).toString();
  }

  Future fetchUserData(context, String country, String mobileNumber) async {
    final apiUrl =
        "https://friendlytalks.in/admin/api/v1/index.php?token=c97369129e36336e71096aabf2270aba";

    final countrycode = country;
    final compinedMobile = "$countrycode$mobileNumber";

    try {
      print(compinedMobile);
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        generateMd5(passwordController.text);
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        final data = UserData.fromJson(jsonResponse);
        if (data.hasMobileNumberforLogin(compinedMobile)) {
          await fetchListenerData(userId);
          if (userData.value.data![0].password == password) {
            await controller.fetchDataFromApi();
            HelperFunction.saveUserIdSF(userId);
            HelperFunction.saveUserLoggedInStatus(true);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => WillPopScope(
                  onWillPop: () async {
                    return false;
                  },
                  child: const Home(),
                ),
              ),
            );
          } else {
            Get.defaultDialog(
                title: "Incorrect Password", middleText: "Please try again ");
          }
        } else {
          Get.defaultDialog(
              title: "Error",
              middleText: "Please enter registered mobile number");
        }
      } else {
        return "Error : ${response.statusCode}";
      }
    } catch (e) {
      return "Error : $e";
    }
  }

  Future fetchListenerData(String userIdf) async {
    final apiUrl =
        "https://friendlytalks.in/admin/api/v1/index.php?token=c97369129e36336e71096aabf2270aba&user_id=$userIdf";

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        userData(CurrentUser.fromJson(jsonResponse));
      } else {
        return "Error : ${response.statusCode}";
      }
    } catch (e) {
      return "Error : $e";
    }
  }
}
