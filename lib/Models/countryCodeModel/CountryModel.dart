class CountryModel {
  final String id;
  final String name;
  final String mobileCode;
  final String currencyCode;
  final String currencySymbol;
  final String status;
  final String createdOn;
  final String updatedOn;

  CountryModel({
    required this.id,
    required this.name,
    required this.mobileCode,
    required this.currencyCode,
    required this.currencySymbol,
    this.status = "",
    this.createdOn = "",
    this.updatedOn = "",
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'],
      mobileCode: json['mobile_code'],
      currencyCode: json['currency_code'],
      currencySymbol: json['currency_symble'],
      status: json['status'],
      createdOn: json['created_on'],
      updatedOn: json['updated_on'],
    );
  }
}
