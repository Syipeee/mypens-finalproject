class ListKegiatanResponse {
  String? nomor;
  String? kelompokKegiatan;
  String? namaKegiatan;
  String? tanggalAwalPelaksanaan;
  String? tanggalAkhirPelaksanaan;
  String? tanggalAwalPendafataran;
  String? tanggalAkhirPendafataran;
  String? kouta;
  String? tanggalCreate;
  String? keterangan;
  String? adaPenguji;
  String? urlTautan;

  ListKegiatanResponse({
    this.nomor,
    this.kelompokKegiatan,
    this.namaKegiatan,
    this.tanggalAwalPelaksanaan,
    this.tanggalAkhirPelaksanaan,
    this.tanggalAwalPendafataran,
    this.tanggalAkhirPendafataran,
    this.kouta,
    this.tanggalCreate,
    this.keterangan,
    this.adaPenguji,
    this.urlTautan,
  });

  factory ListKegiatanResponse.fromJson(Map<String, dynamic> json) {
    return ListKegiatanResponse(
      nomor: json['NOMOR'],
      kelompokKegiatan: json['KELOMPOK_KEGIATAN'],
      namaKegiatan: json['NAMA_KEGIATAN'],
      tanggalAwalPelaksanaan: json['TANGGAL_AWAL_PELAKSANAAN'],
      tanggalAkhirPelaksanaan: json['TANGGAL_AKHIR_PELAKSANAAN'],
      tanggalAwalPendafataran: json['TANGGAL_AWAL_PENDAFTARAN'],
      tanggalAkhirPendafataran: json['TANGGAL_AKHIR_PENDAFTARAN'],
      kouta: json['KOUTA'],
      tanggalCreate: json['TANGGAL_CREATE'],
      keterangan: json['KETERANGAN'],
      adaPenguji: json['ADA_PENGUJI'],
      urlTautan: json['URL_TAUTAN'],
    );
  }

  Map<String, dynamic> toJson() => {
        'NOMOR': nomor,
        'KELOMPOK_KEGIATAN': kelompokKegiatan,
        'NAMA_KEGIATAN': namaKegiatan,
        'TANGGAL_AWAL_PELAKSANAAN': tanggalAwalPelaksanaan,
        'TANGGAL_AKHIR_PELAKSANAAN': tanggalAkhirPelaksanaan,
        'TANGGAL_AWAL_PENDAFTARAN': tanggalAwalPendafataran,
        'TANGGAL_AKHIR_PENDAFTARAN': tanggalAkhirPendafataran,
        'KOUTA': kouta,
        'TANGGAL_CREATE': tanggalCreate,
        'KETERANGAN': keterangan,
        'ADA_PENGUJI': adaPenguji,
        'URL_TAUTAN': urlTautan,
      };
}
