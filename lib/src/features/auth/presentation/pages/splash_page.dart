import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/theme/app_colors.dart';
import 'package:spotify_clone/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:spotify_clone/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:spotify_clone/src/features/auth/presentation/bloc/auth_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.read<AuthBloc>().add(AuthGetCurrentUserEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // TODO: Nanti pake GoRouter ke HomePage
            print('Login valid -> Lari ke Home Page');
          } else if (state is AuthUnauthenticated) {
            // TODO: Nanti pake GoRouter ke GetStartedPage
            print('Gak ada session -> Mampir ke Get Started Page');
          } else if (state is AuthFailure) {
            print('Gagal Authenticate -> Mampir ke Get Started Page');
          }
        },
        child: Center(
          child: Image.asset(
            'assets/vectors/spotify_logo.png',
            width: 200,
          ),
        ),
      ),
    );
  }
}
