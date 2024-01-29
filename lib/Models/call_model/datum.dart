class CallData {
  String? id;
  String? userId;
  String? listenerId;
  String? callType;
  String? status;
  String? callAnswer;
  String? callCoin;
  String? callStart;
  String? callEnd;
  String? updatedOn;
  String? createdOn;

  CallData({
    this.id,
    this.userId,
    this.listenerId,
    this.callType,
    this.status,
    this.callAnswer,
    this.callCoin,
    this.callStart,
    this.callEnd,
    this.updatedOn,
    this.createdOn,
  });

  factory CallData.fromJson(Map<String, dynamic> json) {
    return CallData(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      listenerId: json['listener_id'] as String?,
      callType: json['call_type'] as String?,
      status: json['status'] as String?,
      callAnswer: json['call_answer'] as String?,
      callCoin: json['call_coin'] as String?,
      callStart: json['call_start'] as String?,
      callEnd: json['call_end'] as String?,
      updatedOn: json['updated_on'] as String?,
      createdOn: json['created_on'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'listener_id': listenerId,
      'call_type': callType,
      'status': status,
      'call_answer': callAnswer,
      'call_coin': callCoin,
      'call_start': callStart,
      'call_end': callEnd,
      'updated_on': updatedOn,
      'created_on': createdOn,
    };
  }
}
