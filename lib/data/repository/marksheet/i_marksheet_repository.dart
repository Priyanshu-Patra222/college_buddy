import 'package:college_buddy/data/model/marksheet_model.dart';
import 'package:college_buddy/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IMarksheetRepository {
  Future<Result<MarksheetModel, APIException>> getMarksheet({
    required CancelToken cancelToken,
    required String studentId,
  });
}
