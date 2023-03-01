// ignore_for_file: file_names

import 'dart:convert';

List<Recommended> recommendedFromJson(String str) => List<Recommended>.from(
    json.decode(str).map((x) => Recommended.fromJson(x)));

String recommendedToJson(List<Recommended> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recommended {
  Recommended({
    required this.id,
    required this.userId,
    required this.jobTitle,
    required this.jobCategoryId,
    required this.jobLevel,
    required this.noOfVacancy,
    required this.employmentTime,
    required this.jobLocation,
    required this.offeredSalary,
    required this.educationLevel,
    required this.experienceRequired,
    required this.professionalSkillRequired,
    required this.jobDescription,
    required this.jobPostingOption,
    required this.jobBanner,
    required this.jobDeadLine,
    required this.approval,
    required this.state,
    required this.jobViewers,
    required this.createdAt,
    required this.updatedAt,
    // ignore: non_constant_identifier_names
    required this.UserThumbnail,
  });
  // ignore: non_constant_identifier_names
  String? UserThumbnail;

  int id;
  String? userId;
  String? jobTitle;
  int? jobCategoryId;
  String? jobLevel;
  int? noOfVacancy;
  String? employmentTime;
  String? jobLocation;
  String? offeredSalary;
  String? educationLevel;
  String? experienceRequired;
  String? professionalSkillRequired;
  String? jobDescription;
  String? jobPostingOption;
  String? jobBanner;
  String? jobDeadLine;
  int? approval;
  int? state;
  int? jobViewers;
  DateTime? createdAt;
  DateTime? updatedAt;
  factory Recommended.fromJson(Map<String, dynamic> json) => Recommended(
        id: json["id"],
        userId: json["UserId"],
        jobTitle: json["JobTitle"],
        jobCategoryId: json["JobCategoryId"],
        jobLevel: json["JobLevel"],
        noOfVacancy: json["NoOfVacancy"],
        employmentTime: json["EmploymentTime"],
        jobLocation: json["JobLocation"],
        offeredSalary: json["OfferedSalary"],
        educationLevel: json["EducationLevel"],
        experienceRequired: json["ExperienceRequired"],
        professionalSkillRequired: json["ProfessionalSkillRequired"],
        jobDescription: json["JobDescription"],
        jobPostingOption: json["JobPostingOption"],
        // ignore: prefer_if_null_operators
        jobBanner: json["jobBanner"],
        jobDeadLine: json["JobDeadLine"],
        approval: json["Approval"],
        state: json["State"],
        jobViewers: json["JobViewers"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        UserThumbnail: json["UserThumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "UserId": userId,
        "JobTitle": jobTitle,
        "JobCategoryId": jobCategoryId,
        "JobLevel": jobLevel,
        "NoOfVacancy": noOfVacancy,
        "EmploymentTime": employmentTime,
        "JobLocation": jobLocation,
        "OfferedSalary": offeredSalary,
        "EducationLevel": educationLevel,
        "ExperienceRequired": experienceRequired,
        "ProfessionalSkillRequired": professionalSkillRequired,
        "JobDescription": jobDescription,
        "JobPostingOption": jobPostingOption,
        // ignore: prefer_if_null_operators
        "jobBanner": jobBanner == null ? '00' : jobBanner,
      };
}
