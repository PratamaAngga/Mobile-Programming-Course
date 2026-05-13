# Weather App with Firebase Authentication

> A Flutter weather application integrated with Firebase Authentication, featuring GPS-based location detection and manual city search.
>
> Aplikasi cuaca Flutter yang terintegrasi dengan Firebase Authentication, dilengkapi deteksi lokasi berbasis GPS dan pencarian kota secara manual.

---

## Description / Deskripsi

Proyek ini merupakan penggabungan dari dua proyek sebelumnya — Firebase Authentication dan Weather App — menjadi satu aplikasi yang utuh. Pengguna diwajibkan untuk login terlebih dahulu sebelum dapat mengakses data cuaca. Aplikasi mendukung dua metode pemilihan lokasi: deteksi otomatis menggunakan GPS perangkat, serta pencarian manual berdasarkan nama kota.

This project is a combination of the two previous projects — Firebase Authentication and Weather App — into a single complete application. Users are required to log in before being able to access weather data. The application supports two location selection methods: automatic detection using the device's GPS, and manual search by city name.

---

## Features / Fitur

- ✅ Registrasi dan login pengguna via Firebase Authentication / User registration and login via Firebase Authentication
- ✅ Auto-redirect berdasarkan status sesi login / Auto-redirect based on login session status
- ✅ Fetch cuaca otomatis via GPS saat pertama buka / Automatic weather fetch via GPS on first open
- ✅ Pencarian cuaca berdasarkan nama kota / Weather search by city name
- ✅ Menampilkan suhu terkini, deskripsi cuaca, dan kecepatan angin / Display current temperature, weather description, and wind speed
- ✅ Prakiraan cuaca per jam (8 jam ke depan) / Hourly forecast (next 8 hours)
- ✅ Pull-to-refresh untuk memperbarui data cuaca / Pull-to-refresh to update weather data
- ✅ Logout dan kembali ke halaman login / Logout and return to login page
- ✅ Validasi input pada form login dan registrasi / Input validation on login and registration forms

---

## Tech Stack

| Technology | Version | Purpose |
|------------|---------|---------|
| Flutter | ^3.x | UI Framework |
| Firebase Core | ^4.8.0 | Firebase initialization |
| Firebase Auth | ^6.5.0 | User authentication |
| Dio | ^5.4.0 | HTTP Client |
| Geolocator | ^12.0.0 | Akses GPS perangkat |
| Geocoding | ^3.0.0 | Konversi koordinat ↔ nama kota |
| Open-Meteo API | - | Sumber data cuaca |

---

## Project Structure / Struktur Proyek

```
lib/
├── main.dart                    # Entry point & auth state listener
├── firebase_options.dart        # Konfigurasi Firebase (auto-generated)
├── screens/
│   ├── splash_screen.dart       # Splash screen saat inisialisasi
│   ├── login_screen.dart        # Halaman login
│   ├── register_screen.dart     # Halaman registrasi
│   └── home_screen.dart         # Halaman utama cuaca
├── services/
│   ├── auth_service.dart        # Logika Firebase Authentication
│   └── weather_service.dart     # Logika fetch data cuaca & lokasi
└── models/
    └── weather_model.dart       # Data model cuaca
```

---

## Setup & Installation / Instalasi

**1. Masuk ke folder proyek**
```bash
cd weather_app_with_login
```

**2. Install dependencies**
```bash
flutter pub get
```

**3. Konfigurasi Firebase**
- Pastikan sudah memiliki project di [Firebase Console](https://console.firebase.google.com)
- Aktifkan **Email/Password** pada menu Authentication → Sign-in method
- Jalankan perintah berikut untuk konfigurasi otomatis:
```bash
flutterfire configure
```
- Pastikan file `firebase_options.dart` dan `android/app/google-services.json` sudah tersedia

**4. Tambahkan permission lokasi di `android/app/src/main/AndroidManifest.xml`**
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```

**5. Jalankan aplikasi**
```bash
flutter run
```

---

## Application Flow / Alur Aplikasi

```
App Start
    └── SplashScreen
            └── StreamBuilder (cek status login)
                    ├── [Sudah login] ──→ HomeScreen
                    │                       ├── GPS → fetch cuaca otomatis
                    │                       ├── Search kota → fetch cuaca manual
                    │                       ├── Pull-to-refresh
                    │                       └── Logout ──→ LoginScreen
                    │
                    └── [Belum login] ──→ LoginScreen
                                            └── [Belum punya akun] ──→ RegisterScreen
```

---

## Weather Code Mapping / Pemetaan Kode Cuaca

| Weather Code | Description |
|-------------|-------------|
| 0 | Clear Sky ☀️ |
| 1 – 3 | Partly Cloudy ⛅ |
| 45 – 49 | Foggy 🌫️ |
| 51 – 69 | Rainy 🌧️ |
| 71 – 79 | Snowy ❄️ |
| 80 – 99 | Thunderstorm ⛈️ |

---

## Key Concepts Learned / Konsep yang Dipelajari

- Integrasi Firebase Authentication dengan alur multi-screen
- Penggunaan `StreamBuilder` dengan `authStateChanges()` untuk manajemen sesi login secara reaktif
- Pemisahan logika bisnis ke dalam layer `services/` agar kode lebih terstruktur dan mudah di-maintain
- Implementasi layanan GPS menggunakan Geolocator dan konversi koordinat menggunakan Geocoding
- Penggunaan `initState()` untuk melakukan operasi awal saat widget pertama kali dimuat
- Penerapan `RefreshIndicator` dengan `AlwaysScrollableScrollPhysics` untuk fitur pull-to-refresh
- Validasi input form sebelum melakukan request ke layanan eksternal
- Penanganan berbagai kondisi error dari Firebase dan API secara informatif
