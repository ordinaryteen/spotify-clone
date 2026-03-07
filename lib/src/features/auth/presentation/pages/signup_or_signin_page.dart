import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image (Billie Eilish)
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              'assets/images/auth_bg.png',
              colorBlendMode: BlendMode.darken,
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Back button
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: .03),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back_ios_new,
                            size: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Image.asset('assets/images/spotify_extended_logo.png',
                    width: 200),
                const SizedBox(height: 55),
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                const SizedBox(height: 21),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () => context.push('/signup'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff42C83C),
                            minimumSize: const Size(0, 64),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          child: const Text('Register',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white)),
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
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          child: const Text('Sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
