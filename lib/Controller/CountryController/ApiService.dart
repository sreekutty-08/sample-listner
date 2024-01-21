
import 'dart:convert';

import '../../Models/countryCodeModel/CountryModel.dart';
import 'package:http/http.dart'as http;
class ApiService {
  static const String apiUrl = "https://friendlytalks.in/admin/api/v1/country.php?token=c97369129e36336e71096aabf2270aba"; // Replace with your API endpoint

  Future<List<CountryModel>> getCountries() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        List<CountryModel> countries = data.map((json) => CountryModel.fromJson(json)).toList();
        print("countrapi success");
        return countries;
      } else {
        throw Exception("Failed to load countries");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }
}