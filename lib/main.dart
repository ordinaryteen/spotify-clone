import 'package:flutter/material.dart';
import 'package:spotify_clone/src/features/auth/presentation/pages/splash_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:spotify_clone/core/theme/app_theme.dart';
import 'package:spotify_clone/core/config/env.dart';
import 'package:spotify_clone/core/di/service_locator.dart';
import 'package:spotify_clone/src/features/auth/presentation/pages/get_started_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Setup DI (GetIt)
  await initializeDependencies();

  // 2. Init Supabase
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: GetStartedPage(),
    );
  }
}
