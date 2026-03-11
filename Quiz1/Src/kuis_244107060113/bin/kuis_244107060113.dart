import 'package:kuis_244107060113/diskon.dart' as diskon;

void main() {
  // ── Identitas ─────────────────────────────────────────────
  String nama = 'Pratama Angga Saputra';
  String nim  = '244107060113';

  // 3 digit terakhir NIM → 113
  double nilaiUnikNIM = 113.0;

  // ── Daftar harga barang (minimal 5 elemen) ────────────────
  List<double> daftarHarga = [
    25000.0,
    45000.0,
    30000.0,
    60000.0,
    15000.0,
  ];

  // Tambahkan nilaiUnikNIM sebagai elemen ke-6 via .add()
  daftarHarga.add(nilaiUnikNIM);

  // ── Hitung total ──────────────────────────────────────────
  double totalAwal = diskon.hitungTotal(daftarHarga);
}