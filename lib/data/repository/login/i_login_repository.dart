import 'package:college_buddy/data/model/login_model.dart';
import 'package:college_buddy/shared/exception/base_exception.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ILoginRepository {
  Future<Result<LoginModel, APIException>> signin({
    required String rollNo,
    required String email,
    required String password,
  });
}
