// To parse this JSON data, do
//
//     final unggahSoal = unggahSoalFromJson(jsonString);

import 'dart:convert';

UnggahSoal unggahSoalFromJson(String str) =>
    UnggahSoal.fromJson(json.decode(str));

String unggahSoalToJson(UnggahSoal data) => json.encode(data.toJson());

class UnggahSoal {
  UnggahSoal({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory UnggahSoal.fromJson(Map<String, dynamic> json) => UnggahSoal(
        status: json["status"],
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.tahun,
    required this.semester,
    required this.jenis,
    required this.nip,
    required this.dosen,
    required this.matakuliah,
    required this.kelas,
    required this.statusUnggahSoal,
    required this.statusValidasiSoal,
  });

  String tahun;
  String semester;
  String jenis;
  String nip;
  String dosen;
  String matakuliah;
  String kelas;
  String statusUnggahSoal;
  String statusValidasiSoal;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        tahun: json["TAHUN"],
        semester: json["SEMESTER"],
        jenis: json["JENIS"],
        nip: json["NIP"],
        dosen: json["DOSEN"],
        matakuliah: json["MATAKULIAH"],
        kelas: json["KELAS"],
        statusUnggahSoal: json["STATUS_UNGGAH_SOAL"],
        statusValidasiSoal: json["STATUS_VALIDASI_SOAL"],
      );

  Map<String, dynamic> toJson() => {
        "TAHUN": tahun,
        "SEMESTER": semester,
        "JENIS": jenis,
        "NIP": nip,
        "DOSEN": dosen,
        "MATAKULIAH": matakuliah,
        "KELAS": kelas,
        "STATUS_UNGGAH_SOAL": statusUnggahSoal,
        "STATUS_VALIDASI_SOAL": statusValidasiSoal,
      };
}
