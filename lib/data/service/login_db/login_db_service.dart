import 'package:college_buddy/core/local_storage/app_storage.dart';
import 'package:college_buddy/data/model/login_model.dart';

import 'i_login_db_service.dart';

class LoginDbService implements ILoginDbService {
  final AppStorage appStorage;
  LoginDbService({
    required this.appStorage,
  });

  final loginModelKey = 'loginmodel';
  @override
  Future<void> deleteLoginModel() async {
    final box = appStorage.appBox;
    await box?.delete(loginModelKey);
  }

  @override
  LoginModel? getLoginModel() {
    final box = appStorage.appBox;
    final loginModel = box?.get(loginModelKey) as String?;
    if (loginModel != null) {
      return LoginModel.fromJson(loginModel);
    } else {
      return null;
    }
  }

  @override
  Future<void> saveLoginModel({required LoginModel loginModel}) async {
    final box = appStorage.appBox;
    await box?.put(loginModelKey, loginModel.toJson());
  }
}
