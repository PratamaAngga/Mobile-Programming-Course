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

/// Menampilkan seluruh hasil
void tampilkanHasil({
  required String nama,
  required String nim,
  required List<double> daftarHarga,
  required double totalAwal,
  required double besarDiskon,
  required double totalAkhir,
  required double persen,
  required String? pesanDiskon,
}) {
  print('============================================');
  print('   SISTEM PENGOLAH DISKON TOKO');
  print('============================================');
  print('Nama      : $nama');
  print('NIM       : $nim');
  print('--------------------------------------------');
  print('Daftar Harga Barang:');
  for (int i = 0; i < daftarHarga.length; i++) {
    print('  Barang ${i + 1}  : Rp${daftarHarga[i].toStringAsFixed(0)}');
  }
  print('--------------------------------------------');
  print('Total Awal    : Rp${totalAwal.toStringAsFixed(0)}');
  print('Besar Diskon  : Rp${besarDiskon.toStringAsFixed(0)} (${(persen * 100).toStringAsFixed(0)}%)');
  print('Total Akhir   : Rp${totalAkhir.toStringAsFixed(0)}');
  print('--------------------------------------------');
  // Operator ! dipakai karena pesanDiskon sudah pasti terisi di sini
  print('Keterangan    : ${pesanDiskon!}');
  print('============================================');
}