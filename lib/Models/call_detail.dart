class CallDetail {
  String? status;
  String? data;
  String? code;

  CallDetail({this.status, this.data, this.code});

  factory CallDetail.fromJson(Map<String, dynamic> json) => CallDetail(
        status: json['status'] as String?,
        data: json['data'] as String?,
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data,
        'code': code,
      };
}
