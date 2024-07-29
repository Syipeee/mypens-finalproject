class MahasiswaByIdDosen {
  final String nomor;
  final String nrp;
  final String nama;
  final String kelas;
  final String status;
  final String dosenWali;
  final String angkatan;
  final String tahunKurikulum;

  MahasiswaByIdDosen({
    required this.nomor,
    required this.nrp,
    required this.nama,
    required this.kelas,
    required this.status,
    required this.dosenWali,
    required this.angkatan,
    required this.tahunKurikulum,
  });

  factory MahasiswaByIdDosen.fromJson(Map<String, dynamic> json) {
    return MahasiswaByIdDosen(
      nomor: json['NOMOR'] ?? "",
      nrp: json['NRP'] ?? "",
      nama: json['NAMA'] ?? "",
      kelas: json['KELAS'] ?? "",
      status: json['STATUS'] ?? "",
      dosenWali: json['DOSEN_WALI'] ?? "",
      angkatan: json['ANGKATAN'] ?? "",
      tahunKurikulum: json['TAHUN_KURIKULUM'] ?? "",
    );
  }
}