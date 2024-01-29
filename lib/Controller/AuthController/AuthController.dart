import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listners_app/HelperFunction/HelperFunction.dart';
import 'package:listners_app/screens/otpverify.dart';

import '../../Models/current_user/current_user.dart';
import '../../Models/user_data/datum.dart';
import '../../Models/user_data/user_data.dart';
import '../../screens/home.dart';

class AuthController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  RxString generatedOTP = ''.obs;
  TextEditingController otpController = TextEditingController();
  final apiUrl =
      "https://friendlytalks.in/admin/api/v1/index.php?token=c97369129e36336e71096aabf2270aba";
  var currentUser = CurrentUser().obs;

  String generateOTP(int length) {
    const chars = '0123456789';
    final random = Random();
    String otp = '';

    for (int i = 0; i < length; i++) {
      otp += chars[random.nextInt(chars.length)];
    }
    generatedOTP.value = otp;
    return otp;
  }

  Future fetchApi(countryCode) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      // final countrycode = country.substring(1);
      final compinedMobile = "$countryCode${phoneController.text}";
      if (response.statusCode == 200) {
        final data = UserData.fromJson(json.decode(response.body));
        print(compinedMobile);
        print("countrycode is : $countryCode");
        if (data.hasMobileNumberAndUserLevel(compinedMobile)) {
          generateOTP(4);
          print("successfully generated");
          await sendOtp(phoneController.text, generatedOTP.value);
          Get.to(Otpverify());
        } else {
          Get.defaultDialog(
              title: "Incorrect",
              titleStyle: const TextStyle(color: Colors.red),
              middleText: "Please enter registered mobile number");
        }
      }
    } catch (e) {
      return ("error $e");
    }
  }

  Future sendOtp(String phone, String otpCode) async {
    final apiUrl =
        "https://friendlytalks.in/admin/api/v1/newotp.php?token=c97369129e36336e71096aabf2270aba&mobile=$phone&otp=$otpCode";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return "otp sent";
      } else {
        return response.statusCode;
      }
    } catch (e) {}
  }

  void verifyOTP() {
    // Check if the entered OTP matches the generated OTP
    if (otpController.text == generatedOTP.value) {
      print('OTP matched! Proceed to registration page.');
      fetchDataFromApi().whenComplete(() => Get.to(const Home(
            languages: ["english"],
            language: ["hsjk"],
          )));
      // Add your navigation logic to the registration page here using Get.to or Get.off
    } else {
      print('Invalid OTP. Please try again.');
      // Handle the case when the OTPs do not match, you might want to give the user another chance or take appropriate action.
    }
  }

  Future<CurrentUser?> fetchDataFromApi() async {
    final apiUrl =
        "https://friendlytalks.in/admin/api/v1/index.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        currentUser(CurrentUser.fromJson(jsonResponse));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("faild  $e");
      return null;
    }
  }
}
