// ignore_for_file: file_names, non_constant_identifier_names

class LoginResponse {
  LoginResponse({
    required this.status,
    required this.message,
  });
  late final bool status;
  late final String message;
  late String UserId = '0';
  String name = "";

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // ignore: prefer_if_null_operators
    UserId = json["UserId"] == null ? '0' : json["UserId"];
    name = json["UserName"] ?? '0';
  }
}

class LoginRequestModel {
  late String email;
  late String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJSON() {
    Map<String, dynamic> map = {"UserPassword": password, "UserEmail": email};
    return map;
  }
}
