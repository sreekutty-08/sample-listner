import 'dart:core';

class DataHistory {
  String? id;
  String? callProgressId;
  String? type;
  String? userId;
  String? listenerId;
  String? callDuration;
  String? coinDebited;
  String? callStatus;
  String? callType;
  String? notifi;
  String? createdOn;
  String? updatedOn;

  DataHistory({
    this.id,
    this.callProgressId,
    this.type,
    this.userId,
    this.listenerId,
    this.callDuration,
    this.coinDebited,
    this.callStatus,
    this.callType,
    this.notifi,
    this.createdOn,
    this.updatedOn,
  });

  factory DataHistory.fromJson(Map<String, dynamic> json) => DataHistory(
        id: json['id'] as String?,
        callProgressId: json['call_progress_id'] as String?,
        type: json['type'] as String?,
        userId: json['user_id'] as String?,
        listenerId: json['listener_id'] as String?,
        callDuration: json['call_duration'] as String?,
        coinDebited: json['coin_debited'] as String?,
        callStatus: json['call_status'] as String?,
        callType: json['call_type'] as String?,
        notifi: json['notifi'] as String?,
        createdOn: json['created_on'] as String?,
        updatedOn: json['updated_on'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'call_progress_id': callProgressId,
        'type': type,
        'user_id': userId,
        'listener_id': listenerId,
        'call_duration': callDuration,
        'coin_debited': coinDebited,
        'call_status': callStatus,
        'call_type': callType,
        'notifi': notifi,
        'created_on': createdOn,
        'updated_on': updatedOn,
      };
}
