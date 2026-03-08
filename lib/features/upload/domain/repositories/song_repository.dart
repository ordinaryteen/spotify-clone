import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failures.dart';
import 'package:spotify_clone/features/upload/domain/entities/song_entity.dart';

abstract class SongRepository {
  Future<Either<Failure, void>> createSong(SongEntity song);
}
