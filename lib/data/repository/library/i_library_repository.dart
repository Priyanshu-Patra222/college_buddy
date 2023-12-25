import 'package:college_buddy/data/model/library_model.dart';
import 'package:college_buddy/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ILibraryRepository {
  Future<Result<LibraryModel, APIException>> getLibrary({
    required CancelToken cancelToken,
    required String studentId,
  });
}
