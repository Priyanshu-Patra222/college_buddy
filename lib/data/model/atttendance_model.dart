import 'dart:convert';

class AttendanceModel {
  final String message;
  final AttendanceDetails attendanceDetails;

  AttendanceModel({
    required this.message,
    required this.attendanceDetails,
  });

  AttendanceModel copyWith({
    String? message,
    AttendanceDetails? attendanceDetails,
  }) =>
      AttendanceModel(
        message: message ?? this.message,
        attendanceDetails: attendanceDetails ?? this.attendanceDetails,
      );

  factory AttendanceModel.fromJson(String str) => AttendanceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AttendanceModel.fromMap(Map<String, dynamic> json) => AttendanceModel(
        message: json["message"],
        attendanceDetails: json["attendanceDetails"] =
            AttendanceDetails.fromMap(json["attendanceDetails"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "attendanceDetails": attendanceDetails.toMap(),
      };
}

class AttendanceDetails {
  final String? id;
  final String? student;
  final List<Attendance>? attendance;
  final int? v;

  AttendanceDetails({
    this.id,
    this.student,
    this.attendance,
    this.v,
  });

  AttendanceDetails copyWith({
    String? id,
    String? student,
    List<Attendance>? attendance,
    int? v,
  }) =>
      AttendanceDetails(
        id: id ?? this.id,
        student: student ?? this.student,
        attendance: attendance ?? this.attendance,
        v: v ?? this.v,
      );

  factory AttendanceDetails.fromJson(String str) => AttendanceDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AttendanceDetails.fromMap(Map<String, dynamic> json) => AttendanceDetails(
        id: json["_id"],
        student: json["student"],
        attendance: json["attendance"] == null
            ? []
            : List<Attendance>.from(json["attendance"]!.map((x) => Attendance.fromMap(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "student": student,
        "attendance":
            attendance == null ? [] : List<dynamic>.from(attendance!.map((x) => x.toMap())),
        "__v": v,
      };
}

class Attendance {
  final int? semester;
  final int? attendancePercentage;
  final String? id;

  Attendance({
    this.semester,
    this.attendancePercentage,
    this.id,
  });

  Attendance copyWith({
    int? semester,
    int? attendancePercentage,
    String? id,
  }) =>
      Attendance(
        semester: semester ?? this.semester,
        attendancePercentage: attendancePercentage ?? this.attendancePercentage,
        id: id ?? this.id,
      );

  factory Attendance.fromJson(String str) => Attendance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attendance.fromMap(Map<String, dynamic> json) => Attendance(
        semester: json["semester"],
        attendancePercentage: json["attendancePercentage"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "semester": semester,
        "attendancePercentage": attendancePercentage,
        "_id": id,
      };
}
