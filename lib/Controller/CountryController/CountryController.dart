import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/countryCodeModel/CountryModel.dart';

class CountryCodeController extends GetxController {
  RxString selectedCountryCode = "91".obs; // Default selection
  RxList<CountryModel> countries = <CountryModel>[].obs;

  void setSelectedCountryCode(String countryCode) {
    selectedCountryCode.value = countryCode;
  }

  void setCountries(List<CountryModel> countryList) {
    countries.assignAll(countryList);
  }
}