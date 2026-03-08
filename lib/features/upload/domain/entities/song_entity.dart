import 'package:equatable/equatable.dart';
import 'package:spotify_clone/core/entities/user_entity.dart';

class SongEntity extends Equatable {
  final String id;
  final String title;
  final String artist;
  final double duration;
  final DateTime releaseDate;
  final String songUrl;
  final String coverUrl;
  final UserEntity creator;

  const SongEntity({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.songUrl,
    required this.coverUrl,
    required this.creator,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        artist,
        duration,
        releaseDate,
        songUrl,
        coverUrl,
        creator,
      ];
}
