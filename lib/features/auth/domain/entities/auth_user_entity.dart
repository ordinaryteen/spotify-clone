import 'package:equatable/equatable.dart';
import 'package:spotify_clone/core/entities/user_entity.dart';

class AuthUserEntity extends Equatable {
  final UserEntity core;
  final String email;

  const AuthUserEntity({
    required this.core,
    required this.email,
  });

  @override
  List<Object?> get props => [core, email];
}
