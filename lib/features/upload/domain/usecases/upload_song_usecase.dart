import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failures.dart';
import 'package:spotify_clone/core/entities/user_entity.dart';
import 'package:spotify_clone/features/upload/domain/entities/song_entity.dart';
import 'package:spotify_clone/features/upload/domain/repositories/song_repository.dart';
import 'package:spotify_clone/features/upload/domain/repositories/storage_repository.dart';

class UploadSongParams {
  final File audioFile;
  final File coverFile;
  final String title;
  final String artist;
  final String genre;
  final double duration;
  final DateTime releaseDate;
  final UserEntity creator;

  UploadSongParams({
    required this.audioFile,
    required this.coverFile,
    required this.title,
    required this.artist,
    required this.genre,
    required this.duration,
    required this.releaseDate,
    required this.creator,
  });
}

class UploadSongUseCase {
  final StorageRepository storageRepository;
  final SongRepository songRepository;

  UploadSongUseCase({
    required this.storageRepository,
    required this.songRepository,
  });

  Future<Either<Failure, void>> call(UploadSongParams params) async {
    // 1. Upload Audio File
    final audioPath =
        'songs/${params.creator.id}_${DateTime.now().millisecondsSinceEpoch}_audio.mp3';
    final audioUploadResult = await storageRepository.uploadFile(
      file: params.audioFile,
      bucketName: 'songs', // Name of your Supabase storage bucket
      path: audioPath,
    );

    // If audio upload fails, stop exactly here and return the Failure
    if (audioUploadResult.isLeft()) {
      return Left(audioUploadResult.fold(
          (l) => l, (r) => const ServerFailure('Unknown error')));
    }

    // 2. Upload Cover Image File
    final coverPath =
        'covers/${params.creator.id}_${DateTime.now().millisecondsSinceEpoch}_cover.jpg';
    final coverUploadResult = await storageRepository.uploadFile(
      file: params.coverFile,
      bucketName: 'covers',
      path: coverPath,
    );

    // If cover upload fails, stop and return Failure
    if (coverUploadResult.isLeft()) {
      return Left(coverUploadResult.fold(
          (l) => l, (r) => const ServerFailure('Unknown error')));
    }

    // 3. Both succeeded! Extract the URLs
    final audioUrl = audioUploadResult.fold((l) => '', (url) => url);
    final coverUrl = coverUploadResult.fold((l) => '', (url) => url);

    // 4. Save to Database
    final song = SongEntity(
      id: '',
      title: params.title,
      artist: params.artist,
      genre: params.genre,
      duration: params.duration,
      releaseDate: params.releaseDate,
      songUrl: audioUrl,
      coverUrl: coverUrl,
      creator: params.creator,
    );

    return await songRepository.createSong(song);
  }
}
