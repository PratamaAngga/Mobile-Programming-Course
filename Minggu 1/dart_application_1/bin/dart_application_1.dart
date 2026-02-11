import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;
import 'package:dart_application_1/luas_segitiga.dart' as luas_segitiga;

void main(List<String> arguments) {
  print('Hello world: ${dart_application_1.calculate()}!');

  double a = 10;
  double t = 5;
  double hasil = luas_segitiga.luasSegitiga(a, t);

  print('alas: $a, Tinggi: $t');
  print('Luas Segitiga: $hasil');
}
