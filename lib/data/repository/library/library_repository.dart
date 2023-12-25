import 'package:college_buddy/const/app_urls.dart';
import 'package:college_buddy/data/model/library_model.dart';
import 'package:college_buddy/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

import 'i_library_repository.dart';

class LibraryRepository implements ILibraryRepository {
  final Dio dio;

  LibraryRepository({required this.dio});
  @override
  Future<Result<LibraryModel, APIException>> getLibrary(
      {required CancelToken cancelToken, required String studentId}) async {
    final result = await dio.get(AppUrls.getLibrary(studentId: studentId), cancelToken: cancelToken);
    if (result.statusCode == 200 || result.statusCode == 201) {
      return Success(LibraryModel.fromMap(result.data));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }
}
