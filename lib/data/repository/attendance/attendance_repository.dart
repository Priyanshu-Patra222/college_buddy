import 'package:college_buddy/const/app_urls.dart';
import 'package:college_buddy/data/model/atttendance_model.dart';
import 'package:college_buddy/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

import 'i_attendance_repository.dart';

class AttendanceRepository implements IAttendanceRepository {
  final Dio dio;

  AttendanceRepository({required this.dio});
  @override
  Future<Result<AttendanceModel, APIException>> getAttendance(
      {required CancelToken cancelToken, required int regdNo}) async {
    final result = await dio.get(AppUrls.getAttendance(regdNo: regdNo), cancelToken: cancelToken);
    if (result.statusCode == 200 || result.statusCode == 201) {
      return Success(AttendanceModel.fromMap(result.data));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }
}
