class AssessmentResponseUpdate {
  String status;
  int code;
  final String nilai;
  final String? tanggal;

  AssessmentResponseUpdate({
    required this.status,
    required this.code,
    required this.nilai,
    required this.tanggal,
  });

  factory AssessmentResponseUpdate.fromJson(Map<String, dynamic> json) {
    return AssessmentResponseUpdate(
      status: json['status'],
      code: json['code'],
      nilai: json['data']['input']['NILAI'],
      tanggal: json['data']['input']['TANGGAL']?['value'],
    );
  }
}

// class AssessmentData {
//   UpdateAssessmentData input;
//   String status;
//   String deskripsi;
//   String sql;
 
//   AssessmentData({
//     required this.input,
//     required this.status,
//     required this.deskripsi,
//     required this.sql,
//   });

//   factory AssessmentData.fromJson(Map<String, dynamic> json) {
//     return AssessmentData(
//       input: UpdateAssessmentData.fromJson(json['input']),
//       status: json['status'],
//       deskripsi: json['deskripsi'],
//       sql: json['sql'],
//     );
//   }
// }

// class UpdateAssessmentData {
//   String nilai;
//   String? tanggal; // Mengubah tipe tanggal menjadi String

//   UpdateAssessmentData({
//     required this.nilai,
//     required this.tanggal,
//   });

//   factory UpdateAssessmentData.fromJson(Map<String, dynamic> json) {
//     return UpdateAssessmentData(
//       nilai: json['NILAI'],
//       tanggal: json['TANGGAL']['value'], // Mengambil nilai tanggal dari value
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['NILAI'] = nilai;
//     data['TANGGAL'] = tanggal; // Menggunakan langsung nilai tanggal
//     return data;
//   }
// }
