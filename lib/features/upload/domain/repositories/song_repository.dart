import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failures.dart';
import 'package:spotify_clone/features/upload/domain/entities/song_entity.dart';

/// Repository interface for managing song data operations.
abstract class SongRepository {
  /// Creates a new song record.
  Future<Either<Failure, void>> createSong(SongEntity song);
}
