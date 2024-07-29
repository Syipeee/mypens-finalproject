class Pendaftar {
  final String nomor;
  final String kegiatan;
  final String mahasiswa;
  final String pembimbing;
  final String tanggalDaftar;
  final String statusDiterima;
  final String alasanDitolak;
  final String statusSuratPengantar;
  final String vmitra;
  final String vmitraLain;
  final String statusApproval;
  final String alasanPenolakanStApproval;
  final String urlFormnilaiMitra;
  final String tanggalAwal;
  final String tanggalAkhir;
  final String kegiatanPosisi;
  final String urlBuktiDiterima;
  final String urlInfoPosisi;

  Pendaftar({
    required this.nomor,
    required this.kegiatan,
    required this.mahasiswa,
    required this.pembimbing,
    required this.tanggalDaftar,
    required this.statusDiterima,
    required this.alasanDitolak,
    required this.statusSuratPengantar,
    required this.vmitra,
    required this.vmitraLain,
    required this.statusApproval,
    required this.alasanPenolakanStApproval,
    required this.urlFormnilaiMitra,
    required this.tanggalAwal,
    required this.tanggalAkhir,
    required this.kegiatanPosisi,
    required this.urlBuktiDiterima,
    required this.urlInfoPosisi,
  });

  factory Pendaftar.fromJson(Map<String, dynamic> json) {
    return Pendaftar(
      nomor: json['NOMOR'] ?? "",
      kegiatan: json['KEGIATAN'] ?? "",
      mahasiswa: json['MAHASISWA'] ?? "",
      pembimbing: json['PEMBIMBING'] ?? "",
      tanggalDaftar: json['TANGGAL_DAFTAR'] ?? "",
      statusDiterima: json['STATUS_DITERIMA'] ?? "",
      alasanDitolak: json['ALASAN_DITOLAK'] ?? "",
      statusSuratPengantar: json['STATUS_SURAT_PENGANTAR'] ?? "",
      vmitra: json['VMITRA'] ?? "",
      vmitraLain: json['VMITRA_LAIN'] ?? "",
      statusApproval: json['STATUS_APPROVAL'] ?? "",
      alasanPenolakanStApproval: json['ALASAN_PENOLAKAN_ST_APPROVAL'] ?? "",
      urlFormnilaiMitra: json['URL_FORMNILAI_MITRA'] ?? "",
      tanggalAwal: json['TANGGAL_AWAL'] ?? "",
      tanggalAkhir: json['TANGGAL_AKHIR'] ?? "",
      kegiatanPosisi: json['KEGIATAN_POSISI'] ?? "",
      urlBuktiDiterima: json['URL_BUKTI_DITERIMA'] ?? "",
      urlInfoPosisi: json['URL_INFO_POSISI'] ?? "",
    );
  }
}
