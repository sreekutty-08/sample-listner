import 'dart:convert';


import 'package:get/get.dart';

import '../../HelperFunction/HelperFunction.dart';
import '../../Models/call_history_data/call_history_data.dart';
import '../../Models/user_data/user_data.dart';

import 'package:http/http.dart' as http;

class HistoryController extends GetxController {
  final Rx<CallHistoryData> callHistoryData = CallHistoryData().obs;
  final Rx<UserData> userData = UserData().obs;

  Future fetchCallHistoryData(userId) async {
    final apiUrl =
        "https://friendlytalks.in/admin/api/v1/callhistory.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId&user_level=4";
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print("successfully fetch $userId");
        return callHistoryData(CallHistoryData.fromJson(jsonResponse));
      } else {
        throw Exception('Failed to load data${response.statusCode}');
      }

      // Assuming you have a user ID in your call history data
    } catch (error) {
      // Handle errors
      print('Error fetching call history data: $error');
    }
  }

  Future fetchUserData(userId) async {
    final apiUrl =
        "https://friendlytalks.in/admin/api/v1/index.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId";
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print("successfully fetch userData$userId");
        return userData(UserData.fromJson(jsonResponse));
      } else {
        throw Exception('Failed to load data${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
  Future delete(String index)async{
    final apiUrl="https://friendlytalks.in/admin/api/v1/delete-callhistory.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId&user_level=5&callhistory_id=$index&deletetype=0";
    try{
      final response=await http.get(Uri.parse(apiUrl));
      if(response.statusCode==200){
        print("DElete success");
      }else{
        return "Error : ${response.statusCode}";
      }
    }catch(e){
      return "Error : $e";
    }
  }

  Future deleteAll()async{
    final apiUrl="https://friendlytalks.in/admin/api/v1/delete-callhistory.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId&user_level=5&callhistory_id=0&deletetype=1";
    try{
      final response=await http.get(Uri.parse(apiUrl));
      if(response.statusCode==200){
        print("Delete successfully");
      }else{
        return "Error: ${response.statusCode}";
      }

    }catch(e){
      return "Error : $e";
    }
  }

}
