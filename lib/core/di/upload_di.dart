import 'package:get_it/get_it.dart';
import 'package:spotify_clone/features/upload/data/datasources/song_remote_data_source.dart';
import 'package:spotify_clone/features/upload/data/datasources/storage_remote_data_source.dart';
import 'package:spotify_clone/features/upload/data/repositories/song_repository_impl.dart';
import 'package:spotify_clone/features/upload/data/repositories/storage_repository_impl.dart';
import 'package:spotify_clone/features/upload/domain/repositories/song_repository.dart';
import 'package:spotify_clone/features/upload/domain/repositories/storage_repository.dart';
import 'package:spotify_clone/features/upload/domain/usecases/upload_song_usecase.dart';
// Note: We haven't created the BLoC yet, we'll add it here later

void initUploadDI(GetIt sl) {
  // 1. Data Sources
  sl.registerLazySingleton<SongRemoteDataSource>(
    () => SongRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<StorageRemoteDataSource>(
    () => StorageRemoteDataSourceImpl(sl()),
  );

  // 2. Repositories
  sl.registerLazySingleton<SongRepository>(
    () => SongRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<StorageRepository>(
    () => StorageRepositoryImpl(sl()),
  );

  // 3. Use Cases
  sl.registerLazySingleton(
    () => UploadSongUseCase(
      storageRepository: sl(),
      songRepository: sl(),
    ),
  );

  // 4. BLoC (TBD)
}
