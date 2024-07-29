class LogbookPendaftarDokumen {
  final String nomor;
  final String logbookPendaftar;
  final String url;

  LogbookPendaftarDokumen({
    required this.nomor,
    required this.logbookPendaftar,
    required this.url,
  });

  factory LogbookPendaftarDokumen.fromJson(Map<String, dynamic> json) {
    return LogbookPendaftarDokumen(
      nomor: json['NOMOR'] ?? "",
      logbookPendaftar: json['LOGBOOK_PENDAFTAR'] ?? "",
      url: json['URL'] ?? "",
    );
  }
}
