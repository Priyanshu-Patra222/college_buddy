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

  static String getMarksheet({required int regdNo}) {
    const studentMarksheet = "$studentApiURL/marksheet/{regdNo}";
    String formattedURL = studentMarksheet.replaceAll('{regdNo}', regdNo.toString());
    return formattedURL;
  }

  static String getBankDetails({required int regdNo}) {
    const studentBankDetails = "$studentApiURL/bank-details/{regdNo}";
    String formattedURL = studentBankDetails.replaceAll('{regdNo}', regdNo.toString());
    return formattedURL;
  }

  static String getLibrary({required int regdNo}) {
    const studentLibrary = "$studentApiURL/library/{regdNo}";
    String formattedURL = studentLibrary.replaceAll('{regdNo}', regdNo.toString());
    return formattedURL;
  }

  static String getAttendance({required String studentId}) {
    const studentAttendance = "$studentApiURL/attendance/{studentId}";
    String formattedURL = studentAttendance.replaceAll('{studentId}', studentId.toString());
    return formattedURL;
  }

  static const String studentLoginURL = "/student/login";
}
