import 'package:flutter/material.dart';
import 'package:spotify_clone/features/upload/presentation/widgets/audio_file_picker.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: AudioFilePicker(
            onTap: () {
              print("Tapped Audio Picker!");
            },
          ),
        ),
      ),
    );
  }
}
