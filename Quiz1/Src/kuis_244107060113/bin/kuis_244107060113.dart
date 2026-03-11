import 'package:kuis_244107060113/diskon.dart' as diskon;

void main() {
  // == Identitas =============================
  String nama = 'Pratama Angga Saputra';
  String nim  = '244107060113';

  // 3 digit terakhir NIM
  double nilaiUnikNIM = 113.0;

  // == Daftar harga barang (minimal 5 elemen) ================
  List<double> daftarHarga = [
    25000.0,
    45000.0,
    30000.0,
    60000.0,
    15000.0,
  ];

  // Tambahkan nilaiUnikNIM sebagai elemen ke-6 via .add()
  daftarHarga.add(nilaiUnikNIM);

  // == Hitung total ===========================
  double totalAwal = diskon.hitungTotal(daftarHarga);

  // === Logika diskon (control flow) ==============
  double persen;
  if (totalAwal > 200000) {
    persen = 0.10;
  } else if (totalAwal >= 100000) {
    persen = 0.05;
  } else {
    persen = 0.0;
  }

  double besarDiskon = totalAwal * persen;
  double totalAkhir  = totalAwal - besarDiskon;

  // == Null safety: String? untuk keterangan diskon =======
  String? pesanDiskon = diskon.getPesanDiskon(persen);

  // == Tampilkan hasil ============================
  diskon.tampilkanHasil(
    nama        : nama,
    nim         : nim,
    daftarHarga : daftarHarga,
    totalAwal   : totalAwal,
    besarDiskon : besarDiskon,
    totalAkhir  : totalAkhir,
    persen      : persen,
    pesanDiskon : pesanDiskon,
  );
}