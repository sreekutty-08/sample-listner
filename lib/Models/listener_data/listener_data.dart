import 'datum.dart';

class ListenerData {
  String? status;
  List<ListnerDetail>? data;
  String? code;

  ListenerData({this.status, this.data, this.code});

  factory ListenerData.fromJson(Map<String, dynamic> json) => ListenerData(
        status: json['status'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => ListnerDetail.fromJson(e as Map<String, dynamic>))
            .toList(),
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
        'code': code,
      };
}
