// To parse this JSON data, do
//
//     final nilaiPerSemester = nilaiPerSemesterFromJson(jsonString);

import 'dart:convert';

NilaiPerSemester nilaiPerSemesterFromJson(String str) =>
    NilaiPerSemester.fromJson(json.decode(str));

String nilaiPerSemesterToJson(NilaiPerSemester data) =>
    json.encode(data.toJson());

class NilaiPerSemester {
  NilaiPerSemester({
    required this.status,
    required this.code,
    required this.data,
  });

  final String status;
  final int code;
  final List<Datum> data;

  factory NilaiPerSemester.fromJson(Map<String, dynamic> json) =>
      NilaiPerSemester(
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
    required this.mahasiswa,
    required this.nrp,
    required this.nama,
    required this.kode,
    required this.matakuliah,
    required this.sks,
    required this.tahun,
    required this.semester,
    required this.matakuliahJenis,
    required this.nh,
  });

  final String mahasiswa;
  final String nrp;
  final String nama;
  final String kode;
  final String matakuliah;
  final String sks;
  final String tahun;
  final String semester;
  final String matakuliahJenis;
  final String nh;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        mahasiswa: json["MAHASISWA"],
        nrp: json["NRP"],
        nama: json["NAMA"],
        kode: json["KODE"],
        matakuliah: json["MATAKULIAH"],
        sks: json["SKS"],
        tahun: json["TAHUN"],
        semester: json["SEMESTER"],
        matakuliahJenis: json["MATAKULIAH_JENIS"],
        nh: json["NH"],
      );

  Map<String, dynamic> toJson() => {
        "MAHASISWA": mahasiswa,
        "NRP": nrp,
        "NAMA": nama,
        "KODE": kode,
        "MATAKULIAH": matakuliah,
        "SKS": sks,
        "TAHUN": tahun,
        "SEMESTER": semester,
        "MATAKULIAH_JENIS": matakuliahJenis,
        "NH": nh,
      };
}
