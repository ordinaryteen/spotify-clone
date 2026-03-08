import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:spotify_clone/core/errors/exceptions.dart';

abstract class StorageRemoteDataSource {
  Future<String> uploadFile(File file, String bucketName, String path);
}

class StorageRemoteDataSourceImpl implements StorageRemoteDataSource {
  final SupabaseClient supabaseClient;

  StorageRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<String> uploadFile(File file, String bucketName, String path) async {
    try {
      await supabaseClient.storage.from(bucketName).upload(
            path,
            file,
            fileOptions: const FileOptions(
                upsert: true), // Timpa kalau file dengan nama sama udah ada
          );

      // Ambil public URL dari bucket Supabase setelah sukses di-upload
      return supabaseClient.storage.from(bucketName).getPublicUrl(path);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
