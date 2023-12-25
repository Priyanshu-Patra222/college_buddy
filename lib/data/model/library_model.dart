import 'dart:convert';

import 'package:college_buddy/data/model/student_model.dart';

class LibraryModel {
  final String? message;
  final LibraryDetails? libraryDetails;

  LibraryModel({
    this.message,
    this.libraryDetails,
  });

  LibraryModel copyWith({
    String? message,
    LibraryDetails? libraryDetails,
  }) =>
      LibraryModel(
        message: message ?? this.message,
        libraryDetails: libraryDetails ?? this.libraryDetails,
      );

  factory LibraryModel.fromJson(String str) => LibraryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LibraryModel.fromMap(Map<String, dynamic> json) => LibraryModel(
        message: json["message"],
        libraryDetails:
            json["libraryDetails"] == null ? null : LibraryDetails.fromMap(json["libraryDetails"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "libraryDetails": libraryDetails?.toMap(),
      };
}

class LibraryDetails {
  final String? id;
  final StudentModel? student;
  final List<BooksBorrowed>? booksBorrowed;
  final int? v;

  LibraryDetails({
    this.id,
    this.student,
    this.booksBorrowed,
    this.v,
  });

  LibraryDetails copyWith({
    String? id,
    StudentModel? student,
    List<BooksBorrowed>? booksBorrowed,
    int? v,
  }) =>
      LibraryDetails(
        id: id ?? this.id,
        student: student ?? this.student,
        booksBorrowed: booksBorrowed ?? this.booksBorrowed,
        v: v ?? this.v,
      );

  factory LibraryDetails.fromJson(String str) => LibraryDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LibraryDetails.fromMap(Map<String, dynamic> json) => LibraryDetails(
        id: json["_id"],
        student: json["student"] == null ? null : StudentModel.fromMap(json["student"]),
        booksBorrowed: json["booksBorrowed"] == null
            ? []
            : List<BooksBorrowed>.from(json["booksBorrowed"]!.map((x) => BooksBorrowed.fromMap(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "student": student?.toMap(),
        "booksBorrowed":
            booksBorrowed == null ? [] : List<dynamic>.from(booksBorrowed!.map((x) => x.toMap())),
        "__v": v,
      };
}

class BooksBorrowed {
  final String? bookTitle;
  final DateTime? dueDate;
  final String? id;

  BooksBorrowed({
    this.bookTitle,
    this.dueDate,
    this.id,
  });

  BooksBorrowed copyWith({
    String? bookTitle,
    DateTime? dueDate,
    String? id,
  }) =>
      BooksBorrowed(
        bookTitle: bookTitle ?? this.bookTitle,
        dueDate: dueDate ?? this.dueDate,
        id: id ?? this.id,
      );

  factory BooksBorrowed.fromJson(String str) => BooksBorrowed.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BooksBorrowed.fromMap(Map<String, dynamic> json) => BooksBorrowed(
        bookTitle: json["bookTitle"],
        dueDate: json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "bookTitle": bookTitle,
        "dueDate": dueDate?.toIso8601String(),
        "_id": id,
      };
}
