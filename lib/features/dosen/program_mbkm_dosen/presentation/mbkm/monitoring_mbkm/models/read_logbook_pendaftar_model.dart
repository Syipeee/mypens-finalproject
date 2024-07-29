class LogbookPendaftar {
  final String nomor;
  final String pendaftar;
  final String tanggal;
  final String namaKegiatan;
  final String latitude;
  final String longitude;

  LogbookPendaftar({
    required this.nomor,
    required this.pendaftar,
    required this.tanggal,
    required this.namaKegiatan,
    required this.latitude,
    required this.longitude,
  });

  factory LogbookPendaftar.fromJson(Map<String, dynamic> json) {
    return LogbookPendaftar(
      nomor: json['NOMOR'] ?? "",
      pendaftar: json['PENDAFTAR'] ?? "",
      tanggal: json['TANGGAL'] ?? "",
      namaKegiatan: json['NAMA_KEGIATAN'] ?? "",
      latitude: json['LATITUDE'] ?? "",
      longitude: json['LONGITUDE'] ?? "",
    );
  }
}
