import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/exceptions.dart';
import 'package:spotify_clone/core/errors/failures.dart';
import 'package:spotify_clone/features/upload/domain/entities/song_entity.dart';
import 'package:spotify_clone/features/upload/domain/repositories/song_repository.dart';
import 'package:spotify_clone/features/upload/data/datasources/song_remote_data_source.dart';
import 'package:spotify_clone/features/upload/data/models/song_model.dart';

class SongRepositoryImpl implements SongRepository {
  final SongRemoteDataSource remoteDataSource;

  SongRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> createSong(SongEntity song) async {
    try {
      // Terjemahin dari Domain Layer (Entity) ke Data Layer (Model)
      final songModel = SongModel(
        id: song.id,
        title: song.title,
        artist: song.artist,
        duration: song.duration,
        releaseDate: song.releaseDate,
        songUrl: song.songUrl,
        coverUrl: song.coverUrl,
        creator: song.creator,
      );

      await remoteDataSource.createSong(songModel);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
