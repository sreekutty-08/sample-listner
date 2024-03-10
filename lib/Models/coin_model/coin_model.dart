import 'datum.dart';

class CoinModel {
  String? status;
  List<CoinData>? data;
  String? code;

  CoinModel({this.status, this.data, this.code});

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        status: json['status'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => CoinData.fromJson(e as Map<String, dynamic>))
            .toList(),
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
        'code': code,
      };
}
