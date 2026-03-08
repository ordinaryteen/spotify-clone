import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:spotify_clone/core/errors/exceptions.dart';
import 'package:spotify_clone/features/upload/data/models/song_model.dart';

abstract class SongRemoteDataSource {
  Future<void> createSong(SongModel song);
}

class SongRemoteDataSourceImpl implements SongRemoteDataSource {
  final SupabaseClient supabaseClient;

  SongRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<void> createSong(SongModel song) async {
    try {
      await supabaseClient.from('songs').insert(song.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
