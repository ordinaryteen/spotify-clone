import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/core/config/app_assets.dart';
import 'package:spotify_clone/shared/theme/app_colors.dart';
import 'package:spotify_clone/shared/widgets/basic_app_bar.dart';
import 'package:spotify_clone/shared/widgets/basic_app_button.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
          title: SizedBox
              .shrink()), // Manggil AppBar Transparan dengan icon back tapi gaada logo di tengah
      body: Stack(
        children: [
          // Background Image (Billie Eilish)
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppAssets.authBg,
              colorBlendMode: BlendMode.darken,
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Image.asset(AppAssets.spotifyExtendedLogo, width: 200),
                const SizedBox(height: 55),
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 21),
                const Text(
                  'Spotify is a proprietary Swedish audio streaming and media services provider',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: BasicAppButton(
                        onPressed: () => context.push('/signup'),
                        title: 'Register',
                        height: 64,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () => context.push('/signin'),
                        style: TextButton.styleFrom(
                          minimumSize: const Size(0, 64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
