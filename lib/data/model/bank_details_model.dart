import 'dart:convert';

import 'package:college_buddy/data/model/student_by_roll_model.dart';

class BankDetailsModel {
  final String? message;
  final BankDetails? bankDetails;

  BankDetailsModel({
    this.message,
    this.bankDetails,
  });

  BankDetailsModel copyWith({
    String? message,
    BankDetails? bankDetails,
  }) =>
      BankDetailsModel(
        message: message ?? this.message,
        bankDetails: bankDetails ?? this.bankDetails,
      );

  factory BankDetailsModel.fromJson(String str) => BankDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BankDetailsModel.fromMap(Map<String, dynamic> json) => BankDetailsModel(
        message: json["message"],
        bankDetails: json["bankDetails"] == null ? null : BankDetails.fromMap(json["bankDetails"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "bankDetails": bankDetails?.toMap(),
      };
}

class BankDetails {
  final String? id;
  final StudentModel? student;
  final String? accountHolderName;
  final String? accountNumber;
  final String? bankName;
  final String? ifscCode;
  final int? v;

  BankDetails({
    this.id,
    this.student,
    this.accountHolderName,
    this.accountNumber,
    this.bankName,
    this.ifscCode,
    this.v,
  });

  BankDetails copyWith({
    String? id,
    StudentModel? student,
    String? accountHolderName,
    String? accountNumber,
    String? bankName,
    String? ifscCode,
    int? v,
  }) =>
      BankDetails(
        id: id ?? this.id,
        student: student ?? this.student,
        accountHolderName: accountHolderName ?? this.accountHolderName,
        accountNumber: accountNumber ?? this.accountNumber,
        bankName: bankName ?? this.bankName,
        ifscCode: ifscCode ?? this.ifscCode,
        v: v ?? this.v,
      );

  factory BankDetails.fromJson(String str) => BankDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BankDetails.fromMap(Map<String, dynamic> json) => BankDetails(
        id: json["_id"],
        student: json["student"] == null ? null : StudentModel.fromMap(json["student"]),
        accountHolderName: json["accountHolderName"],
        accountNumber: json["accountNumber"],
        bankName: json["bankName"],
        ifscCode: json["ifscCode"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "student": student?.toMap(),
        "accountHolderName": accountHolderName,
        "accountNumber": accountNumber,
        "bankName": bankName,
        "ifscCode": ifscCode,
        "__v": v,
      };
}
