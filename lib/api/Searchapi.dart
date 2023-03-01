// ignore_for_file: file_names

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../model/Recomndedjobs.dart';

// ignore: camel_case_types
class search {
  Future<List<Recommended>> serchjobs(String key) async {
    try {
      var url = Uri.parse
          .call("http://kaamkaaz.com.np/api/searachjobs?searchkey=$key");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<Recommended> jsonresponse = recommendedFromJson(response.body);

        return jsonresponse;
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {
      print(e);
      List<Recommended> list = [];
      return list;
    }
  }

  Future<List<Recommended>> SearchwithFilter(
      String? key, List<int> JobCategory, String? Empolymnt, int sortBy) async {
    try {
      var url;
      if (Empolymnt == null) {
        url = Uri.parse.call(
            "http://kaamkaaz.com.np/api/searchjobsWithFilter?searchkey=$key&JobCategoryId=${JobCategory.join(",")}&EmploymentTime=&sortBy=$sortBy");
      } else {
        url = Uri.parse.call(
            "http://kaamkaaz.com.np/api/searchjobsWithFilter?searchkey=$key&JobCategoryId=${JobCategory.join(",")}&EmploymentTime=$Empolymnt&sortBy=$sortBy");
      }
      print(url);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<Recommended> jsonresponse = recommendedFromJson(response.body);

        return jsonresponse;
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {
      print(e);
      List<Recommended> list = [];
      return list;
    }
  }
}
