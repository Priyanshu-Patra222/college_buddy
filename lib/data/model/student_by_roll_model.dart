import 'dart:convert';

import 'package:college_buddy/data/model/student_model.dart';

class StudentByRollModel {
  final String? message;
  final StudentModel? student;

  StudentByRollModel({
    this.message,
    this.student,
  });

  StudentByRollModel copyWith({
    String? message,
    StudentModel? student,
  }) =>
      StudentByRollModel(
        message: message ?? this.message,
        student: student ?? this.student,
      );

  factory StudentByRollModel.fromJson(String str) => StudentByRollModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StudentByRollModel.fromMap(Map<String, dynamic> json) => StudentByRollModel(
        message: json["message"],
        student: json["student"] == null ? null : StudentModel.fromMap(json["student"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "student": student?.toMap(),
      };
}
