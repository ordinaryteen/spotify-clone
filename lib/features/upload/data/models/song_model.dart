import 'package:spotify_clone/features/upload/domain/entities/song_entity.dart';
import 'package:spotify_clone/core/entities/user_entity.dart';

class SongModel extends SongEntity {
  const SongModel({
    required super.id,
    required super.title,
    required super.artist,
    required super.genre,
    required super.duration,
    required super.releaseDate,
    required super.songUrl,
    required super.coverUrl,
    required super.creator,
  });

  /// Factory constructor to translate Supabase JSON to our Application Data (Model)
  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      genre: json['genre'] ?? '',
      duration: json['duration']?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] != null
          ? DateTime.parse(json['release_date'])
          : DateTime.now(),
      songUrl: json['song_url'] ?? '',
      coverUrl: json['cover_url'] ?? '',
      creator: UserEntity(
        id: json['users']?['id'] ?? '',
        fullName: json['users']?['full_name'] ?? 'Unknown',
      ),
    );
  }

  /// Converts Application Data (Model) to Supabase JSON format for insertion
  Map<String, dynamic> toJson() {
    return {
      // 'id' is usually omitted during Insert because Supabase auto-generates the UUID
      'title': title,
      'artist': artist,
      'genre': genre,
      'duration': duration, // Maps safely because it's double
      'release_date': releaseDate.toIso8601String(),
      'song_url': songUrl, // Link from Storage
      'cover_url': coverUrl, // Link from Storage
      'user_id': creator
          .id, // This is the Foreign Key column in the Supabase 'songs' table
    };
  }
}
