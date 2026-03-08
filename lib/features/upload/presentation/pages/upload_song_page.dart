import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:spotify_clone/core/di/service_locator.dart';
import 'package:spotify_clone/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:spotify_clone/features/auth/presentation/bloc/auth_state.dart';
import 'package:spotify_clone/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:spotify_clone/features/upload/presentation/bloc/upload_event.dart';
import 'package:spotify_clone/features/upload/presentation/bloc/upload_state.dart';
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
    return BlocProvider(
      create: (context) => sl<UploadBloc>(),
      child: BlocConsumer<UploadBloc, UploadState>(
        listener: (context, state) {
          if (state is UploadFailure) {
            HapticFeedback.heavyImpact();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message,
                    style: const TextStyle(color: Colors.white)),
                backgroundColor: Colors.redAccent,
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else if (state is UploadSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Song uploaded perfectly! 🎉',
                    style: TextStyle(color: Colors.black)),
                backgroundColor: Colors.greenAccent,
                behavior: SnackBarBehavior.floating,
              ),
            );

            // LAKSANAKAN PINDAH HALAMAN
            context.go('/home');
          }
        },
        builder: (context, state) {
          // Selama loading, kita bisa bikin layar nggak bisa dipencet/interaksi mati
          return AbsorbPointer(
            absorbing: state is UploadLoading,
            child: Scaffold(
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
                      dropdownColor:
                          const Color(0xff343434), // Dark grey dropdown
                      icon: const Icon(Icons.expand_more, color: Colors.grey),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: .05),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Color(0xff1DB954), width: 1.5),
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
                      isLoading: state is UploadLoading,
                      onPressed: () {
                        // VALIDASI LOKAL (Tanpa BLoC)
                        if (_coverFile == null ||
                            _audioFile == null ||
                            _titleController.text.isEmpty ||
                            _artistController.text.isEmpty ||
                            _selectedGenre == null) {
                          HapticFeedback.heavyImpact();
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
                          return; // Stop di sini!
                        }

                        // Ambil data User yang lagi login sekarang dari AuthBloc
                        final authState = context.read<AuthBloc>().state;
                        if (authState is Authenticated) {
                          // NYALAKAN MESIN! Tembak Event ke BLoC
                          context.read<UploadBloc>().add(
                                UploadSongEvent(
                                  coverFile: _coverFile!,
                                  audioFile: _audioFile!,
                                  title: _titleController.text.trim(),
                                  artist: _artistController.text.trim(),
                                  genre: _selectedGenre!,
                                  creator: authState
                                      .user.core, // Lemparan data sakti
                                ),
                              );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Error: You are not logged in!'),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
                      },
                      title: 'Upload Song',
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
