class KategoriAssessment {
  String? nomor;
  String? kategoriAssessment;
  String? kegiatan;
  String? bobot;
  String? jenisAssessment;

  KategoriAssessment({
    this.nomor,
    this.kategoriAssessment,
    this.kegiatan,
    this.bobot,
    this.jenisAssessment,
  });

  factory KategoriAssessment.fromJson(Map<String, dynamic> json) {
    return KategoriAssessment(
      nomor: json['NOMOR'],
      kategoriAssessment: json['KATEGORI_ASSESMENT'],
      kegiatan: json['KEGIATAN'],
      bobot: json['BOBOT'],
      jenisAssessment: json['JENIS_ASSESMENT'],
    );
  }

  Map<String, dynamic> toJson() => {
        'NOMOR': nomor,
        'KATEGORI_ASSESMENT': kategoriAssessment,
        'KEGIATAN': kegiatan,
        'BOBOT': bobot,
        'JENIS_ASSESMENT': jenisAssessment,
      };
}
