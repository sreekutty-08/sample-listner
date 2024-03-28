import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listners_app/Controller/AuthController/AuthController.dart';
import 'package:listners_app/Controller/ProfileController/ProfileController.dart';
import 'package:listners_app/Models/Languages/Languages.dart';
import '../../Constant.dart';
import '../../Models/listener_data/listener_data.dart';
import '../../Widgets/AppBarWidget.dart';
import '../../Widgets/BottomNavigationBarWidget.dart';
import 'dart:io';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static List<Language> languages = [
 Language(id: "1", name: "English"),
    Language(id: "2", name: "Malayalam"),
    Language(id: "3", name: "Tamil"),
    Language(id: "4", name: "Hindi"),
  ];
  List<String> selectedChoices = [];
  AuthController controller = Get.find();
  ProfileController profileController=Get.put(ProfileController());
  String? aboutMe='';
  ListenerData? listenerData;
  String? language = "2";
  @override
  void initState() {
    // TODO: implement initState
    fetchAbout();
    super.initState();
  }

  Future<void> fetchAbout() async {
    listenerData = await profileController.fetchAbout();
    setState(() {
      aboutMe = listenerData!.data![0].about;
      language=listenerData!.data![0].langId;
    });
  }

  // Track password visibility
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    var data = controller.currentUser.value.data![0];
    String? name = controller.currentUser.value.data![0].name;
    String? mobile = data.mobile;
    String? email = data.email;
    String? walletBalance = '\$500.00';
    int? coinBalance = 100;

    List<String>selectedLanguages = language!.split(',');
    TextEditingController nameController=TextEditingController(text: name);
    TextEditingController emailController=TextEditingController(text: email);
    TextEditingController passwordController=TextEditingController();
    TextEditingController aboutController=TextEditingController(text: aboutMe);


    String getLanguageName(List<String>? codes) {
      if (codes == null || codes.isEmpty) {
        return 'No Language Selected';
      }

      List<String> languageNames = [];

      for (String code in codes) {
        if (code.contains('1')) {
          languageNames.add('English');
        }
        if (code.contains('2')) {
          languageNames.add('Malayalam');
        }
        if (code.contains('3')) {
          languageNames.add('Tamil');
        }
        if (code.contains('4')) {
          languageNames.add('Hindi');
        }
      }

      return languageNames.join(', '); // Join the language names into a single string
    }


    return Scaffold(
      appBar: AppBarWidget(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Image and Update Button
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  data.profileImage != null
                      ? CircleAvatar(
                      radius: 70,
                      backgroundImage:
                      // NetworkImage("$imageUrl${data.profileImage}")
                    NetworkImage("https://cdn.pixabay.com/photo/2015/03/22/17/28/rings-684944_1280.jpg")
                  )
                      : const CircleAvatar(
                    backgroundColor: Color(0xffE6E6E6),
                    radius: 70,
                    child: Icon(
                      Icons.person,
                      color: Color(0xffCCCCCC),
                      size: 70,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement image upload functionality
                      pickAndUploadImage();
                      setState(() {
                        controller.fetchDataFromApi();
                      });
                    },
                    child: const Icon(
                      Icons.upload_file,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            // User Details Section
            buildSectionHeader('Listener Details'),
            buildDetailRow('Name', name!, (){

            }),
            buildDetailRow(
                'Mobile', mobile!, (){

            }),
            buildDetailRow('Email', email!,(){

            }),
            ElevatedButton(
              onPressed: () {
                // Implement update password functionality
                showDataAlert(nameController,emailController);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: const Text('UPDATE PERSONAL DETAILS'),
            ),
            const SizedBox(height: 20.0),
            buildSectionHeader('Language'),
            buildDetailRow('Language', getLanguageName(selectedLanguages),(){

            }),
            const SizedBox(height: 20.0),

            // Password Section
            buildSectionHeader('Password'),
            buildPasswordRow('Password'),
            ElevatedButton(
              onPressed: () {
                // Implement update password functionality
                showAlert(passwordController);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: const Text('UPDATE PASSWORD'),
            ),
            const SizedBox(height: 20.0),

            // About Me Section
            buildSectionHeader('About Me'),
            buildDetailRow(
              'About Me',
              aboutMe!,
             (){

             },
            ),
            ElevatedButton(
              onPressed: () {
                // Implement update about functionality
                showAlertAbout(aboutController);

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: const Text('UPDATE ABOUT'),
            ),
            const SizedBox(height: 20.0),

            // Delete Account Section
            buildSectionHeader('Delete Account'),
            ElevatedButton(
              onPressed: () {
                // Implement delete account functionality
                Get.defaultDialog(title: "Delete Account",
                middleText: "Are you sure you want to delete your account",
                onConfirm: ()async{
                  await profileController.deleteAccount().then((value) => Get.defaultDialog(
                    middleText: value

                  ));
                  Get.back();
                },
                onCancel: (){
                  Get.back();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: const Text('Delete My Account'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomWidget(),
    );
  }

  Widget buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget buildDetailRow(String label, String value, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value),
        ],
      ),
    );
  }

  Widget buildPasswordRow(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        const Text('************'),
      ],
    );
  }

  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();

    // Pick an image from the gallery
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      // Call the upload function with the picked image file
      print(pickedFile.name);
      DateTime now = DateTime.now();

      // Convert DateTime to milliseconds since epoch
      int millisecondsSinceEpoch = now.millisecondsSinceEpoch;

      // Format the milliseconds as a string
      String pickName = millisecondsSinceEpoch.toString();
      await profileController.uploadImage(imageFile,'$pickName${pickedFile.name}');
    } else {
      print('No image selected.');
    }
  }

  showDataAlert(TextEditingController name,TextEditingController email) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
            ),
            title: const Text(
              "Edit User Details",
              style: TextStyle(fontSize: 24.0),
            ),
            content: SizedBox(
              height: 300,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'UserName',
                            labelText: 'User Name'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child:  TextFormField(
                        controller:email ,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Email',
                            labelText: 'Email'),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: EasyButton(
                        borderRadius: 30,
                        onPressed: ()async {
                          await profileController.updateUserData(name.text, email.text);
                          await controller.fetchDataFromApi();
                          setState(() {

                          });
                          Get.back();
                          },
                        buttonColor: Colors.pink,
                        idleStateWidget: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ), loadingStateWidget: const CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showAlertAbout(TextEditingController about) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
            ),
            title: const Text(
              "Edit User Details",
              style: TextStyle(fontSize: 24.0),
            ),
            content: SizedBox(
              height: 300,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: about,
                        decoration:  const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "About",
                            labelText: "Tell something"),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: EasyButton(
                        borderRadius: 30,
                        onPressed: ()async {
                          await profileController.updateAbout(about.text);
                          setState(() {
                            aboutMe=about.text;
                          });
                          Get.back();
                        },
                        buttonColor: Colors.pink,
                        idleStateWidget: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ), loadingStateWidget: const CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showAlert(TextEditingController password) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
            ),
            title: const Text(
              "Edit User Details",
              style: TextStyle(fontSize: 24.0),
            ),
            content: SizedBox(
              height: 300,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: password,
                        decoration:  const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "New Password",
                            labelText: "Password"),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: EasyButton(
                        borderRadius: 30,
                        onPressed: ()async {
                          await profileController.updatePassword(password.text);
                          setState(() {

                          });
                          Get.back();
                        },
                        buttonColor: Colors.pink,
                        idleStateWidget: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ), loadingStateWidget: const CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

}


