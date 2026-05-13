# Weather App

> A simple Flutter weather application consuming the Open-Meteo API to display current weather and hourly forecast data.
>
> Aplikasi cuaca Flutter sederhana yang mengonsumsi Open-Meteo API untuk menampilkan data cuaca terkini dan prakiraan per jam.

---

## Description / Deskripsi

Proyek ini merupakan implementasi aplikasi cuaca sederhana menggunakan Flutter. Aplikasi mengambil data cuaca secara real-time dari Open-Meteo API yang bersifat gratis dan tidak memerlukan API key. Data yang ditampilkan meliputi suhu terkini dan prakiraan suhu per jam.

This project is a simple weather application implementation using Flutter. The application retrieves real-time weather data from the Open-Meteo API, which is free and requires no API key. The displayed data includes current temperature and hourly temperature forecasts.

---

## Features / Fitur

- ✅ Menampilkan suhu terkini / Display current temperature
- ✅ Prakiraan suhu per jam / Hourly temperature forecast
- ✅ Fetch data dengan menekan tombol / Fetch data on button press
- ✅ Tampilan daftar waktu dan suhu secara berdampingan / Side-by-side time and temperature list

---

## Tech Stack

| Technology | Version | Purpose |
|------------|---------|---------|
| Flutter | ^3.x | UI Framework |
| Dio | ^5.4.0 | HTTP Client untuk konsumsi API |
| Open-Meteo API | - | Sumber data cuaca (gratis, tanpa API key) |

---

## Project Structure / Struktur Proyek

```
lib/
├── main.dart         # Entry point & UI utama
├── client.dart       # HTTP client untuk request ke API
└── model.dart        # Data model WeatherModel
```

---

## API Reference

Aplikasi ini menggunakan [Open-Meteo API](https://open-meteo.com/) yang bersifat open-source dan gratis.

**Endpoint yang digunakan:**
```
GET https://api.open-meteo.com/v1/forecast
    ?latitude={lat}
    &longitude={lon}
    &current_weather=true
    &hourly=temperature_2m
```

**Contoh Response:**
```json
{
  "current_weather": {
    "temperature": 15.2,
    "windspeed": 10.5,
    "weathercode": 3,
    "time": "2024-01-01T12:00"
  },
  "hourly": {
    "time": ["2024-01-01T00:00", "..."],
    "temperature_2m": [12.1, 13.5, "..."]
  }
}
```

---

## Setup & Installation / Instalasi

**1. Masuk ke folder proyek**
```bash
cd belajar_weather_app
```

**2. Install dependencies**
```bash
flutter pub get
```

**3. Jalankan aplikasi**
```bash
flutter run
```

> Tidak diperlukan konfigurasi API key. / No API key configuration required.

---

## Key Concepts Learned / Konsep yang Dipelajari

- Konsumsi REST API menggunakan package Dio
- Penggunaan `response.data` dari Dio (bukan `response.toString()`)
- Pembuatan data model dengan factory constructor `fromJson`
- Penggunaan `setState()` untuk memperbarui UI setelah data diterima
- Penempatan `TextEditingController` yang benar di dalam `State` class
- Penggunaan `SingleChildScrollView` untuk konten yang melampaui tinggi layar

---

## Notes / Catatan

> **Penting:** Dio secara otomatis melakukan parsing JSON pada response. Gunakan `response.data` langsung sebagai `Map<String, dynamic>` tanpa perlu memanggil `jsonDecode(response.toString())`.

> **Important:** Dio automatically parses JSON responses. Use `response.data` directly as `Map<String, dynamic>` without needing to call `jsonDecode(response.toString())`.