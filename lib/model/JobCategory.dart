// To parse this JSON data, do
//
//     final jobCategoryModel = jobCategoryModelFromJson(jsonString);

import 'dart:convert';

List<JobCategoryModel> jobCategoryModelFromJson(String str) =>
    List<JobCategoryModel>.from(
        json.decode(str).map((x) => JobCategoryModel.fromJson(x)));

String jobCategoryModelToJson(List<JobCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobCategoryModel {
  JobCategoryModel({
    required this.id,
    this.jobCatetoryname,
  });

  int id;
  String? jobCatetoryname;

  factory JobCategoryModel.fromJson(Map<String, dynamic> json) =>
      JobCategoryModel(
        id: json["id"],
        jobCatetoryname: json["jobCatetoryname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobCatetoryname": jobCatetoryname,
      };
}
