class KelompokKegiatan {
  final String nomor;
  final String kelompokKegiatan;
  final String bidangKegiatan;
  final String pegawaiPic;

  KelompokKegiatan({
    required this.nomor,
    required this.kelompokKegiatan,
    required this.bidangKegiatan,
    required this.pegawaiPic,
  });

  factory KelompokKegiatan.fromJson(Map<String, dynamic> json) {
    return KelompokKegiatan(
        nomor: json['NOMOR'],
        kelompokKegiatan: json['KELOMPOK_KEGIATAN'],
        bidangKegiatan: json['BIDANG_KEGIATAN'],
        pegawaiPic: json['PEGAWAI_PIC'],
    );
  }
}