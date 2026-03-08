import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Welcome to Spotify Clone!',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/upload'),
        backgroundColor: const Color(0xff1DB954), // Spotify Green
        child: const Icon(Icons.upload, color: Colors.white),
      ),
    );
  }
}
