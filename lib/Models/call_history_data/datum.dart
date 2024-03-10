class CallHistory {
	String? id;
	String? callProgressId;
	String? type;
	String? listenerId;
	String? userId;
	String? callDuration;
	String? coinCredited;
	String? callStatus;
	String? callType;
	String? notifi;
	String? createdOn;
	String? updatedOn;

	CallHistory({
		this.id, 
		this.callProgressId, 
		this.type, 
		this.listenerId, 
		this.userId, 
		this.callDuration, 
		this.coinCredited, 
		this.callStatus, 
		this.callType, 
		this.notifi, 
		this.createdOn, 
		this.updatedOn, 
	});

	factory CallHistory.fromJson(Map<String, dynamic> json) => CallHistory(

				id: json['id'] as String?,
				callProgressId: json['call_progress_id'] as String?,
				type: json['type'] as String?,
				listenerId: json['listener_id'] as String?,
				userId: json['user_id'] as String?,
				callDuration: json['call_duration'] as String?,
				coinCredited: json['coin_credited'] as String?,
				callStatus: json['call_status'] as String?,
				callType: json['call_type'] as String?,
				notifi: json['notifi'] as String?,
				createdOn: json['created_on'] as String?,
				updatedOn: json['updated_on'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'0': 0,
				'1': 1,
				'2': 2,
				'3': 3,
				'4': 4,
				'5': 5,
				'6': 6,
				'7': 7,
				'8': 8,
				'9': 9,
				'10': 10,
				'11': 11,
				'id': id,
				'call_progress_id': callProgressId,
				'type': type,
				'listener_id': listenerId,
				'user_id': userId,
				'call_duration': callDuration,
				'coin_credited': coinCredited,
				'call_status': callStatus,
				'call_type': callType,
				'notifi': notifi,
				'created_on': createdOn,
				'updated_on': updatedOn,
			};
}
