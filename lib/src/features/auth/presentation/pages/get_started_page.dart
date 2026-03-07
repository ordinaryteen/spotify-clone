import 'package:flutter/material.dart';
import 'package:spotify_clone/core/theme/app_colors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: const AssetImage(
                  'assets/images/intro_bg.jpg',
                ),
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.75),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black.withValues(alpha: 0.15),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/spotify_logo.png',
                      width: 120,
                    ),
                  ),

                  const Spacer(),

                  // Teks Utama (Title)
                  const Text(
                    'Enjoy Listening To Music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Teks Subtitle (Lorem Ipsum)
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

                  // Tombol "Get Started"
                  SizedBox(
                    width: double.infinity,
                    height: 72, // Standar button gede
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Ini nanti nembak event pindah page pake GoRouter!
                        print('Lanjut ke Choose Mode / SignUp!!');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xff42C83C), // Identik Spotify Green
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20, // Standar tebel teks button
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
