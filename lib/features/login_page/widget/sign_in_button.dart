import 'package:college_buddy/features/login_page/controller/login_pod.dart';
import 'package:college_buddy/features/login_page/state/login_states.dart';
import 'package:college_buddy/features/login_page/widget/primary_action_button.dart';
import 'package:college_buddy/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInButton extends ConsumerWidget {
  final VoidCallback onSignin;

  const SignInButton({
    super.key,
    required this.onSignin,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginProviderAsync = ref.watch(loginProvider);
    return loginProviderAsync.easyWhen(data: (loginStates) {
      return switch (loginStates) {
        InitialLoginState() => PrimaryActionButton(
            labelText: 'Sign in',
            
            onPressed: onSignin,
          ),
        LoggingInState() => const PrimaryActionButton(
            isLoading: true,
            labelText: 'Signing in',
            onPressed: null,
          ),
        LoggedInState() => const PrimaryActionButton(
            labelText: 'Signed in',
            onPressed: null,
          ),
        NotLoggedInState() => PrimaryActionButton(
            labelText: 'Retry',
            onPressed: onSignin,
          ),
        LoginErrorState() => PrimaryActionButton(
            labelText: 'Unable To Sign in',
            onPressed: onSignin,
          ),
      };
    });
  }
}
