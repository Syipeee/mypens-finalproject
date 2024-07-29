class JenisAssessment {
  String? nomor;
  String? jenis;
  String? bobot;

  JenisAssessment({
    this.nomor,
    this.jenis,
    this.bobot,
  });

  factory JenisAssessment.fromJson(Map<String, dynamic> json) {
    return JenisAssessment(
      nomor: json['NOMOR'],
      jenis: json['JENIS'],
      bobot: json['BOBOT'],
    );
  }

  Map<String, dynamic> toJson() => {
        'NOMOR': nomor,
        'JENIS': jenis,
        'BOBOT': bobot,
      };
}
