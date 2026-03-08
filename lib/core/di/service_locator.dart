import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:spotify_clone/core/di/auth_di.dart';
import 'package:spotify_clone/core/di/upload_di.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // -------------------------
  // CORE / EXTERNAL
  // -------------------------
  // Daftarin Supabase Client
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // TODO:(Nanti kalau ada Isar, SharedPreferences, atau Dio, daftarin di sini)

  // -------------------------
  // FEATURES INJECTIONS
  // -------------------------
  initAuthDI(sl);
  initUploadDI(sl);
}
