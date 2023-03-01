// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:convert';

import 'package:kaamkaaz/model/LoginResponse.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class loginApi {
  // ignore: non_constant_identifier_names
  Future<LoginResponse> loginEmployeer(LoginRequestModel requestModel) async {
    try {
      var url =
          Uri.parse.call("https://kaamkaaz.com.np/api/loginEmployerAccount");
      final response = await http
          .post(url, body: requestModel.toJSON())
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(json.decode(response.body));
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Check internet connection.');
      return LoginResponse(status: false, message: "no internet");
    }
  }

  Future<LoginResponse> loginJobseeker(LoginRequestModel requestModel) async {
    var url =
        Uri.parse.call("https://kaamkaaz.com.np/api/loginJobSeekerAccount");
    try {
      final response = await http.post(url, body: requestModel.toJSON());

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(json.decode(response.body));
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Check internet connection.');
      return LoginResponse(status: false, message: "no internet");
    }
  }
}
