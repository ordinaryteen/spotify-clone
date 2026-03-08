import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/exceptions.dart';
import 'package:spotify_clone/core/errors/failures.dart';
import 'package:spotify_clone/features/upload/domain/repositories/storage_repository.dart';
import 'package:spotify_clone/features/upload/data/datasources/storage_remote_data_source.dart';

class StorageRepositoryImpl implements StorageRepository {
  final StorageRemoteDataSource remoteDataSource;

  StorageRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> uploadFile({
    required File file,
    required String bucketName,
    required String path,
  }) async {
    try {
      final url = await remoteDataSource.uploadFile(file, bucketName, path);
      return Right(url);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
