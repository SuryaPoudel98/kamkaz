// ignore_for_file: file_names

import 'dart:convert';
import 'package:kaamkaaz/model/Register_model.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class RegisterApi {
  // ignore: non_constant_identifier_names
  Future<RegisterResponse> ResgiterEmpolyer(
      RegisterRequestModel requestModel) async {
    try {
      var url = Uri.parse.call("https://kaamkaaz.com.np/api/employerAccount");
      final response = await http.post(url, body: requestModel.toJSON());
      if (response.statusCode == 200) {
        return RegisterResponse.fromJson(json.decode(response.body));
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {
      return RegisterResponse(status: false, message: 'Error with internet');
    }
  }

  // ignore: non_constant_identifier_names
  Future<RegisterResponse> RegisterJobseeker(
      RegisterRequestModel requestModel) async {
    try {
      var url = Uri.parse.call("https://kaamkaaz.com.np/api/employerAccount");
      final response = await http.post(url, body: requestModel.toJSON());
      if (response.statusCode == 200) {
        return RegisterResponse.fromJson(json.decode(response.body));
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {
      return RegisterResponse(status: false, message: 'Error with internet');
    }
  }
}
