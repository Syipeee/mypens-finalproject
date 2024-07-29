class AssessmentResponse {
  String status;
  int code;
  List<ReadAssessmentData> data;

  AssessmentResponse({
    required this.status,
    required this.code,
    required this.data,
  });

  factory AssessmentResponse.fromJson(Map<String, dynamic> json) {
    return AssessmentResponse(
      status: json['status'],
      code: json['code'],
      data: List<ReadAssessmentData>.from(
          json['data'].map((x) => ReadAssessmentData.fromJson(x))),
    );
  }
}

class ReadAssessmentData {
  String nomor;
  String kategoriAssessment;
  String pendaftar;
  String nilai;
  String pegawai;
  String tanggal;
  String vmitra;

  ReadAssessmentData({
    required this.nomor,
    required this.kategoriAssessment,
    required this.pendaftar,
    required this.nilai,
    required this.pegawai,
    required this.tanggal,
    required this.vmitra,
  });

  factory ReadAssessmentData.fromJson(Map<String, dynamic> json) {
    return ReadAssessmentData(
      nomor: json['NOMOR'],
      kategoriAssessment: json['KATEGORI_ASSESMENT'] ?? '',
      pendaftar: json['PENDAFTAR'] ?? '',
      nilai: json['NILAI'] ?? '',
      pegawai: json['PEGAWAI'] ?? '',
      tanggal: json['TANGGAL'],
      vmitra: json['VMITRA'],
    );
  }
}
