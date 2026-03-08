import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
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
  File? _coverFile;
  File? _audioFile;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _artistController = TextEditingController();
  // state lokal untuk genre dropdown as optional
  String? _selectedGenre;

  // list of genres
  final List<String> _genres = ['Electronic', 'Hip Hop', 'Pop', 'Rock', 'Jazz'];

  // --- Fungsi Pilih Gambar (Cover Art) ---
  Future<void> _pickCoverImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      setState(() {
        _coverFile = File(result.files.single.path!);
      });
    }
  }

  // --- Fungsi Pilih Audio (MP3/WAV) ---
  Future<void> _pickAudioFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    if (result != null) {
      setState(() {
        _audioFile = File(result.files.single.path!);
      });
    }
  }

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
              onTap: _pickCoverImage, // Panggil Pick Image
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
              onTap: _pickAudioFile, // Panggil Pick Audio
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
                // VALIDASI LOKAL (Tanpa BLoC)
                if (_coverFile == null ||
                    _audioFile == null ||
                    _titleController.text.isEmpty ||
                    _artistController.text.isEmpty ||
                    _selectedGenre == null) {
                  // 1. Getarkan HP (Haptic Feedback) - Heavy Impact biar berasa!
                  HapticFeedback.heavyImpact();

                  // 2. Beri peringatan merah ke User
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please fill all fields and select files!',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.redAccent,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  return; // Stop di sini, jangan lanjut ke tahap BLoC!
                }

                // TODO: Tahap selanjutnya, panggil BLoC dari sini!
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'All Valid! Siap Meluncur ke BLoC (Coming Soon🚀)',
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.greenAccent,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
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
