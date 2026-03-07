abstract class AuthEvent {}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String fullName;

  AuthSignUpEvent({
    required this.email,
    required this.password,
    required this.fullName,
  });
}

class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignInEvent({
    required this.email,
    required this.password,
  });
}

class AuthGetCurrentUserEvent extends AuthEvent {}

class AuthSignOutEvent extends AuthEvent {}
