class CoinData {
  String? id;
  String? userId;
  String? freeCoin;
  String? coin;
  String? freeEarnCoin;
  String? earnCoin;
  String? createdOn;
  String? updatedOn;

  CoinData({
    this.id,
    this.userId,
    this.freeCoin,
    this.coin,
    this.freeEarnCoin,
    this.earnCoin,
    this.createdOn,
    this.updatedOn,
  });

  factory CoinData.fromJson(Map<String, dynamic> json) => CoinData(
        id: json['id'] as String?,
        userId: json['user_id'] as String?,
        freeCoin: json['free_coin'] as String?,
        coin: json['coin'] as String?,
        freeEarnCoin: json['free_earn_coin'] as String?,
        earnCoin: json['earn_coin'] as String?,
        createdOn: json['created_on'] as String?,
        updatedOn: json['updated_on'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'free_coin': freeCoin,
        'coin': coin,
        'free_earn_coin': freeEarnCoin,
        'earn_coin': earnCoin,
        'created_on': createdOn,
        'updated_on': updatedOn,
      };
}
