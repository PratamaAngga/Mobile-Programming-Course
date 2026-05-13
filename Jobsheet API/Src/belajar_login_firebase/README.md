# Firebase Auth App

> A simple Flutter application demonstrating user authentication using Firebase Authentication.
>
> Aplikasi Flutter sederhana yang mendemonstrasikan autentikasi pengguna menggunakan Firebase Authentication.

---

## Description / Deskripsi

Proyek ini merupakan implementasi dasar sistem autentikasi pengguna pada aplikasi mobile menggunakan Flutter dan Firebase Authentication. Aplikasi mencakup alur lengkap dari halaman login, registrasi akun baru, hingga halaman profil setelah berhasil masuk.

This project is a basic implementation of a user authentication system in a mobile application using Flutter and Firebase Authentication. The application covers the complete flow from the login page, new account registration, to the profile page after successful login.

---

## Features / Fitur

- ✅ Login dengan Email dan Password / Login with Email and Password
- ✅ Registrasi akun baru / New account registration
- ✅ Navigasi otomatis setelah login berhasil / Automatic navigation after successful login
- ✅ Penanganan error dari Firebase / Firebase error handling

---

## Tech Stack

| Technology | Version | Purpose |
|------------|---------|---------|
| Flutter | ^3.x | UI Framework |
| Firebase Core | ^4.8.0 | Firebase initialization |
| Firebase Auth | ^6.5.0 | User authentication |

---

## Project Structure / Struktur Proyek

```
lib/
└── main.dart         # Entry point, semua screen dalam satu file
```

---

## Application Flow / Alur Aplikasi

```
App Start
    └── Firebase Initialize
            └── LoginScreen
                    ├── [Login Berhasil] ──→ ProfileScreen
                    └── [Belum punya akun] ──→ RegisterScreen
                                                    └── [Register Berhasil] ──→ ProfileScreen
```

---

## Key Concepts Learned / Konsep yang Dipelajari

- Integrasi Firebase ke dalam proyek Flutter menggunakan FlutterFire CLI
- Penggunaan `FirebaseAuth.instance` untuk operasi login dan registrasi
- Penanganan exception `FirebaseAuthException` untuk pesan error yang informatif
- Penggunaan `TextEditingController` dan penempatan yang benar di dalam `State`
- Pentingnya memanggil `dispose()` untuk mencegah memory leak
- Penambahan `Scaffold` sebagai ancestor wajib untuk widget Material seperti `TextField`
