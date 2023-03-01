// ignore_for_file: file_names

// ignore: camel_case_types

import '../model/Recomndedjobs.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class listOfJobs {
  static Future getjobs() async {
    try {
      var url =
          Uri.parse.call("http://kaamkaaz.com.np/api/getJobsForMobileFrontEnd");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<Recommended> jsonresponse = recommendedFromJson(response.body);

        return jsonresponse;
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {
      return "no Internet";
    }
  }
}
