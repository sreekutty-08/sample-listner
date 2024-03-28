class ListnerDetail {
  String? id;
  String? userId;
  String? userLevel;
  String? catId;
  String? langId;
  String? coinRateId;
  String? ifVideocall;
  String? videoCoinrateId;
  String? ifChat;
  String? chatCoinrateId;
  String? coinRedeemId;
  String? freecoinRedeemId;
  String? address;
  String? zone;
  String? skill;
  String? about;
  String? onlineStatus;
  String? incall;
  String? createdOn;
  String? updatedOn;

  ListnerDetail({
    this.id,
    this.userId,
    this.userLevel,
    this.catId,
    this.langId,
    this.coinRateId,
    this.ifVideocall,
    this.videoCoinrateId,
    this.ifChat,
    this.chatCoinrateId,
    this.coinRedeemId,
    this.freecoinRedeemId,
    this.address,
    this.zone,
    this.skill,
    this.about,
    this.onlineStatus,
    this.incall,
    this.createdOn,
    this.updatedOn,
  });

  factory ListnerDetail.fromJson(Map<String, dynamic> json) => ListnerDetail(
        id: json['id'] as String?,
        userId: json['user_id'] as String?,
        userLevel: json['user_level'] as String?,
        catId: json['cat_id'] as String?,
        langId: json['lang_id'] as String?, // Convert langId to List<String>
        coinRateId: json['coin_rate_id'] as String?,
        ifVideocall: json['if_videocall'] as String?,
        videoCoinrateId: json['video_coinrate_id'] as String?,
        ifChat: json['if_chat'] as String?,
        chatCoinrateId: json['chat_coinrate_id'] as String?,
        coinRedeemId: json['coin_redeem_id'] as String?,
        freecoinRedeemId: json['freecoin_redeem_id'] as String?,
        address: json['address'] as String?,
        zone: json['zone'] as String?,
        skill: json['skill'] as String?,
        about: json['about'] as String?,
        onlineStatus: json['online_status'] as String?,
        incall: json['incall'] as String?,
        createdOn: json['created_on'] as String?,
        updatedOn: json['updated_on'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'user_level': userLevel,
        'cat_id': catId,
        'lang_id': langId,
        'coin_rate_id': coinRateId,
        'if_videocall': ifVideocall,
        'video_coinrate_id': videoCoinrateId,
        'if_chat': ifChat,
        'chat_coinrate_id': chatCoinrateId,
        'coin_redeem_id': coinRedeemId,
        'freecoin_redeem_id': freecoinRedeemId,
        'address': address,
        'zone': zone,
        'skill': skill,
        'about': about,
        'online_status': onlineStatus,
        'incall': incall,
        'created_on': createdOn,
        'updated_on': updatedOn,
      };
}
