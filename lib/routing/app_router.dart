// lib/core/routes/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/src/features/auth/presentation/pages/get_started_page.dart';
import 'package:spotify_clone/src/features/auth/presentation/pages/splash_page.dart';

final appRouter = GoRouter(
  initialLocation: '/', // Pertama kali buka app, pasti lari ke sini
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/get-started',
      name: 'get-started',
      builder: (context, state) => const GetStartedPage(),
    ),
    // Nanti kita tambah '/login' dan '/signup' di sini
  ],
);
