import 'package:get_it/get_it.dart';
import 'package:spotify_clone/features/upload/data/datasources/song_remote_data_source.dart';
import 'package:spotify_clone/features/upload/data/datasources/storage_remote_data_source.dart';
import 'package:spotify_clone/features/upload/data/repositories/song_repository_impl.dart';
import 'package:spotify_clone/features/upload/data/repositories/storage_repository_impl.dart';
import 'package:spotify_clone/features/upload/domain/repositories/song_repository.dart';
import 'package:spotify_clone/features/upload/domain/repositories/storage_repository.dart';
import 'package:spotify_clone/features/upload/domain/usecases/upload_song_usecase.dart';
import 'package:spotify_clone/features/upload/presentation/bloc/upload_bloc.dart';

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

  // 4. BLoC (Factory rather than Singleton, since UI State needs resetting on each close/open)
  sl.registerFactory(() => UploadBloc(sl()));
}
