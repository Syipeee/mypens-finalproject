class VAssessmentResponse {
  String status;
  int code;
  List<VReadAssessmentData> data;

  VAssessmentResponse({
    required this.status,
    required this.code,
    required this.data,
  });

  factory VAssessmentResponse.fromJson(Map<String, dynamic> json) {
    return VAssessmentResponse(
      status: json['status'],
      code: json['code'],
      data: List<VReadAssessmentData>.from(
          json['data'].map((x) => VReadAssessmentData.fromJson(x))),
    );
  }
}

class VReadAssessmentData {
  String nomor;
  String namaKategoriAssessment;
  String kategoriAssessment;
  String mahasiswa;
  String nrp;
  String nama;
  String nilai;
  String pegawai;
  String namaPegawai;
  String tanggal;
  String vmitra;
  String namaVmitra;

  VReadAssessmentData({
    required this.nomor,
    required this.namaKategoriAssessment,
    required this.kategoriAssessment,
    required this.mahasiswa,
    required this.nrp,
    required this.nama,
    required this.nilai,
    required this.pegawai,
    required this.namaPegawai,
    required this.tanggal,
    required this.vmitra,
    required this.namaVmitra,
  });

  factory VReadAssessmentData.fromJson(Map<String, dynamic> json) {
    return VReadAssessmentData(
      nomor: json['NOMOR'],
      namaKategoriAssessment: json['NAMA_KATEGORI_ASSESMENT'] ?? '',
      kategoriAssessment: json['KATEGORI_ASSESMENT'] ?? '',
      mahasiswa: json['MAHASISWA'] ?? '',
      nrp: json['NRP'] ?? '',
      nama: json['NAMA'] ?? '',
      nilai: json['NILAI'] ?? '',
      pegawai: json['PEGAWAI'] ?? '',
      namaPegawai: json['NAMA_PEGAWAI'] ?? '',
      tanggal: json['TANGGAL'],
      vmitra: json['VMITRA'],
      namaVmitra: json['NAMA_VMITRA'] ?? '',
    );
  }
}
