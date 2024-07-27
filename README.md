#### Dokumentasi Aplikasi Catatan Harian

### Deskripsi Aplikasi
Aplikasi ini adalah aplikasi catatan harian sederhana yang membantu pengguna mencatat kegiatan sehari-hari, tugas-tugas, dan pengingat penting lainnya. Aplikasi ini dilengkapi dengan fitur login untuk memastikan catatan disimpan secara pribadi. Catatan disimpan secara lokal menggunakan SQLite dan pengguna dapat menerima notifikasi untuk pengingat tugas atau kegiatan yang dijadwalkan.

### Fitur Utama
1. **Autentikasi Pengguna**: Pengguna dapat mendaftar dan login untuk menyimpan catatan secara pribadi.
2. **Catatan Harian**: Pengguna dapat menambah, mengedit, dan menghapus catatan.
3. **Pengingat**: Pengguna dapat menetapkan waktu dan tanggal pengingat untuk catatan.
4. **Notifikasi**: Pengguna akan menerima notifikasi pada waktu yang telah dijadwalkan.
5. **Simpan Riwayat Login**: Jika pengguna telah login, aplikasi akan menyimpan riwayat login sehingga tidak perlu login kembali.

### Struktur Proyek
```
daily_notes_app/
├── android/
├── assets/
├── ios/
├── lib/
│   ├── models/
│   │   └── note.dart
|   |   ├── user.dart
│   ├── providers/
│   │   ├── auth_provider.dart
│   │   └── notes_provider.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   └── note_edit_screen.dart
│   ├── services/
│   │   ├── database_helper.dart
│   │   └── notification_helper.dart
│   ├── widgets/
│   │   └── note_item.dart
│   ├── main.dart
├── pubspec.yaml
```

### Instalasi dan Konfigurasi

1. **Kloning Proyek**
   ```
   git clone https://github.com/username/daily_notes_app.git
   cd daily_notes_app
   ```

2. **Menginstall Dependensi**
   ```
   flutter pub get
   ```

3. **Menjalankan Aplikasi**
   ```
   flutter run
   ```

### Panduan Penggunaan

#### Halaman Login
- **Login**: Masukkan username dan password yang sudah didaftarkan, kemudian tekan tombol "Login".
- **Pendaftaran**: Jika belum memiliki akun, tekan tombol "Register".

#### Halaman Pendaftaran
- **Username**: Masukkan username yang diinginkan.
- **Password**: Masukkan password yang diinginkan.
- **Register**: Setelah mengisi kedua field, tekan tombol "Register".

#### Halaman Utama (Home)
- **Logout**: Tekan ikon logout di pojok kanan atas untuk keluar dari aplikasi.
- **Tambah Catatan**: Tekan tombol "+" di pojok kanan bawah untuk menambah catatan baru.

#### Halaman Tambah/Edit Catatan
- **Title**: Masukkan judul catatan.
- **Description**: Masukkan deskripsi catatan.
- **Set Reminder Time**: Tekan tombol "Set Reminder Time" untuk memilih waktu pengingat.
- **Save Note**: Tekan tombol "Save Note" untuk menyimpan catatan.

#### Notifikasi
Pengguna akan menerima notifikasi pada waktu yang telah ditetapkan saat membuat atau mengedit catatan.

### Penjelasan Detail Struktur Proyek

#### `lib/main.dart`
File utama untuk menjalankan aplikasi. Inisialisasi notifikasi dan SharedPreferences dilakukan di sini.

#### `lib/models/note.dart`
Model untuk catatan yang mencakup properti seperti `id`, `title`, `description`, dan `reminderTime`.

#### `lib/providers/auth_provider.dart`
Provider untuk mengelola autentikasi pengguna. Menyediakan metode untuk login, register, logout, dan menyimpan riwayat login menggunakan SharedPreferences.

#### `lib/providers/notes_provider.dart`
Provider untuk mengelola catatan harian. Menyediakan metode untuk menambah, memperbarui, menghapus, dan memuat catatan dari database SQLite.

#### `lib/screens/home_screen.dart`
Halaman utama yang menampilkan daftar catatan dan menyediakan tombol untuk logout serta menambah catatan baru.

#### `lib/screens/login_screen.dart`
Halaman untuk login pengguna. Jika login berhasil, pengguna akan diarahkan ke `HomeScreen`.

#### `lib/screens/register_screen.dart`
Halaman untuk pendaftaran pengguna baru. Jika pendaftaran berhasil, pengguna akan diarahkan ke `LoginScreen`.

#### `lib/screens/note_edit_screen.dart`
Halaman untuk menambah atau mengedit catatan. Pengguna dapat memasukkan judul, deskripsi, dan menetapkan waktu pengingat.

#### `lib/services/database_helper.dart`
Helper untuk mengelola database SQLite. Menyediakan metode untuk membuat tabel, menambah catatan, memperbarui catatan, dan mengambil catatan dari database.

#### `lib/services/notification_helper.dart`
Helper untuk mengelola notifikasi menggunakan `flutter_local_notifications`. Menyediakan metode untuk inisialisasi notifikasi dan penjadwalan notifikasi.

#### `lib/widgets/note_item.dart`
Widget untuk menampilkan catatan individual dalam daftar catatan di `HomeScreen`.

Dengan panduan ini, Anda seharusnya bisa memahami struktur proyek, cara instalasi, dan penggunaan aplikasi catatan harian ini.
