class TransactionData {
  String? id;
  String? userId;
  String? userLevel;
  String? paymentId;
  String? callProgressId;
  String? coinCredit;
  String? coinDebit;
  String? status;
  String? coinCreditStatus;
  String? remark;
  String? createdOn;
  String? updatedOn;

  TransactionData({
    this.id,
    this.userId,
    this.userLevel,
    this.paymentId,
    this.callProgressId,
    this.coinCredit,
    this.coinDebit,
    this.status,
    this.coinCreditStatus,
    this.remark,
    this.createdOn,
    this.updatedOn,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      TransactionData(
        id: json['id'] as String?,
        userId: json['user_id'] as String?,
        userLevel: json['user_level'] as String?,
        paymentId: json['payment_id'] as String?,
        callProgressId: json['call_progress_id'] as String?,
        coinCredit: json['coin_credit'] as String?,
        coinDebit: json['coin_debit'] as String?,
        status: json['status'] as String?,
        coinCreditStatus: json['coin_credit_status'] as String?,
        remark: json['remark'] as String?,
        createdOn: json['created_on'] as String?,
        updatedOn: json['updated_on'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'user_level': userLevel,
        'payment_id': paymentId,
        'call_progress_id': callProgressId,
        'coin_credit': coinCredit,
        'coin_debit': coinDebit,
        'status': status,
        'coin_credit_status': coinCreditStatus,
        'remark': remark,
        'created_on': createdOn,
        'updated_on': updatedOn,
      };
}
