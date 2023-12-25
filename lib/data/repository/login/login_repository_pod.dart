import 'package:college_buddy/data/repository/login/i_login_repository.dart';
import 'package:college_buddy/data/repository/login/login_repository.dart';
import 'package:college_buddy/shared/api_client/dio/dio_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//the access point for the controller of the ui to interact with the state
final loginRepoProvider = Provider.autoDispose<ILoginRepository>(
  (ref) {
    return LoginRepository(dio: ref.watch(dioProvider));
  },
);
