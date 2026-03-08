import 'dart:io';
import 'package:spotify_clone/core/entities/user_entity.dart';

abstract class UploadEvent {}

class UploadSongEvent extends UploadEvent {
  final File audioFile;
  final File coverFile;
  final String title;
  final String artist;
  final UserEntity creator;

  UploadSongEvent({
    required this.audioFile,
    required this.coverFile,
    required this.title,
    required this.artist,
    required this.creator,
  });
}
