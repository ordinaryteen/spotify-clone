import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failures.dart';
import 'package:spotify_clone/src/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signUp({
    required String email,
    required String password,
    required String fullName,
  });

  // Nanti buat auto-login pas app pertama kali buka
  Future<Either<Failure, UserEntity>> getCurrentUser();
}
