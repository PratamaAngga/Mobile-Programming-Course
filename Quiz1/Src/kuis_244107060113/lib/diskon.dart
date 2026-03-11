/// Menjumlahkan semua harga dalam list menggunakan for-in loop
double hitungTotal(List<double> daftarHarga) {
  double total = 0;
  for (double harga in daftarHarga) {
    total += harga;
  }
  return total;
}