import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/exceptions.dart';
import 'package:spotify_clone/core/errors/failures.dart';
import 'package:spotify_clone/core/entities/user_entity.dart';
import 'package:spotify_clone/features/auth/domain/repositories/auth_repo.dart';
import 'package:spotify_clone/features/auth/data/datasources/auth_remote_data_source_impl.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.signIn(email, password);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final user = await remoteDataSource.signUp(email, password, fullName);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      if (user != null) {
        return Right(user);
      } else {
        return const Left(ServerFailure('User not logged in'));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
