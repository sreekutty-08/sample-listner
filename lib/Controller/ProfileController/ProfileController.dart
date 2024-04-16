import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:listners_app/HelperFunction/HelperFunction.dart';

import '../../Models/Languages/Languages.dart';
import '../../Models/listener_data/listener_data.dart';
class ProfileController extends GetxController{
  RxList<String> languageId = [""].obs;
  RxList<bool> selectedLanguages = List.generate(5, (index) => false).obs;
  var languages = <Language>[
    Language(id: "1", name: "English"),
    Language(id: "2", name: "Malayalam"),
    Language(id: "3", name: "Tamil"),
    Language(id: "4", name: "Hindi"),
    // Add more languages as needed
  ].obs;



  void selectLanguage(int index) {
    selectedLanguages[index] = !selectedLanguages[index];
    if (languageId.contains(index.toString())) {
      print("remove");
      languageId.remove(index.toString());
    } else {
      print("added");
      languageId.add(index.toString());
    }

    update();

    // Concatenate the selected indices into the languageId string
  }
  // void toggleSelection(int index) {
  //   languages[index].isSelected = !languages[index].isSelected;
  // }

  String? delete;

  Future updateUserData(String userName,String email)async{
    final apiUrl='https://friendlytalks.in/admin/api/v1/profile-update.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId&email=$email&name=$userName';

     try{
       final response=await http.get(Uri.parse(apiUrl));
       if(response.statusCode==200){
         Map<String,dynamic>data=json.decode(response.body);

         print("Succesfully updated");
       }else{
         print("failed");
       }
     }catch(e){
       return "Error: $e";
     }
  }
  Future updatePassword(String password)async{
    final apiUrl='https://friendlytalks.in/admin/api/v1/password-update.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId&password=$password';

    try{
      final response=await http.get(Uri.parse(apiUrl));
      if(response.statusCode==200){
        Map<String,dynamic>data=json.decode(response.body);

        print("Succesfully updated");
      }else{
        print("failed");
      }



    }catch(e){
      return "Error: $e";
    }
  }

  Future updateAbout(String about)async{
    final apiUrl='https://friendlytalks.in/admin/api/v1/about-update.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId&about=$about';

    try{
      final response=await http.get(Uri.parse(apiUrl));
      if(response.statusCode==200){
        Map<String,dynamic>data=json.decode(response.body);

        print("Succesfully updated");
      }else{
        print("failed");
      }



    }catch(e){
      return "Error: $e";
    }
  }

  Future updateDp(String imageUrl)async{
    final apiUrl='https://friendlytalks.in/admin/api/v1/profile-image.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId&profile_image=$imageUrl';

    try{
      print(imageUrl);
      final response=await http.get(Uri.parse(apiUrl));
      if(response.statusCode==200){
        Map<String,dynamic>data=json.decode(response.body);

        print("Succesfully updated");
      }else{
        print("failed");
      }



    }catch(e){
      return "Error: $e";
    }
  }

  Future fetchAbout() async {
    final apiUrl =
        "https://friendlytalks.in/admin/api/v1/user-details.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId";

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        return ListenerData.fromJson(jsonData);
      } else {
        return "Error : ${response.statusCode}";
      }
    } catch (e) {
      return "Error : $e";
    }
  }
  Future<void> uploadImage(File imageFile,String imageUrl) async {
    // Replace 'https://friendlytalks.in/admin/uploads/profile/' with your actual URL
    var url = Uri.parse('https://friendlytalks.in/admin/api/v1/saveFile.php');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Add the file to the request
    var multipartFile = await http.MultipartFile.fromPath('file', imageFile.path,filename: imageUrl);
    request.files.add(multipartFile);

    // Send the request
    var response = await request.send();

    // Check if the request was successful
    if (response.statusCode == 200) {
      print("image $imageUrl");
    await  updateDp(imageUrl);
      print('Image uploaded successfully');
    } else {
      print('Failed to upload image. Error: ${response.reasonPhrase}');
    }
  }
  Future updateLanguages(String languages)async{
    final apiUrl='https://friendlytalks.in/admin/api/v1/language-add.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId&lang=$languages';

    try{
      print("hhhsss$languages");
      final response=await http.get(Uri.parse(apiUrl));
      if(response.statusCode==200){
        Map<String,dynamic>data=json.decode(response.body);
        ListenerData listenerData=ListenerData.fromJson(data);
        print("Succesfully updatedsdsdfdsdfgfedfgfe");
      }else{
        print("failed");
      }



    }catch(e){
      return "Error: $e";
    }
  }

  Future deleteAccount()async{
    final apiUrl='https://friendlytalks.in/admin/api/v1/delete-request.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId';

    try{
      final response=await http.get(Uri.parse(apiUrl));
      if(response.statusCode==200){
        Map<String,dynamic>data=json.decode(response.body);
        print("Deletion is pending");
        return delete=data['data'];

      }else{
        print("failed");
      }
    }catch(e){
      return "Error: $e";
    }
  }
}