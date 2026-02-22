void main() {
  // ------- DYNAMIC TYPE ------
  dynamic nilai = 100;
  print('$nilai');
  nilai = 'seratus';
  print('$nilai');
  nilai = true;
  print('$nilai');

  // TIPE DATA BAWAAN: INT DAN DOUBLE
  print('-----------------------------------------');
  // int: bilangan bulat
  int jumlahPengguna = 1000;
  int suhu = -15;
  int besar = 9223372036854775807;
  print('Jumlah Pengguna: $jumlahPengguna, Suhu: $suhu, Bilangan besar: $besar');
  // double: bilangan desimal
  double pi = 3.14159;
  double temperatur = 36.5;
  double harga = 99.99;
  print('Phi: $pi, Temperatur: $temperatur, Harga: $harga');
  // String
  String salam = 'Halo';
  String pesan = "Dunia";
  String multi = '''
  Teks
  multi-baris
  ''';
  print('Salam: $salam, Pesan: $pesan, Multi Baris: $multi');
  // bool
  bool aktif = true;
  bool selesai = false;
  bool valid = (10 > 5);
  print('Aktif: $aktif, Selesai: $selesai, Valid: $valid');
}