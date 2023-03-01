// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, prefer_if_null_operators, non_constant_identifier_names

class RegisterResponse {
  RegisterResponse({
    required this.status,
    required this.message,
  });
  late final bool status;
  late final String message;
  late final String? UserEmail;
  late final String? UserPassword;
  late String UserId = '0';
  late String UserName = '0';
  late final String? UserMobileNo;
  late final String? UserCountry;
  late final String? UserThumbnail;

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    UserEmail = json["UserEmail"] == null ? null : json["UserEmail"];
    UserPassword = json["UserPassword"] == null ? null : json["UserPassword"];
    UserId = json["UserId"] == null ? '0' : json["UserId"];
    UserName = json["UserName"] == null ? null : json["UserName"];
    UserMobileNo = json["UserMobileNo"] == null ? null : json["UserMobileNo"];
    UserCountry = json["UserCountry"] == null ? null : json["UserCountry"];
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;

    _data['UserEmail'] = UserEmail;
    _data['UserPassword'] = UserPassword;
    _data['UserId'] = UserId;
    _data['UserName'] = UserName;
    _data['UserMobileNo'] = UserMobileNo;
    _data['UserCountry'] = UserCountry;
    _data['UserThumbnail'] = UserThumbnail;
    return _data;
  }
}

class RegisterRequestModel {
  late String name;
  late String email;
  late String password;
  late String phonenumber;
  RegisterRequestModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.phonenumber});
  Map<String, dynamic> toJSON() {
    Map<String, dynamic> map = {
      "UserName": name,
      "UserPassword": password,
      "UserMobileNo": phonenumber,
      "UserEmail": email
    };
    return map;
  }
}
