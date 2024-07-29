/// Digunakan untuk menyimpan rekap absensi seorang mahasiswa di suatu tahun ajaran
/// dan di suatu semester
class RekapAbsensiMahasiswa {
  final List<MatkulRekapAbsensi> listMatkulRekapAbsensi;
  RekapAbsensiMahasiswa({
    required this.listMatkulRekapAbsensi,
  });
}

/// Digunakan untuk menyimpan rekap absensi per matkul
class MatkulRekapAbsensi {
  final String namaMatkul;
  /// one based-index (minggu ke-0 hanya data dummy)
  final List<MingguRekapAbsensi> listMingguRekapAbsensi;
  MatkulRekapAbsensi({
    required this.namaMatkul,
    required this.listMingguRekapAbsensi,
  });

}

/// Menyimpan pada suatu minggu, apa saja presensi yang sudah dicatat.
/// Contoh, pada minggu ke-2 : HHH
class MingguRekapAbsensi {
  final List<String> listKehadiranMingguIni;
  MingguRekapAbsensi({
    required this.listKehadiranMingguIni,
  });
}