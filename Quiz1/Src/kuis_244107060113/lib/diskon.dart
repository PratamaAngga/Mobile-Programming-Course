/// Menjumlahkan semua harga dalam list menggunakan for-in loop
double hitungTotal(List<double> daftarHarga) {
  double total = 0;
  for (double harga in daftarHarga) {
    total += harga;
  }
  return total;
}

/// Mengembalikan pesan keterangan diskon (nullable)
String? getPesanDiskon(double persen) {
  if (persen == 0.10) {
    return 'Selamat! Kamu mendapat diskon 10% karena belanja > Rp200.000';
  } else if (persen == 0.05) {
    return 'Kamu mendapat diskon 5% karena belanja Rp100.000 - Rp200.000';
  } else {
    return 'Belum ada diskon. Belanja lebih banyak untuk dapat diskon!';
  }
}