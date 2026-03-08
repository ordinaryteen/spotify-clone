import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failures.dart';
import 'package:spotify_clone/features/auth/domain/entities/auth_user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthUserEntity>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthUserEntity>> signUp({
    required String email,
    required String password,
    required String fullName,
  });

  Future<Either<Failure, AuthUserEntity>> getCurrentUser();

  Future<Either<Failure, void>> signOut();
}
