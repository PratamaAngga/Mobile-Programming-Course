// TUGAS 1 - MENGHITUNG BMI
import 'dart:io'; // Penting untuk inputan
void main() {
  print('--- Kalkulator BMI ---');
  // Meminta input berat badan
  // Kita pakai stdout.write biar kursor ketiknya ada di samping teks, bukan di bawah
  stdout.write('Masukkan berat badan (kg): ');
  // readLineSync() mengambil input sebagai String. Karena bisa saja kosong (null), 
  // kita beri tanda '??' atau default value sesuai konsep null safety agar jika null maka diisi 0
  final String? inputBerat = stdin.readLineSync();
  final double beratKg = double.parse(inputBerat ?? '0');

  // Meminta input tinggi badan
  stdout.write('Masukkan tinggi badan (cm): ');
  final String? inputTinggi = stdin.readLineSync();
  final double tinggiCm = double.parse(inputTinggi ?? '0');

  // Proses perhitungan tetap sama seperti sebelumnya
  final double tinggiM = tinggiCm / 100;
  
  // Menggunakan operator aritmatika [cite: 239]
  final double bmi = beratKg / (tinggiM * tinggiM);

  // Menentukan kategori menggunakan operator relasional dan ternary
  String kategori = bmi < 18.5 ? 'Kurus' : (bmi < 25 ? 'Normal' : (bmi < 30 ? 'Gemuk' : 'Obesitas'));

  // Output menggunakan String Interpolation
  print('--- Kalkulator BMI ---');
  print('Berat: $beratKg kg');
  print('Tinggi: $tinggiCm cm');
  print('BMI Anda: ${bmi.toStringAsFixed(2)}'); // Membatasi 2 angka di belakang koma
  print('Kategori: $kategori');
}