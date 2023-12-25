import 'package:college_buddy/data/model/login_model.dart';

abstract class ILoginDbService {
  Future<void> saveLoginModel({required LoginModel loginModel});
  Future<void> deleteLoginModel();
  LoginModel? getLoginModel();
}
