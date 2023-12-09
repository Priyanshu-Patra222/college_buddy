import 'dart:convert';

import 'package:college_buddy/data/model/student_by_roll_model.dart';

class MarksheetModel {
  final String? message;
  final StudentModel? student;
  final List<Marksheet>? marksheet;

  MarksheetModel({
    this.message,
    this.student,
    this.marksheet,
  });

  MarksheetModel copyWith({
    String? message,
    StudentModel? student,
    List<Marksheet>? marksheet,
  }) =>
      MarksheetModel(
        message: message ?? this.message,
        student: student ?? this.student,
        marksheet: marksheet ?? this.marksheet,
      );

  factory MarksheetModel.fromJson(String str) => MarksheetModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MarksheetModel.fromMap(Map<String, dynamic> json) => MarksheetModel(
        message: json["message"],
        student: json["student"] == null ? null : StudentModel.fromMap(json["student"]),
        marksheet: json["marksheet"] == null
            ? []
            : List<Marksheet>.from(json["marksheet"]!.map((x) => Marksheet.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "student": student?.toMap(),
        "marksheet": marksheet == null ? [] : List<dynamic>.from(marksheet!.map((x) => x.toMap())),
      };
}

class Marksheet {
  final int? semester;
  final List<Subject>? subjects;
  final double? sgpa;

  Marksheet({
    this.semester,
    this.subjects,
    this.sgpa,
  });

  Marksheet copyWith({
    int? semester,
    List<Subject>? subjects,
    double? sgpa,
  }) =>
      Marksheet(
        semester: semester ?? this.semester,
        subjects: subjects ?? this.subjects,
        sgpa: sgpa ?? this.sgpa,
      );

  factory Marksheet.fromJson(String str) => Marksheet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Marksheet.fromMap(Map<String, dynamic> json) => Marksheet(
        semester: json["semester"],
        subjects: json["subjects"] == null
            ? []
            : List<Subject>.from(json["subjects"]!.map((x) => Subject.fromMap(x))),
        sgpa: json["sgpa"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "semester": semester,
        "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x.toMap())),
        "sgpa": sgpa,
      };
}

class Subject {
  final String? subjectCode;
  final String? subjectName;
  final String? grade;
  final String? id;

  Subject({
    this.subjectCode,
    this.subjectName,
    this.grade,
    this.id,
  });

  Subject copyWith({
    String? subjectCode,
    String? subjectName,
    String? grade,
    String? id,
  }) =>
      Subject(
        subjectCode: subjectCode ?? this.subjectCode,
        subjectName: subjectName ?? this.subjectName,
        grade: grade ?? this.grade,
        id: id ?? this.id,
      );

  factory Subject.fromJson(String str) => Subject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subject.fromMap(Map<String, dynamic> json) => Subject(
        subjectCode: json["subjectCode"],
        subjectName: json["subjectName"],
        grade: json["grade"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "subjectCode": subjectCode,
        "subjectName": subjectName,
        "grade": grade,
        "_id": id,
      };
}
