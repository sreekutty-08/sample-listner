import 'datum.dart';

class CallHistoryData {
  String? status;
  List<CallHistory>? data;
  String? code;

  CallHistoryData({this.status, this.data, this.code});

  factory CallHistoryData.fromJson(Map<String, dynamic> json) {
    return CallHistoryData(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CallHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
        'code': code,
      };
}
