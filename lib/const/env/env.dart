// ignore_for_file: constant_identifier_names

import 'package:envied/envied.dart';

//!incase the below file gets deleted, first delete the pubspec.lock file and then run the command "dart run build_runner build --delete-conflicting-outputs" in the terminal

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'DEVELOPMENT_BASE_URL')
  static const String developmentBaseUrl = _Env.developmentBaseUrl;
}
