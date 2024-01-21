class DataList {
  String? userId;
  String? userLevel;
  String? username;
  String? password;
  String? email;
  String? countryCode;
  String? mobile;
  String? name;
  String? profileImage;
  dynamic dob;
  String? code;
  String? status;
  String? mobileVerify;
  String? ban;
  String? createdBy;
  String? zone;
  String? createdAt;
  String? updatedOn;

  DataList({
    this.userId,
    this.userLevel,
    this.username,
    this.password,
    this.email,
    this.countryCode,
    this.mobile,
    this.name,
    this.profileImage,
    this.dob,
    this.code,
    this.status,
    this.mobileVerify,
    this.ban,
    this.createdBy,
    this.zone,
    this.createdAt,
    this.updatedOn,
  });

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
        userId: json['user_id'] as String?,
        userLevel: json['user_level'] as String?,
        username: json['username'] as String?,
        password: json['password'] as String?,
        email: json['email'] as String?,
        countryCode: json['country_code'] as String?,
        mobile: json['mobile'] as String?,
        name: json['name'] as String?,
        profileImage: json['profile_image'] as String?,
        dob: json['dob'] as dynamic,
        code: json['code'] as String?,
        status: json['status'] as String?,
        mobileVerify: json['mobile_verify'] as String?,
        ban: json['ban'] as String?,
        createdBy: json['created_by'] as String?,
        zone: json['zone'] as String?,
        createdAt: json['created_at'] as String?,
        updatedOn: json['updated_on'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'user_level': userLevel,
        'username': username,
        'password': password,
        'email': email,
        'country_code': countryCode,
        'mobile': mobile,
        'name': name,
        'profile_image': profileImage,
        'dob': dob,
        'code': code,
        'status': status,
        'mobile_verify': mobileVerify,
        'ban': ban,
        'created_by': createdBy,
        'zone': zone,
        'created_at': createdAt,
        'updated_on': updatedOn,
      };
}
