class LogbookMonitoring {
  final String nomor;
  final String pendaftar;
  final String pegawai;
  final String tanggalAwal;
  final String tanggalAkhir;
  final String tanggalMonitoring;
  final String catatan;
  final String approval;
  final String vmitra;

  LogbookMonitoring({
    required this.nomor,
    required this.pendaftar,
    required this.pegawai,
    required this.tanggalAwal,
    required this.tanggalAkhir,
    required this.tanggalMonitoring,
    required this.catatan,
    required this.approval,
    required this.vmitra,
  });

  factory LogbookMonitoring.fromJson(Map<String, dynamic> json) {
    return LogbookMonitoring(
      nomor: json['NOMOR'] ?? "",
      pendaftar: json['PENDAFTAR'] ?? "",
      pegawai: json['PEGAWAI'] ?? "",
      tanggalAwal: json['TANGGAL_AWAL'] ?? "",
      tanggalAkhir: json['TANGGAL_AKHIR'] ?? "",
      tanggalMonitoring: json['TANGGAL_MONITORING'] ?? "",
      catatan: json['CATATAN'] ?? "",
      approval: json['APPROVAL'] ?? "",
      vmitra: json['VMITRA'] ?? "",
    );
  }
}
