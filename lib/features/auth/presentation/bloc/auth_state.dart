import 'package:spotify_clone/features/auth/domain/entities/auth_user_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final AuthUserEntity user;

  Authenticated(this.user);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

class AuthUnauthenticated extends AuthState {}
