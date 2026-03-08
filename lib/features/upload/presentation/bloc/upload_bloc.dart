import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_clone/features/upload/domain/usecases/upload_song_usecase.dart';
import 'upload_event.dart';
import 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final UploadSongUseCase _uploadSongUseCase;
  final AudioPlayer _audioPlayer;

  // We inject usecase, and optionally instantiate AudioPlayer here
  UploadBloc(this._uploadSongUseCase)
      : _audioPlayer = AudioPlayer(),
        super(UploadInitial()) {
    on<UploadSongEvent>(_onUploadSong);
  }

  Future<void> _onUploadSong(
    UploadSongEvent event,
    Emitter<UploadState> emit,
  ) async {
    emit(UploadLoading());

    try {
      // 1. Ekstrak durasi asli dari file mp3 secara gaib (menggunakan just_audio)
      final durationObj = await _audioPlayer.setFilePath(event.audioFile.path);

      // Ambil durasinya dalam hitungan detik. Kalo null asumsikan 0.0
      final double durationInSeconds = durationObj?.inSeconds.toDouble() ?? 0.0;

      // 2. Rakit Params buat dikirim ke UseCase "Sang Raja"
      final params = UploadSongParams(
        audioFile: event.audioFile,
        coverFile: event.coverFile,
        title: event.title,
        artist: event.artist,
        genre: event.genre,
        duration: durationInSeconds,
        releaseDate:
            DateTime.now(), // Karena lagunya baru dirilis ke app lu jam segini
        creator: event.creator,
      );

      // 3. Panggil UseCase!
      final result = await _uploadSongUseCase(params);

      result.fold(
        (failure) => emit(
            UploadFailure(failure.message)), // Gagal (karena server / timeout)
        (_) => emit(UploadSuccess()), // Sukses masuk ke Supabase!
      );
    } catch (e) {
      // Nangkap error darurat (misal file coruppted, dll)
      emit(UploadFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _audioPlayer
        .dispose(); // Wajib dibuang dari memori biar hape ga bocor performanya
    return super.close();
  }
}
