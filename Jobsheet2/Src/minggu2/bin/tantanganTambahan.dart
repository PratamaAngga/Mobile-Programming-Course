// TANTANGAN TAMBAHAN - MEMBUAT KONVERSI UNIT
import 'dart:io';

void main() {
  // Implementasi Map untuk menyimpan faktor konversi 
  // Kita pakai unit dasar: Panjang (Meter), Massa (Gram), Volume (Liter)
  final Map<String, Map<String, double>> konversiUnit = {
    'Panjang': {
      'KM': 1000.0,
      'M': 1.0,
      'CM': 0.01,
      'MM': 0.001,
      'INCI': 0.0254,
    },
    'Massa': {
      'KG': 1000.0,
      'G': 1.0,
      'MG': 0.001,
      'ONS': 100.0,
      'PON': 453.59,
    },
    'Volume': {
      'M3': 1000.0,
      'LITER': 1.0,
      'ML': 0.001,
      'GALON': 3.785,
      'CANGKIR': 0.24,
    },
  };

  print('=== Aplikasi Konversi Unit Serbaguna ===');
  print('Pilih Kategori:');
  print('1. Panjang\n2. Massa\n3. Volume\n4. Suhu');
  stdout.write('Masukkan pilihan (1-4): ');
  
  String? pilihan = stdin.readLineSync();

  // Logika Pemilihan Kategori
  if (pilihan == '4') {
    // Khusus suhu karena rumusnya bukan sekadar perkalian faktor
    konversiSuhu();
  } else {
    String kategori = '';
    if (pilihan == '1') kategori = 'Panjang';
    else if (pilihan == '2') kategori = 'Massa';
    else if (pilihan == '3') kategori = 'Volume';

    if (konversiUnit.containsKey(kategori)) {
      prosesKonversiUmum(kategori, konversiUnit[kategori]!);
    } else {
      print('Pilihan tidak valid!');
    }
  }
}

void prosesKonversiUmum(String namaKategori, Map<String, double> unitMap) {
  print('\n--- Konversi $namaKategori ---');
  print('Unit tersedia: ${unitMap.keys.join(', ')}');

  stdout.write('Masukkan nilai: ');
  double nilai = double.parse(stdin.readLineSync() ?? '0');

  // Validasi input hindari nilai negatif 
  if (nilai < 0) {
    print('Error: Nilai $namaKategori tidak boleh negatif!');
    return;
  }

  stdout.write('Dari unit: ');
  String dari = (stdin.readLineSync() ?? '').toUpperCase();
  stdout.write('Ke unit: ');
  String ke = (stdin.readLineSync() ?? '').toUpperCase();

  if (unitMap.containsKey(dari) && unitMap.containsKey(ke)) {
    // Rumus: (Nilai * Faktor Unit Asal) / Faktor Unit Tujuan
    double hasil = (nilai * unitMap[dari]!) / unitMap[ke]!;
    
    // Tampilkan hasil format rapi 
    print('\n[Hasil]: $nilai $dari = ${hasil.toStringAsFixed(4)} $ke');
  } else {
    print('Unit tidak ditemukan!');
  }
}

void konversiSuhu() {
  print('\n--- Konversi Suhu (Celcius ke Lainnya) ---');
  stdout.write('Masukkan suhu dalam Celsius: ');
  double c = double.parse(stdin.readLineSync() ?? '0');

  // Menggunakan operator aritmatika dan String interpolation
  double f = (c * 9 / 5) + 32;
  double k = c + 273.15;
  double r = c * 4 / 5;

  print('\n[Hasil]:');
  print('$c°C = ${f.toStringAsFixed(2)}°F');
  print('$c°C = ${k.toStringAsFixed(2)} K');
  print('$c°C = ${r.toStringAsFixed(2)}°Re');
}