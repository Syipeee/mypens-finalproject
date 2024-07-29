class Pendaftar {
  String? nomor;
  String? kegiatan;
  String? mahasiswa;
  String? pembimbing;
  String? tanggalDaftar;
  String? statusDiterima;
  String? alasanDitolak;
  String? statusSuratPengantar;
  String? vmitra;
  String? vmitraLain;
  String? statusApproval;
  String? alasanPenolakanStApproval;
  String? urlFormnilaiMitra;
  String? tanggalAwal;
  String? tanggalAkhir;
  String? kegiatanPosisi;
  String? urlBuktiDiterima;
  String? urlInfoPosisi;

  Pendaftar({
    this.nomor,
    this.kegiatan,
    this.mahasiswa,
    this.pembimbing,
    this.tanggalDaftar,
    this.statusDiterima,
    this.alasanDitolak,
    this.statusSuratPengantar,
    this.vmitra,
    this.vmitraLain,
    this.statusApproval,
    this.alasanPenolakanStApproval,
    this.urlFormnilaiMitra,
    this.tanggalAwal,
    this.tanggalAkhir,
    this.kegiatanPosisi,
    this.urlBuktiDiterima,
    this.urlInfoPosisi,
  });

  factory Pendaftar.fromJson(Map<String, dynamic> json) {
    return Pendaftar(
      nomor: json["NOMOR"],
      kegiatan: json["KEGIATAN"],
      mahasiswa: json["MAHASISWA"],
      pembimbing: json["PEMBIMBING"],
      tanggalDaftar: json["TANGGAL_DAFTAR"],
      statusDiterima: json["STATUS_DITERIMA"],
      alasanDitolak: json["ALASAN_DITOLAK"],
      statusSuratPengantar: json["STATUS_SURAT_PENGANTAR"],
      vmitra: json["VMITRA"],
      vmitraLain: json["VMITRA_LAIN"],
      statusApproval: json["STATUS_APPROVAL"],
      alasanPenolakanStApproval: json["ALASAN_PENOLAKAN_ST_APPROVAL"],
      urlFormnilaiMitra: json["URL_FORMNILAI_MITRA"],
      tanggalAwal: json["TANGGAL_AWAL"],
      tanggalAkhir: json["TANGGAL_AKHIR"],
      kegiatanPosisi: json["KEGIATAN_POSISI"],
      urlBuktiDiterima: json["URL_BUKTI_DITERIMA"],
      urlInfoPosisi: json["URL_INFO_POSISI"],
    );
  }

  Map<String, dynamic> toJson() => {
        "NOMOR": nomor,
        "KEGIATAN": kegiatan,
        "MAHASISWA": mahasiswa,
        "PEMBIMBING": pembimbing,
        "TANGGAL_DAFTAR": tanggalDaftar,
        "STATUS_DITERIMA": statusDiterima,
        "ALASAN_DITOLAK": alasanDitolak,
        "STATUS_SURAT_PENGANTAR": statusSuratPengantar,
        "VMITRA": vmitra,
        "VMITRA_LAIN": vmitraLain,
        "STATUS_APPROVAL": statusApproval,
        "ALASAN_PENOLAKAN_ST_APPROVAL": alasanPenolakanStApproval,
        "URL_FORMNILAI_MITRA": urlFormnilaiMitra,
        "TANGGAL_AWAL": tanggalAwal,
        "TANGGAL_AKHIR": tanggalAkhir,
        "KEGIATAN_POSISI": kegiatanPosisi,
        "URL_BUKTI_DITERIMA": urlBuktiDiterima,
        "URL_INFO_POSISI": urlInfoPosisi,
      };
}
