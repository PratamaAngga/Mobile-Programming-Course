import 'package:kuis_244107060113/diskon.dart';
import 'package:test/test.dart';

void main() {
  test('hitungTotal menjumlahkan semua harga dengan benar', () {
    List<double> hargaTest = [25000.0, 45000.0, 30000.0];
    expect(hitungTotal(hargaTest), 100000.0);
  });
}