import 'dart:async';

import 'package:college_buddy/data/model/login_model.dart';
import 'package:college_buddy/data/repository/login/login_repository_pod.dart';
import 'package:college_buddy/data/service/login_db/login_db_service_pod.dart';
import 'package:college_buddy/features/login_page/state/login_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginAsyncNotifier extends AutoDisposeAsyncNotifier<LoginState> {
  @override
  FutureOr<LoginState> build() {
    return const InitialLoginState();
  }

  Future<void> signin({
    required String rollNo,
    required String email,
    required String password,
    required void Function(LoginModel loginModelResponse) onUserLoggedIn,
  }) async {
    state = const AsyncData(LoggingInState());
    state = await AsyncValue.guard(
      () async {
        final result = await ref.watch(loginRepoProvider).signin(
              rollNo: rollNo,
              email: email,
              password: password,
            );
        return result.when(
          (loginModel) async {
            if (loginModel.student.id.isNotEmpty) {
              await ref.watch(loginDbProvider).saveLoginModel(loginModel: loginModel);
              onUserLoggedIn(loginModel);
              return const LoggedInState();
            } else {
              return const NotLoggedInState();
            }
          },
          (error) => LoginErrorState(
            error.errorMessage,
          ),
        );
      },
    );
  }
}
