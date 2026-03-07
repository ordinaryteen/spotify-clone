import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failures.dart';
import 'package:spotify_clone/features/auth/domain/entities/user_entity.dart';
import 'package:spotify_clone/features/auth/domain/repositories/auth_repo.dart';

class SignUpParams {
  final String email;
  final String password;
  final String fullName;
  SignUpParams(
      {required this.email, required this.password, required this.fullName});
}

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(SignUpParams params) async {
    return await repository.signUp(
      email: params.email,
      password: params.password,
      fullName: params.fullName,
    );
  }
}
