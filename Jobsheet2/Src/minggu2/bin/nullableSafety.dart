void main() {
  // ------ DEKLARASI NULLABLE DENGAN OPERATOR ? --------
  // NON NULLABLE (Default)
  String nama = 'John';
  // nama = null; // Error
  print('Nama: $nama');
  // NULLABLE DENGAN ?
  String? name = 'John';
  name = null; // Valid
  print('Name: $name');
  // PENGGUNAAN PRAKTIS
  int? umur;
  List<String>? daftar;
  Map<String, dynamic>? data;
  print('Umur: $umur, Daftar: $daftar, Data: $data');

  // ------- KATA KUNCI LATE -------
  print('---------------');
  late String deskripsi;
  late final String konfigurasi;
  deskripsi = 'Nilai yang ditunda';
  konfigurasi = 'Tetap setelah diisi';
  print(deskripsi); // Aman jika sudah diinisialisasi

  // ------- NULL ASSERTION OPERATOR --------
  print('---------------');
  String? namaNullable = 'John';
  String namaDefinitif = namaNullable!;
  int? panjang = namaNullable?.length;
  int definitif = panjang!; // Bahaya jika null
  print('Nama: $namaDefinitif, Panjang nama: $definitif');

  // ------- NULL AWARE OPERATOR ?? -------
  print('---------------');
  // operator ??
  String? nami;
  String tampil = nami ?? 'Anonim';
  // tampil = 'Anonim'
  print('$tampil');
  int? nilai = 100;
  int hasil = nilai ?? 0;
  // hasil = 100
  print('$hasil');

  // operator ??=
  int? jumlah;
  jumlah ??= 10;
  // jumlah sekarang = 10
  print('$jumlah');
  jumlah ??= 20;
  // jumlah tetap = 10
  print('$jumlah');
}