// To parse this JSON data, do
//
//     final rekapAbsensi = rekapAbsensiFromJson(jsonString);

import 'dart:convert';

RekapAbsensi rekapAbsensiFromJson(String str) =>
    RekapAbsensi.fromJson(json.decode(str));

String rekapAbsensiToJson(RekapAbsensi data) => json.encode(data.toJson());

class RekapAbsensi {
  RekapAbsensi({
    required this.status,
    required this.code,
    required this.data,
  });

  final String status;
  final int code;
  final List<Datum> data;

  factory RekapAbsensi.fromJson(Map<String, dynamic> json) => RekapAbsensi(
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
    required this.jam,
    required this.tahun,
    required this.semester,
    required this.tanggal,
    required this.minggu,
    required this.status,
    required this.prosenKehadiran,
  });

  final String mahasiswa;
  final String nrp;
  final String nama;
  final String kode;
  final String matakuliah;
  final String jam;
  final String tahun;
  final String semester;
  final String tanggal;
  final String minggu;
  final String status;
  final String prosenKehadiran;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        mahasiswa: json["MAHASISWA"],
        nrp: json["NRP"],
        nama: json["NAMA"],
        kode: json["KODE"],
        matakuliah: json["MATAKULIAH"],
        jam: json["JAM"],
        tahun: json["TAHUN"],
        semester: json["SEMESTER"],
        tanggal: json["TANGGAL"],
        minggu: json["MINGGU"],
        status: json["STATUS"],
        prosenKehadiran: json["PROSEN_KEHADIRAN"],
      );

  Map<String, dynamic> toJson() => {
        "MAHASISWA": mahasiswa,
        "NRP": nrp,
        "NAMA": nama,
        "KODE": kode,
        "MATAKULIAH": matakuliah,
        "JAM": jam,
        "TAHUN": tahun,
        "SEMESTER": semester,
        "TANGGAL": tanggal,
        "MINGGU": minggu,
        "STATUS": status,
        "PROSEN_KEHADIRAN": prosenKehadiran,
      };
}
