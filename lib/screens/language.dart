import 'package:flutter/material.dart';
import 'package:listners_app/screens/home.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  List<String> selectedLanguages = ['English']; // Default language

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
                child: Image.asset(
                  'assets/images/friendly.png',
                  height: 500,
                  width: 500,
                ),
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
                height: 550,
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
                      'Please select your language',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    buildLanguageCheckbox('Malayalam'),
                    buildLanguageCheckbox('English'),
                    buildLanguageCheckbox('Hindi'),
                    buildLanguageCheckbox('Kannada'),
                    buildLanguageCheckbox('Tamil'),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the home page with the selected languages
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Home(
                              language: selectedLanguages,
                              languages: const [],
                            ),
                          ),
                        );
                      },
                      child: const Text('OK'),
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

  Widget buildLanguageCheckbox(String language) {
    return Row(
      children: [
        Checkbox(
          value: selectedLanguages.contains(language),
          onChanged: (bool? value) {
            setState(() {
              if (value!) {
                selectedLanguages.add(language);
              } else {
                selectedLanguages.remove(language);
              }
            });
          },
        ),
        Text(language),
      ],
    );
  }
}
