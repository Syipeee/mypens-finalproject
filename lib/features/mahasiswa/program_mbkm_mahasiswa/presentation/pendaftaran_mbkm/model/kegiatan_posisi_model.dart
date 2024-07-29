class KegiatanPosisi {
  final String nomor;
  final String kegiatan;
  final String posisi;

  KegiatanPosisi({
    required this.nomor,
    required this.kegiatan,
    required this.posisi,
});

  factory KegiatanPosisi.fromJson(Map<String, dynamic> json) {
    return KegiatanPosisi(
        nomor: json['NOMOR'] ?? "",
        kegiatan: json['KEGIATAN'] ?? "",
        posisi: json['POSISI'] ?? "",
    );
  }
}