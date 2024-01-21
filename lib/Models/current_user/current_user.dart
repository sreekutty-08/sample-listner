import 'datum.dart';

class CurrentUser {
  String? status;
  List<DataList>? data;
  String? code;

  CurrentUser({this.status, this.data, this.code});

  factory CurrentUser.fromJson(Map<String, dynamic> json) => CurrentUser(
        status: json['status'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DataList.fromJson(e as Map<String, dynamic>))
            .toList(),
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
        'code': code,
      };
}
