import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listners_app/Controller/ProfileController/ProfileController.dart';

class LanguageSelectionPopup extends StatelessWidget {
  final ProfileController controller = Get.find();



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Language'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 1; i < controller.languages.length+1; i++)
              Obx(() => ListTile(
                title: Text(controller.languages[i-1].name),
                leading: Checkbox(
                  value:controller.selectedLanguages[i],
                  onChanged: (value) {
                    controller.selectLanguage(i);
                  },
                ),
              )),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Close the dialog
            Get.back();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () async{
            // Save selected languages to another variable
           await controller.updateLanguages(controller.languageId.toString());
            // Do something with selected languages
            print("lang${controller.languageId.toString()}");
            // Close the dialog
            Get.back();
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
