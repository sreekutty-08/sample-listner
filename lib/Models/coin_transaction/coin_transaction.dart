
import 'datum.dart';

class CoinTransaction {
  String? status;
  List<TransactionData>? data;
  String? code;

  CoinTransaction({this.status, this.data, this.code});

  factory CoinTransaction.fromJson(Map<String, dynamic> json) {
    return CoinTransaction(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TransactionData.fromJson(e as Map<String, dynamic>))
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
