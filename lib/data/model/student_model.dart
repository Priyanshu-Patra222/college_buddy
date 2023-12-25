import 'dart:convert';

class StudentModel {
  final String id;
  final String name;
  final String email;
  final String rollNo;
  final int registrationNo;
  final int phoneNo;
  final String session;
  final String branch;
  final DateTime dob;
  final dynamic profilePicture;
  final int v;
  final String password;

  StudentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.rollNo,
    required this.registrationNo,
    required this.phoneNo,
    required this.session,
    required this.branch,
    required this.dob,
    required this.profilePicture,
    required this.v,
    required this.password,
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
    String? password,
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
        password: password ?? this.password,
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
        dob: json["dob"] = DateTime.parse(json["dob"]),
        profilePicture: json["profilePicture"],
        v: json["__v"],
        password: json["password"],
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
        "dob": dob.toIso8601String(),
        "profilePicture": profilePicture,
        "__v": v,
        "password": password,
      };
}
