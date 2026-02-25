# Jobsheet 2 - Variables in Dart: A Complete Guide for Developers

In Jobsheet 2, I learned about the various types of variables in the Dart programming language. Not only variables with built-in data types like int, double, etc., but also various unique data types and security features in Dart, such as dynamic types and nullable types.

## Work constraints

1. When I try to create a new file and write the basic code

```bash
import 'package:luas_segitiga/luas_segitiga.dart' as luas_segitiga;
```

there is an error in the void section.After I found out, it turned out that the default folder for the flutter template, namely .dart_tool, had not been created yet, resulting in the error code.

2. In case study 5, the code provided wasn't sufficient to produce the desired output. So, as a solution, I added the required data and issued a print command to print the desired output.

before:
```bash
// STATUS KELULUSAN - STUDI KASUS 5
void main() {
  Map nilaiMahasiswa = { 'Matematika': 85, 'Fisika': 75, 'Pemrograman': 90, };
  double total = 0;
  nilaiMahasiswa.forEach((matkul, nilai) { total += nilai; });
  double rataRata = total / nilaiMahasiswa.length;
  String status = rataRata >= 60 ? 'LULUS' : 'TIDAK LULUS';
  String predikat;
  if (rataRata >= 90) { predikat = 'A'; } 
  else if (rataRata >= 80) { predikat = 'B'; } 
  else if (rataRata >= 70) { predikat = 'C'; } 
  else { predikat = 'D/E'; }
}
```

after:
```bash
// STATUS KELULUSAN - STUDI KASUS 5
void main() {
  Map nilaiMahasiswa = { 'Matematika': 85, 'Fisika': 75, 'Pemrograman': 90, 'Bahasa Inggris': 80};
  double total = 0;
  print('Nilai Mahasiswa:');
  nilaiMahasiswa.forEach((matkul, nilai) { total += nilai; print('$matkul: $nilai');});
  double rataRata = total / nilaiMahasiswa.length;
  String status = rataRata >= 60 ? 'LULUS' : 'TIDAK LULUS';
  String predikat;
  if (rataRata >= 90) { predikat = 'A'; } 
  else if (rataRata >= 80) { predikat = 'B'; } 
  else if (rataRata >= 70) { predikat = 'C'; } 
  else { predikat = 'D/E'; }
  print('Rata-rata: $rataRata');
  print('Status: $status');
  print('Predikat: $predikat');
}
```

