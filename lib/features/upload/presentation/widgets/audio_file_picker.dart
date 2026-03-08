import 'dart:io';
import 'package:flutter/material.dart';
import 'package:spotify_clone/core/theme/app_colors.dart';

class AudioFilePicker extends StatelessWidget {
  final File? audioFile;
  final VoidCallback onTap;

  const AudioFilePicker({
    super.key,
    this.audioFile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.05),
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white.withValues(alpha: 0.07),
        highlightColor: Colors.white.withValues(alpha: 0.03),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              // 1. Ikon Nada ber-background ijo
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.audiotrack,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 16),

              // 2. Tulisan file yang dipilih atau teks "Select MP3..."
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      audioFile != null
                          ? audioFile!.path
                              .split('/')
                              .last // Nampilin nama file-nya doang
                          : 'Select MP3 or WAV file',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      audioFile != null
                          ? 'Audio file selected'
                          : 'Max file size 50MB',
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              // 3. Ikon Cloud Upload di ujung kanan
              const SizedBox(width: 16),
              const Icon(
                Icons.cloud_upload_outlined,
                color: AppColors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
