sealed class LoginState {
  const LoginState();
}

class InitialLoginState implements LoginState {
  const InitialLoginState();
}

class LoggingInState implements LoginState {
  const LoggingInState();
}

class LoggedInState implements LoginState {
  const LoggedInState();
}

class NotLoggedInState implements LoginState {
  const NotLoggedInState();
}

class LoginErrorState implements LoginState {
  final String message;

  const LoginErrorState(this.message);

  @override
  bool operator ==(covariant LoginErrorState other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
