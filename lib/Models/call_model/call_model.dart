import 'datum.dart';

class CallModel {
  String? status;
  List<CallData>? datas;
  String? data;
  String? code;

  CallModel({this.status, this.code, this.datas, this.data});

  factory CallModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] is String && json['data'] == "notringing") {
      return CallModel(
        status: json['status'] as String?,
        data: json['data'] as String?,
        code: json['code'] as String?,
      );
    } else {
      return CallModel(
        status: json['status'] as String?,
        datas: (json['data'] as List<dynamic>?)
            ?.map((e) => CallData.fromJson(e as Map<String, dynamic>))
            .toList(),
        code: json['code'] as String?,
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['data'] = this.data;
    data['code'] = code;
    return data;
  }
}
