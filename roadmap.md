### 🏗️ PHASE 1: FOUNDATION & INFRASTRUCTURE
- [x] **Project Setup**
    - [x] `flutter create` dengan package name yang bener.
    - [x] Setup Folder Structure: `lib/core`, `lib/features`, `lib/service_locator.dart`.
- [x] **Supabase Initial**
    - [x] Create Project di Supabase Dashboard.
    - [x] Setup Table `users` (id, full_name, email, avatar_url).
    - [x] Setup Table `songs` (id, title, artist, song_url, cover_url, duration, user_id).
    - [x] Enable RLS (Row Level Security) untuk semua table.
- [x] **Configuration Files**
    - [x] `pubspec.yaml`: Add `supabase_flutter`, `get_it`, `dartz`, `flutter_bloc`, `equatable`, `file_picker`, `just_audio`.
    - [x] Setup `assets/fonts`, `assets/images`, `assets/vectors`.
- [x] **Core Logic**
    - [x] Create `Failure` & `Exception` classes (handling error biar seragam).
    - [x] Create `AppTheme` (Dark & Light theme data, button styles, input decoration).
    - [x] Initialize `ServiceLocator` (GetIt setup).

### 🚀 PHASE 2: ENTRY POINT (SPLASH & AUTH)
- [x] **Auth Domain Layer**
    - [x] `UserEntity`: id, email, name, image.
    - [x] `AuthRepository` (Interface): `signup()`, `signin()`, `getUser()`.
    - [x] Use Cases: `SignupUseCase`, `SigninUseCase`, `GetUserUseCase`.
- [x] **Auth Data Layer**
    - [x] `UserModel`: extends `UserEntity` + `fromJson`/`toJson`.
    - [x] `AuthRemoteDataSource`: Connect ke `Supabase.instance.client.auth`.
    - [x] `AuthRepositoryImpl`: Jembatan antara DataSource dan Domain.
- [x] **Auth Presentation Layer**
    - [x] `AuthCubit/Bloc`: Manage state (Loading, Success, Error).
    - [ ] UI: `SplashPage` (Logic: `auth.currentUser != null` ? Home : GetStarted).
    - [ ] UI: `GetStartedPage`.
    - [ ] UI: `SignupPage` (Input validation + Call SignupUseCase).
    - [ ] UI: `LoginPage`.

### 🎨 PHASE 3: APP PREFERENCE (THEME)
- [ ] **Theme Domain**
    - [ ] `ChangeThemeUseCase`.
- [ ] **Theme Data**
    - [ ] `ThemeLocalDataSource`: Simpan pilihan user ke `SharedPreferences`.
- [ ] **Theme Presentation**
    - [ ] `ThemeCubit`: Global state buat ganti `ThemeMode`.
    - [ ] UI: `ChooseModePage`.

### 📤 PHASE 4: CONTENT UPLOAD (THE CREATOR)
- [ ] **Upload Domain**
    - [ ] `UploadSongParams`: File audio, File cover, Title, dsb.
    - [ ] `UploadSongUseCase`.
- [ ] **Upload Data**
    - [ ] `StorageRepository`: Method buat `uploadFile` ke Supabase Bucket.
    - [ ] `SongRepositoryImpl`: Method `createSong` (simpan metadata ke table `songs`).
- [ ] **Upload Presentation**
    - [ ] `UploadCubit`: Manage upload progress (0% - 100%).
    - [ ] Logic: Pick Audio & Image (pake `file_picker`).
    - [ ] UI: `UploadSongPage` (Form input + Progress bar).

### 🎵 PHASE 5: MUSIC LIBRARY (HOME)
- [ ] **Library Domain**
    - [ ] `SongEntity`: id, title, artist, duration, urls.
    - [ ] `GetSongsUseCase`, `GetNewSongsUseCase`.
- [ ] **Library Data**
    - [ ] `SongModel`: Mapping dari Supabase Table.
    - [ ] `SongRemoteDataSource`: `select()` data dari table `songs`.
- [ ] **Library Presentation**
    - [ ] `SongsCubit`: Fetch data pas Home dibuka.
    - [ ] UI: `HomePage` (Tabs: News, Video, Artists, Podcast).
    - [ ] UI: `SongCardWidget` & `SongListWidget`.

### 🎧 PHASE 6: MEDIA PLAYER (THE CORE)
- [ ] **Player Infrastructure**
    - [ ] Setup `AudioPlayer` sebagai Singleton di `ServiceLocator`.
- [ ] **Player Logic**
    - [ ] `PlayerCubit`: Handle `play(url)`, `pause()`, `seek()`, `updatePosition()`.
    - [ ] Logic: Kalkulasi `currentPosition` vs `totalDuration`.
- [ ] **Player UI**
    - [ ] UI: `MiniPlayer`: Floating widget yang muncul pas lagu mulai.
    - [ ] UI: `SongPlayerPage`: Vinyl animation, Slider, Play/Pause button, Next/Prev.

### ❤️ PHASE 7: PROFILE & FAVORITES
- [ ] **Favorite Domain**
    - [ ] `FavoriteEntity`.
    - [ ] `ToggleFavoriteUseCase`, `GetFavoriteSongsUseCase`.
- [ ] **Favorite Data**
    - [ ] Update `SongRepositoryImpl` buat handle table `favorites` (Join table).
- [ ] **Profile Presentation**
    - [ ] `ProfileCubit`: Ambil data user + List lagu yang di-like.
    - [ ] UI: `ProfilePage`.
    - [ ] UI: `FavoriteListWidget`.