import 'package:college_buddy/const/env/env.dart';

/// This class helping putting all
/// the urls needed in apps
class AppUrls {
  AppUrls._();

  static const String devBaseUrl = Env.developmentBaseUrl;

  // static const String baseURL = !kDebugMode ? prodBaseUrl : devBaseUrl;

  static const String studentApiURL = "/student";

  static String getStudentByRoll({required String rollNo}) {
    const studentByRoll = "$studentApiURL/{rollNo}";
    String formattedURL = studentByRoll.replaceAll('{rollNo}', rollNo);
    return formattedURL;
  }

  static String getMarksheet({required String studentId}) {
    const studentMarksheet = "$studentApiURL/marksheet/{studentId}";
    String formattedURL = studentMarksheet.replaceAll('{studentId}', studentId.toString());
    return formattedURL;
  }

  static String getBankDetails({required String studentId}) {
    const studentBankDetails = "$studentApiURL/bank-details/{studentId}";
    String formattedURL = studentBankDetails.replaceAll('{studentId}', studentId.toString());
    return formattedURL;
  }

  static String getLibrary({required String studentId}) {
    const studentLibrary = "$studentApiURL/library/{studentId}";
    String formattedURL = studentLibrary.replaceAll('{studentId}', studentId.toString());
    return formattedURL;
  }

  static String getAttendance({required String studentId}) {
    const studentAttendance = "$studentApiURL/attendance/{studentId}";
    String formattedURL = studentAttendance.replaceAll('{studentId}', studentId.toString());
    return formattedURL;
  }

  static const String studentLoginURL = "/student/login";
}
