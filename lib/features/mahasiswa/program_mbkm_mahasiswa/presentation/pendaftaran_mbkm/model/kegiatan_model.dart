class Kegiatan {
  final String nomor;
  final String kelompokKegiatan;
  final String namaKegiatan;
  final String tanggalAwalPelaksanaan;
  final String tanggalAkhirPelaksanaan;
  final String tanggalAwalPendaftaran;
  final String tanggalAkhirPendaftaran;
  final String kuota;
  final String tanggalCreate;
  final String keterangan;
  final String adaPenguji;
  final String urlTautan;

  Kegiatan({
    required this.nomor,
    required this.kelompokKegiatan,
    required this.namaKegiatan,
    required this.tanggalAwalPelaksanaan,
    required this.tanggalAkhirPelaksanaan,
    required this.tanggalAwalPendaftaran,
    required this.tanggalAkhirPendaftaran,
    required this.kuota,
    required this.tanggalCreate,
    required this.keterangan,
    required this.adaPenguji,
    required this.urlTautan,
  });

  factory Kegiatan.fromJson(Map<String, dynamic> json) {
    return Kegiatan(
      nomor: json['NOMOR'] ?? "",
      kelompokKegiatan: json['KELOMPOK_KEGIATAN'] ?? "",
      namaKegiatan: json['NAMA_KEGIATAN'] ?? "",
      tanggalAwalPelaksanaan: json['TANGGAL_AWAL_PELAKSANAAN'] ?? "",
      tanggalAkhirPelaksanaan: json['TANGGAL_AKHIR_PELAKSANAAN'] ?? "",
      tanggalAwalPendaftaran: json['TANGGAL_AWAL_PENDAFTARAN'] ?? "",
      tanggalAkhirPendaftaran: json['TANGGAL_AKHIR_PENDAFTARAN'] ?? "",
      kuota: json['KUOTA'] ?? "",
      tanggalCreate: json['TANGGAL_CREATE'] ?? "",
      keterangan: json['KETERANGAN'] ?? "",
      adaPenguji: json['ADA_PENGUJI'] ?? "",
      urlTautan: json['URL_TAUTAN'] ?? "",
    );
  }
}