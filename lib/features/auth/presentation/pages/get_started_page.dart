import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/core/config/app_assets.dart';
import 'package:spotify_clone/shared/theme/app_colors.dart';
import 'package:spotify_clone/shared/widgets/basic_app_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          _BackgroundLayer(),
          _DarkOverlay(),
          _ContentLayer(),
        ],
      ),
    );
  }
}

class _BackgroundLayer extends StatelessWidget {
  const _BackgroundLayer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: const AssetImage(AppAssets.introBg),
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.75),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }
}

class _DarkOverlay extends StatelessWidget {
  const _DarkOverlay();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.15),
    );
  }
}

class _ContentLayer extends StatelessWidget {
  const _ContentLayer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(AppAssets.spotifyLogo, width: 120),
            ),
            const Spacer(),
            const Text(
              'Enjoy Listening To Music',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Asoy prikitiw aselole, keren bgt gw siii. Lorem Ipsum Amet Si dolor loh ya',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            BasicAppButton(
              onPressed: () => context.go('/signup-or-signin'),
              title: 'Get Started',
              height: 72,
            ),
          ],
        ),
      ),
    );
  }
}
