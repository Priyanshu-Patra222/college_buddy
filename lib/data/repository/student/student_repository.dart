import 'package:college_buddy/const/app_urls.dart';
import 'package:college_buddy/data/model/student_by_roll_model.dart';
import 'package:college_buddy/data/model/student_model.dart';
import 'package:college_buddy/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

import 'i_student_repository.dart';

class StudentRepository implements IStudentRepository {
  final Dio dio;

  StudentRepository({required this.dio});
  @override
  Future<Result<StudentModel, APIException>> getAllStudents(
      {required CancelToken cancelToken}) async {
    final result = await dio.get(AppUrls.studentApiURL, cancelToken: cancelToken);
    if (result.statusCode == 200 || result.statusCode == 201) {
      return Success(StudentModel.fromMap(result.data));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }

  @override
  Future<Result<StudentByRollModel, APIException>> getStudentByRoll(
      {required String rollNo, required CancelToken cancelToken}) async {
    final result =
        await dio.get(AppUrls.getStudentByRoll(rollNo: rollNo), cancelToken: cancelToken);
    if (result.statusCode == 200 || result.statusCode == 201) {
      return Success(StudentByRollModel.fromMap(result.data));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }
}
