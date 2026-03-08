import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failures.dart';
import 'package:spotify_clone/features/auth/domain/entities/auth_user_entity.dart';
import 'package:spotify_clone/features/auth/domain/repositories/auth_repo.dart';

class GetCurrentUserParams {
  GetCurrentUserParams();
}

class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<Either<Failure, AuthUserEntity>> call(
      GetCurrentUserParams params) async {
    return await repository.getCurrentUser();
  }
}
