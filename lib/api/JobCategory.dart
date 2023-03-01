import '../model/JobCategory.dart';
import 'package:http/http.dart' as http;

class APiJObCategory {
  static late List<JobCategoryModel> jsonresponse;
  static Future<List<JobCategoryModel>> getjobs() async {
    try {
      var url = Uri.parse.call("https://kaamkaaz.com.np/api/categories");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        jsonresponse = jobCategoryModelFromJson(response.body);

        return jsonresponse;
      } else {
        return throw Exception('failed to load');
      }
    } catch (e) {
      List<JobCategoryModel> list = [];
      return list;
    }
  }
}
