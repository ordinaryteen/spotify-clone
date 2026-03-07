import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Import semua layer yang ada
import 'package:spotify_clone/src/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:spotify_clone/src/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:spotify_clone/src/features/auth/domain/repositories/auth_repo.dart';
import 'package:spotify_clone/src/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:spotify_clone/src/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:spotify_clone/src/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:spotify_clone/src/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:spotify_clone/src/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // -------------------------
  // CORE / EXTERNAL
  // -------------------------
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // -------------------------
  // FEATURES: AUTH
  // -------------------------

  // 1. Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  // 2. Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );

  // 3. Use Cases
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));

  // 4. BLoC
  sl.registerFactory(() => AuthBloc(
        sl(),
        sl(),
        sl(),
        sl(),
      ));
}
