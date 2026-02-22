void main() {
  //-------- DEKLARASI VARIABEL MENGGUNAKAN VAR --------
  var nama = 'John'; // Tipe String ditentukan otomatis
  var umur = 25; // Tipe int ditentukan otomatis
  // umur = 'dua puluh lima'; // Error: tipe tidak kompatibel
  print('Nama: $nama, Umur: $umur');

  //-------- DEKLARASI DENGAN TIPE EKSPLISIT --------
  print('-----------------------------');
  String name = 'John Doe';
  int age = 30;
  double tinggi = 175.5;
  bool aktif = true;
  print('Nama: $name, Umur: $age, Tinggi: $tinggi, Status: $aktif');
}