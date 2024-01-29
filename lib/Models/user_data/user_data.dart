import '../../HelperFunction/HelperFunction.dart';
import 'datum.dart';

class UserData {
  String? status;
  List<Datum>? data;
  String? code;

  UserData({this.status, this.data, this.code});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        status: json['status'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
        'code': code,
      };
  bool hasMobileNumberAndUserLevel(String targetMobileNumber) {
    // Check if data is not null and not empty
    if (data != null && data!.isNotEmpty) {
      // Iterate through each Datum in the data
      for (var datum in data!) {
        // Check if the mobile number and user level match the target values
        if (datum.mobile == targetMobileNumber && datum.userLevel == "4") {
          userId = datum.userId!;
          HelperFunction.saveUserIdSF(userId);
          HelperFunction.saveUserLoggedInStatus(true);
          return true; // Mobile number and user level found
        }
      }
    }
    return false; // Mobile number or user level not found
  }
}
