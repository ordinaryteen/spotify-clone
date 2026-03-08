import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failures.dart';

abstract class StorageRepository {
  Future<Either<Failure, String>> uploadFile({
    required File file,
    required String bucketName,
    required String path,
  });
}
