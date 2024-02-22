import 'package:flutter/material.dart';
import 'package:listners_app/Controller/AuthController/AuthController.dart';
import 'package:listners_app/screens/login.dart';
import 'package:get/get.dart';
import 'package:listners_app/screens/otpverify.dart';

import '../Controller/CountryController/ApiService.dart';
import '../Controller/CountryController/CountryController.dart';
import '../Models/countryCodeModel/CountryModel.dart';

class Otppage extends StatefulWidget {
  const Otppage({super.key});

  @override
  State<Otppage> createState() => _OtppageState();
}

final CountryCodeController _countryCodeController =
    Get.put(CountryCodeController());
final AuthController controller = Get.put(AuthController());
Future<void> _initializeCountryData() async {
  try {
    List<CountryModel> countries = await ApiService().getCountries();
    _countryCodeController.setCountries(countries);
  } catch (error) {
    // Handle error
    print("Error initializing country data: $error");
  }
}

class _OtppageState extends State<Otppage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.pink, Colors.white],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Flexible(
                child: Image.asset('assets/images/friendly.png',
                    height: 500, width: 500),
              ),
              const SizedBox(height: 15),
              const Text(
                'Welcome!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 590,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please Enter your Number',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => DropdownButton(
                        value: _countryCodeController.selectedCountryCode.value,
                        items: _countryCodeController.countries.map((country) {
                          return DropdownMenuItem(
                            value: country.mobileCode,
                            child: Text(
                                "${country.name} (+${country.mobileCode})"),
                          );
                        }).toList(),
                        onChanged: (value) {
                          _countryCodeController
                              .setSelectedCountryCode(value.toString());
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        controller: controller.phoneController,
                        decoration: const InputDecoration(
                          labelText: 'Mobile Number',
                          suffixIcon: Icon(Icons.phone_callback),
                          labelStyle: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.fetchApi(
                            _countryCodeController.selectedCountryCode.value);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            colors: [Colors.pink, Colors.pink, Colors.pink],
                          ),
                        ),
                        child: const Text(
                          'PROCEED SECURELY',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30), // Removed 'const' from SizedBox
                    GestureDetector(
                      onTap: () {
                      Get.to(const Login());
                      },
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Login using Password',
                              style: TextStyle(
                                color: Colors.pinkAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
