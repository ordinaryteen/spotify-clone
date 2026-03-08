import 'dart:io';
import 'package:flutter/material.dart';
import 'package:spotify_clone/features/upload/presentation/widgets/audio_file_picker.dart';
import 'package:spotify_clone/features/upload/presentation/widgets/cover_art_picker.dart';
import 'package:spotify_clone/shared/widgets/basic_app_bar.dart';
import 'package:spotify_clone/shared/widgets/basic_app_button.dart';
import 'package:spotify_clone/shared/widgets/basic_text_field.dart';

class UploadSongPage extends StatefulWidget {
  const UploadSongPage({super.key});

  @override
  State<UploadSongPage> createState() => _UploadSongPageState();
}

class _UploadSongPageState extends State<UploadSongPage> {
  // Sementara kita simpan State UI di sini sebelum dipindah/connect ke BLoC
  File? _coverFile;
  File? _audioFile;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _artistController = TextEditingController();
  // state lokal untuk genre dropdown as optional
  String? _selectedGenre;

  // list of genres
  final List<String> _genres = ['Electronic', 'Hip Hop', 'Pop', 'Rock', 'Jazz'];

  @override
  void dispose() {
    _titleController.dispose();
    _artistController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        title: Text(
          'Upload Song',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Cover Art
            const Text(
              'Cover Art',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            CoverArtPicker(
              imageFile: _coverFile,
              onTap: () {
                // TODO: Panggil fungsi pick image nanti di sini
                print('Nanti buka galeri');
              },
            ),
            const SizedBox(height: 24),

            // 2. Audio File
            const Text(
              'Upload Audio',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            AudioFilePicker(
              audioFile: _audioFile,
              onTap: () {
                // TODO: Panggil fungsi pick mp3 nanti di sini
                print('Nanti buka file explorer');
              },
            ),
            const SizedBox(height: 24),

            // 3. Text Fields (Title, Artist, Genre)
            const Text(
              'Song Title',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            BasicTextField(
              hintText: 'Enter the title of your track',
              controller: _titleController,
            ),
            const SizedBox(height: 24),

            const Text(
              'Artist Name',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            BasicTextField(
              hintText: 'Who is the artist?',
              controller: _artistController,
            ),
            const SizedBox(height: 24),

            const Text(
              'Genre (Optional)',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedGenre,
              hint: const Text(
                'e.g. Electronic, Pop, Rock',
                style: TextStyle(color: Colors.grey),
              ),
              dropdownColor: const Color(0xff343434), // Dark grey dropdown
              icon: const Icon(Icons.expand_more, color: Colors.grey),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withValues(alpha: .05),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      const BorderSide(color: Color(0xff1DB954), width: 1.5),
                ),
              ),
              items: _genres.map((String genre) {
                return DropdownMenuItem<String>(
                  value: genre,
                  child: Text(
                    genre,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGenre = newValue;
                });
              },
            ),
            const SizedBox(height: 48),

            // 4. Upload Button
            BasicAppButton(
              onPressed: () {
                // TODO: Panggil BLoC Upload Song Event nanti di sini
                print('Upload Dipencet!');
              },
              title: 'Upload Song',
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
