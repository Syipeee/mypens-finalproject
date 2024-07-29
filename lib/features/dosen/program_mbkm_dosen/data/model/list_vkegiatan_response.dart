class ListVKegiatanResponse {
  String? nomor;
  String? namaKegiatan;
  String? kelompokKegiatan;
  String? namaKelompokKegiatan;
  String? kouta;
  String? tanggalAwalPendaftaran;
  String? tanggalAkhirPendaftaran;
  String? tanggalAwalPelaksanaan;
  String? tanggalAkhirPelaksanaan;

  ListVKegiatanResponse({
    this.nomor,
    this.namaKegiatan,
    this.kelompokKegiatan,
    this.namaKelompokKegiatan,
    this.kouta,
    this.tanggalAwalPendaftaran,
    this.tanggalAkhirPendaftaran,
    this.tanggalAwalPelaksanaan,
    this.tanggalAkhirPelaksanaan,
  });

  factory ListVKegiatanResponse.fromJson(Map<String, dynamic> json) {
    return ListVKegiatanResponse(
      nomor: json['NOMOR'],
      namaKegiatan: json['NAMA_KEGIATAN'],
      kelompokKegiatan: json['KELOMPOK_KEGIATAN'],
      namaKelompokKegiatan: json['NAMA_KELOMPOK_KEGIATAN'],
      kouta: json['KUOTA'],
      tanggalAwalPendaftaran: json['TANGGAL_AWAL_PENDAFTARAN'],
      tanggalAkhirPendaftaran: json['TANGGAL_AKHIR_PENDAFTARAN'],
      tanggalAwalPelaksanaan: json['TANGGAL_AWAL_PELAKSANAAN'],
      tanggalAkhirPelaksanaan: json['TANGGAL_AKHIR_PELAKSANAAN'],
    );
  }

  Map<String, dynamic> toJson() => {
        'NOMOR': nomor,
        'NAMA_KEGIATAN': namaKegiatan,
        'KELOMPOK_KEGIATAN': kelompokKegiatan,
        'NAMA_KELOMPOK_KEGIATAN': namaKelompokKegiatan,
        'KUOTA': kouta,
        'TANGGAL_AWAL_PENDAFTARAN': tanggalAwalPendaftaran,
        'TANGGAL_AKHIR_PENDAFTARAN': tanggalAkhirPendaftaran,
        'TANGGAL_AWAL_PELAKSANAAN': tanggalAwalPelaksanaan,
        'TANGGAL_AKHIR_PELAKSANAAN': tanggalAkhirPelaksanaan,
      };
}
