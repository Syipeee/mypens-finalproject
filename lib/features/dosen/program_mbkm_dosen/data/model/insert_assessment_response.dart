class AssessmentResponse {
  String status;
  int code;
  List<AssessmentData> data;

  AssessmentResponse(
      {required this.status, required this.code, required this.data});

  factory AssessmentResponse.fromJson(Map<String, dynamic> json) {
    return AssessmentResponse(
      status: json['status'],
      code: json['code'],
      data: List<AssessmentData>.from(
          json['data'].map((x) => AssessmentData.fromJson(x))),
    );
  }
}

class AssessmentData {
  InsertAssessmentData input;
  String status;
  String deskripsi;
  String sql;

  AssessmentData(
      {required this.input,
      required this.status,
      required this.deskripsi,
      required this.sql});

  factory AssessmentData.fromJson(Map<String, dynamic> json) {
    return AssessmentData(
      input: InsertAssessmentData.fromJson(json['input']),
      status: json['status'],
      deskripsi: json['deskripsi'],
      sql: json['sql'],
    );
  }
}

class InsertAssessmentData {
  String kategoriAssesment;
  String pendaftar;
  String nilai;
  String vmitra;

  InsertAssessmentData({
    required this.kategoriAssesment,
    required this.pendaftar,
    required this.nilai,
    required this.vmitra,
  });

  factory InsertAssessmentData.fromJson(Map<String, dynamic> json) {
    return InsertAssessmentData(
      kategoriAssesment: json['KATEGORI_ASSESMENT'],
      pendaftar: json['PENDAFTAR'],
      nilai: json['NILAI'],
      vmitra: json['VMITRA'],
    );
  }
}
