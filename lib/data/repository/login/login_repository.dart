import 'package:college_buddy/const/app_urls.dart';
import 'package:college_buddy/data/model/login_model.dart';
import 'package:college_buddy/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

import 'i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  final Dio dio;
  LoginRepository({required this.dio});

  @override
  Future<Result<LoginModel, APIException>> signin({
    required String rollNo,
    required String email,
    required String password,
  }) async {
    final result = await dio.post(
      AppUrls.studentLoginURL,
      data: {
        "rollNo": rollNo,
        "email": email,
        "password": password,
      },
    );
    if (result.statusCode == 200 || result.statusCode == 201) {
      return Success(LoginModel.fromMap(result.data));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }
}
