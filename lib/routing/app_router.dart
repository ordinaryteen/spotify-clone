import 'package:spotify_clone/features/auth/presentation/pages/signup_or_signin_page.dart';
import 'package:spotify_clone/features/auth/presentation/pages/signin_page.dart';
import 'package:spotify_clone/features/auth/presentation/pages/signup_page.dart';
import 'package:spotify_clone/features/auth/presentation/pages/get_started_page.dart';
import 'package:spotify_clone/features/auth/presentation/pages/splash_page.dart';
import 'package:spotify_clone/features/home/presentation/pages/home_page.dart';
import 'package:spotify_clone/sandbox_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'sandbox',
      builder: (context, state) => const SandboxPage(),
    ),
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/get-started',
      name: 'get-started',
      builder: (context, state) => const GetStartedPage(),
    ),
    GoRoute(
      path: '/signup-or-signin',
      name: 'signup-or-signin',
      builder: (context, state) => const SignupOrSigninPage(),
    ),
    GoRoute(
      path: '/signin',
      name: 'signin',
      builder: (context, state) => const SigninPage(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
