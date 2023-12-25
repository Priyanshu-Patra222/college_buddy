import 'dart:convert';

import 'package:college_buddy/data/model/student_model.dart';

class AllStudentsModel {
  final String? message;
  final List<StudentModel>? data;

  AllStudentsModel({
    this.message,
    this.data,
  });

  AllStudentsModel copyWith({
    String? message,
    List<StudentModel>? data,
  }) =>
      AllStudentsModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory AllStudentsModel.fromJson(String str) => AllStudentsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllStudentsModel.fromMap(Map<String, dynamic> json) => AllStudentsModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<StudentModel>.from(json["data"]!.map((x) => StudentModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}
