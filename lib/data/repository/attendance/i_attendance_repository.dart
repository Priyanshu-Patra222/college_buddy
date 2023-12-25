import 'package:college_buddy/data/model/atttendance_model.dart';
import 'package:college_buddy/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IAttendanceRepository {
  Future<Result<AttendanceModel, APIException>> getAttendance({
    required CancelToken cancelToken,
    required String studentId,
  });
}
