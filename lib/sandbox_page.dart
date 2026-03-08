import 'package:flutter/material.dart';
import 'package:spotify_clone/features/upload/presentation/pages/upload_song_page.dart';

class SandboxPage extends StatelessWidget {
  const SandboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Playground 🛠️',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      // Background dark mode Spotify-style
      backgroundColor: const Color(0xFF121212),
      // Langsung panggil halaman utuh racikan kita buat ngetes layout-nya!
      body: const UploadSongPage(),
    );
  }
}
