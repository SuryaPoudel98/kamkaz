// ignore_for_file: depend_on_referenced_packages, file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kaamkaaz/api/SharedServices1.dart';

import '../model/Recomndedjobs.dart';

class Apply {
  late bool isapplied;
  late bool issaved;
  Future apply(int id) async {
    try {
      var url = Uri.parse.call(
          "http://kaamkaaz.com.np/api/applyJob?id=$id&&UserId=${sharedPref.Userid}");
      final response = await http.get(url);
      if (response.statusCode == 200) {
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {}
  }

  Future isApplied(int id) async {
    // ignore: prefer_typing_uninitialized_variables
    var result;
    try {
      var url = Uri.parse.call(
          "http://kaamkaaz.com.np/api/isJobAppliedAPI?id=$id&UserId=${sharedPref.Userid}");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        result = json.decode(response.body);

        isapplied = result["appliedJob"];
        issaved = result["savedJob"];
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {}
  }

  Future savedjobs(int id) async {
    try {
      var url = Uri.parse.call(
          "http://kaamkaaz.com.np/api/saveJob?id=$id&UserId=${sharedPref.Userid}");
      final response = await http.get(url);
      if (response.statusCode == 200) {
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {}
  }

  Future deletejobs(int id) async {
    try {
      print("Delete jobs whose id is $id");
      var url = Uri.parse.call(
          "https://kaamkaaz.com.np/api/deletesavedJob?id=$id&UserId=${sharedPref.Userid}");
      final response = await http.get(url);

      if (response.statusCode == 200) {
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {}
  }

  Future showBookMarks() async {
    try {
      var url = Uri.parse.call(
          "http://kaamkaaz.com.np/api/viewSavedJobs?UserId=${sharedPref.Userid}");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Recommended> jsonresponse = recommendedFromJson(response.body);
        return jsonresponse;
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {
      return "No Internet Conncetion";
    }
  }

  // ignore: non_constant_identifier_names
  Future Showapplyjobs() async {
    try {
      var url = Uri.parse.call(
          "http://kaamkaaz.com.np/api/viewAppliedJobs?UserId=${sharedPref.Userid}");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Recommended> jsonresponse = recommendedFromJson(response.body);
        return jsonresponse;
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {}
  }
}
