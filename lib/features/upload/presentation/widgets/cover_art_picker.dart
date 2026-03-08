import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:spotify_clone/core/theme/app_colors.dart';

class CoverArtPicker extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onTap;

  const CoverArtPicker({
    super.key,
    this.imageFile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,

      // dotted border
      child: DottedBorder(
        color: Colors.white.withValues(alpha: 0.2),
        strokeWidth: 2,
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        dashPattern: const [10, 5],

        // inside the dashed line
        child: Material(
          color: Colors.white.withValues(alpha: .05),
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.antiAlias,

          // Inkwell
          child: InkWell(
            onTap: onTap,
            splashColor: Colors.white.withValues(alpha: 0.07),
            highlightColor: Colors.white.withValues(alpha: 0.03),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: imageFile != null
                    ? DecorationImage(
                        image: FileImage(imageFile!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),

              // ICON BORDER
              child: imageFile == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ICON
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: .1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.image_outlined,
                            size: 36,
                            color: AppColors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // TITLE TEXT
                        const Text(
                          'Choose Cover Art',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // SUBTITLE TEXT
                        const SizedBox(height: 4),
                        const Text(
                          '3000 x 3000px recommended',
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
