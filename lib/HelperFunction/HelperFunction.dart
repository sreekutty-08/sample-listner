import 'package:shared_preferences/shared_preferences.dart';

String userId = '';

class HelperFunction {
  static String userLoggedInKey = 'LOGGEDINKEY';
  static String userIdKey = 'USERIDKEY';

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserIdSF(String userId) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userIdKey, userId);
  }

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserIdFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userIdKey);
  }
}
