import 'package:college_buddy/data/model/student_by_roll_model.dart';
import 'package:college_buddy/data/model/student_model.dart';
import 'package:college_buddy/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IStudentRepository {
  Future<Result<StudentModel, APIException>> getAllStudents({
    required CancelToken cancelToken,
  });
  Future<Result<StudentByRollModel, APIException>> getStudentByRoll({
    required String rollNo,
    required CancelToken cancelToken,
  });
}
