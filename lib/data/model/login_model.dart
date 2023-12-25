import 'dart:convert';

import 'package:college_buddy/data/model/student_model.dart';

class LoginModel {
  final bool status;
  final String message;
  final StudentModel student;

  LoginModel({
    required this.status,
    required this.message,
    required this.student,
  });

  LoginModel copyWith({
    bool? status,
    String? message,
    StudentModel? student,
  }) =>
      LoginModel(
        status: status ?? this.status,
        message: message ?? this.message,
        student: student ?? this.student,
      );

  factory LoginModel.fromJson(String str) => LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        student: json["student"] = StudentModel.fromMap(json["student"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "student": student.toMap(),
      };
}
