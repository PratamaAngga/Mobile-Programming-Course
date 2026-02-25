// TUGAS 2 - KALKULATOR KONVERSI MATA UANG
import 'dart:io';
void main() {
  // Menggunakan map untuk menyimpan jenis konversi 
  final Map<String, double> daftarKurs = {
    'USD': 16800.0, // Dollar Amerika
    'SGD': 13300.0, // Dollar Singapura
    'JPY': 108.0,   // Yen Jepang
  };
  print('--- Kalkulator Konversi Mata Uang ---');
  // Menampilkan pilihan mata uang yang tersedia dari keys map
  print('Mata uang tersedia: ${daftarKurs.keys.join(', ')}');
  // Input uangnya
  stdout.write('Masukkan jumlah uang: ');
  final String? inputUang = stdin.readLineSync(); // Wajib pakai String? karena bisa null
  final double jumlahUang = double.parse(inputUang ?? '0'); // Pakai ?? untuk default value

  // Input mata uang atau kurs nya
  stdout.write('Masukkan jenis mata uang (USD/SGD/JPY): ');
  // Kita ubah input ke huruf besar agar cocok dengan key di map
  // Pakai ?. agar aman kalau inputnya null
  final String? kodeInput = stdin.readLineSync()?.toUpperCase();
  // Mencari kurs berdasarkan key yang diinput pengguna
  final double? kurs = daftarKurs[kodeInput];
  print('Jumlah: $jumlahUang $kodeInput');
  
  if (kurs != null) {
    final double hasilKonversi = jumlahUang * kurs;
    print('Kurs 1 $kodeInput = Rp$kurs');
    print('Total dalam Rupiah: Rp$hasilKonversi');
  } else {
    print('Maaf, mata uang tidak tersedia.');
  }
}