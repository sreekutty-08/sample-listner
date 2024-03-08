import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import '../../HelperFunction/HelperFunction.dart';
import '../../Models/coin_transaction/coin_transaction.dart';
 class CoinController extends GetxController{






   Future fetchTransaction() async {
     final apiUrl =
         "https://friendlytalks.in/admin/api/v1/coin-transaction.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId";
     try {
       final response = await http.get(Uri.parse(apiUrl));
       if (response.statusCode == 200) {
         Map<String, dynamic> jsonResponse = json.decode(response.body);
         return CoinTransaction.fromJson(jsonResponse);
       } else {
         return "Error : ${response.statusCode}";
       }
     } catch (e) {
       return "Error : $e";
     }
   }
 }