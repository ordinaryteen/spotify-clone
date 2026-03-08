import 'package:flutter/material.dart';

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
      body: const Center(
        // Taruh widget lu di sini ganti-ganti nanti ya!
        child: Text(
          'Silakan Rakit Widget Anda di Sini',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
