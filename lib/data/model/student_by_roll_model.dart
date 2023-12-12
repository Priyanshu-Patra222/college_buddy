import 'dart:convert';

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

class StudentModel {
  final String? id;
  final String? name;
  final String? email;
  final String? rollNo;
  final int? registrationNo;
  final int? phoneNo;
  final String? session;
  final String? branch;
  final DateTime? dob;
  final dynamic profilePicture;
  final int? v;

  StudentModel({
    this.id,
    this.name,
    this.email,
    this.rollNo,
    this.registrationNo,
    this.phoneNo,
    this.session,
    this.branch,
    this.dob,
    this.profilePicture,
    this.v,
  });

  StudentModel copyWith({
    String? id,
    String? name,
    String? email,
    String? rollNo,
    int? registrationNo,
    int? phoneNo,
    String? session,
    String? branch,
    DateTime? dob,
    dynamic profilePicture,
    int? v,
  }) =>
      StudentModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        rollNo: rollNo ?? this.rollNo,
        registrationNo: registrationNo ?? this.registrationNo,
        phoneNo: phoneNo ?? this.phoneNo,
        session: session ?? this.session,
        branch: branch ?? this.branch,
        dob: dob ?? this.dob,
        profilePicture: profilePicture ?? this.profilePicture,
        v: v ?? this.v,
      );

  factory StudentModel.fromJson(String str) => StudentModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StudentModel.fromMap(Map<String, dynamic> json) => StudentModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        rollNo: json["rollNo"],
        registrationNo: json["registrationNo"],
        phoneNo: json["phoneNo"],
        session: json["session"],
        branch: json["branch"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        profilePicture: json["profilePicture"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "email": email,
        "rollNo": rollNo,
        "registrationNo": registrationNo,
        "phoneNo": phoneNo,
        "session": session,
        "branch": branch,
        "dob": dob?.toIso8601String(),
        "profilePicture": profilePicture,
        "__v": v,
      };
}
