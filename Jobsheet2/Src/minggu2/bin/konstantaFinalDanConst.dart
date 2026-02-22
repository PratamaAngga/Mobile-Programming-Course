void main() {
  // ------- KATA KUNCI FINAL --------
  final String nama = 'John';
  final tanggalLahir = DateTime.now();
  final List<int> angka = [1, 2, 3];
  // angka = [4, 5, 6]; // Error
  angka.add(4); // Diperbolehkan
  print('Nama: $nama, Tanggal Lahir: $tanggalLahir, Angka: $angka');

  // ------- KATA KUNCI CONST -------
  print('-------------------------------------');
  const double pi = 3.14159;
  const List<String> hari = ['Senin', 'Selasa', 'Rabu'];
  const Set<int> prima = {2, 3, 5, 7, 11};
  // hari.add('Kamis'); // Error: tidak bisa dimodifikasi
  print('Phi: $pi, Hari: $hari, Angka prima: $prima');
}