import 'package:college_buddy/const/app_urls.dart';
import 'package:college_buddy/data/model/marksheet_model.dart';
import 'package:college_buddy/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

import 'i_marksheet_repository.dart';

class MarksheetRepository implements IMarksheetRepository {
  final Dio dio;

  MarksheetRepository({required this.dio});
  @override
  Future<Result<MarksheetModel, APIException>> getMarksheet(
      {required CancelToken cancelToken, required String studentId}) async {
    final result = await dio.get(AppUrls.getMarksheet(studentId: studentId), cancelToken: cancelToken);
    if (result.statusCode == 200 || result.statusCode == 201) {
      return Success(MarksheetModel.fromMap(result.data));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }
}
