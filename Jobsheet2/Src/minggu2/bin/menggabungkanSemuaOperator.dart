// TUGAS 3 - MENGGABUNGKAN SEMUA OPERATOR
void main() {
  print('=== Sistem Integrasi Operator Dart ===');
  // 1. Operator Aritmatika & Penugasan: Menghitung total harga barang
  double hargaDasar = 250000;
  int jumlahBarang = 2;
  double total = hargaDasar * jumlahBarang; // Perkalian
  total += 15000; // Penugasan: Tambah biaya admin Rp15.000 
  // 2. Operator Relasional & Logika: Menentukan status akses dan promo
  bool isMember = true;
  bool punyaKupon = false;
  // Syarat diskon: Harus member DAN (belanja > 400rb ATAU punya kupon)
  bool dapatDiskon = isMember && (total > 400000 || punyaKupon);
  // 3. Operator Kondisional (Ternary)
  double diskon = dapatDiskon ? 0.15 : 0.05; 
  double hargaAkhir = total - (total * diskon);
  // 4. Operator Bitwise
  int kodeAksesLvl1 = 5; // Binary: 0101
  int kodeAksesLvl2 = 3; // Binary: 0011
  int gerbangFinal = kodeAksesLvl1 & kodeAksesLvl2; // Bitwise AND: 0001 (Desimal: 1)
  int enkripsiData = kodeAksesLvl1 ^ kodeAksesLvl2; // Bitwise XOR
  // 5. Operator Type Test: Memastikan tipe data sebelum diproses
  bool isHargaValid = hargaAkhir is double; // Cek apakah instansi dari double
  // 6. Output menggunakan String Interpolation
  print('Total Belanja Awal : Rp$total');
  print('Status Diskon      : ${dapatDiskon ? "Mendapat 15%" : "Mendapat 5%"}');
  print('Harga Akhir        : Rp$hargaAkhir');
  print('--- Data Bitwise ---');
  print('Hasil Bitwise AND  : $gerbangFinal');
  print('Hasil Bitwise XOR  : $enkripsiData');
  print('Tipe Data Valid    : $isHargaValid');
}