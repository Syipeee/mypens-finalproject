// To parse this JSON data, do
//
//     final jadwalKuliah = jadwalKuliahFromJson(jsonString);

import 'dart:convert';

JadwalKuliah jadwalKuliahFromJson(String str) =>
    JadwalKuliah.fromJson(json.decode(str));

String jadwalKuliahToJson(JadwalKuliah data) => json.encode(data.toJson());

class JadwalKuliah {
  JadwalKuliah({
    required this.status,
    required this.code,
    required this.data,
  });

  final String status;
  final int code;
  final List<Map<String, String>> data;

  factory JadwalKuliah.fromJson(Map<String, dynamic> json) => JadwalKuliah(
        status: json["status"],
        code: json["code"],
        data: List<Map<String, String>>.from(json["data"].map((x) => Map.from(x)
            .map((k, v) => MapEntry<String, String>(k, v ?? 'Kosong')))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => Map.from(x)
            .map((k, v) => MapEntry<String, dynamic>(k, v ?? 'Kosong')))),
      };
}

// To parse this JSON data, do
//
//     final jadwalKuliahClean = jadwalKuliahCleanFromJson(jsonString);
JadwalKuliahClean jadwalKuliahCleanFromJson(String str) =>
    JadwalKuliahClean.fromJson(json.decode(str));

String jadwalKuliahCleanToJson(JadwalKuliahClean data) =>
    json.encode(data.toJson());

class JadwalKuliahClean {
  JadwalKuliahClean({
    required this.status,
    required this.code,
    required this.data,
  });

  final String status;
  final int code;
  final List<Datum> data;

  factory JadwalKuliahClean.fromJson(Map<String, dynamic> json) =>
      JadwalKuliahClean(
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
    required this.durasi,
    required this.tahun,
    required this.semester,
    required this.nomorDosen,
    required this.nipDosen,
    required this.namaDosen,
    required this.hari,
    required this.jam,
    required this.ruang,
    required this.hari2,
    required this.jam2,
    required this.ruang2,
    required this.hari2Kp,
    required this.jam2Kp,
    required this.ruang2Kp,
  });

  final String mahasiswa;
  final String nrp;
  final String nama;
  final String kode;
  final String matakuliah;
  final String durasi;
  final String tahun;
  final String semester;
  final String nomorDosen;
  final String nipDosen;
  final String namaDosen;
  final String hari;
  final String jam;
  final String ruang;
  final String hari2;
  final String jam2;
  final String ruang2;
  final String hari2Kp;
  final String jam2Kp;
  final String ruang2Kp;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        mahasiswa: json["MAHASISWA"],
        nrp: json["NRP"],
        nama: json["NAMA"],
        kode: json["KODE"],
        matakuliah: json["MATAKULIAH"],
        durasi: json["DURASI"],
        tahun: json["TAHUN"],
        semester: json["SEMESTER"],
        nomorDosen: json["NOMOR_DOSEN"],
        nipDosen: json["NIP_DOSEN"],
        namaDosen: json["NAMA_DOSEN"],
        hari: json["HARI"],
        jam: json["JAM"],
        ruang: json["RUANG"],
        hari2: json["HARI_2"],
        jam2: json["JAM_2"],
        ruang2: json["RUANG_2"],
        hari2Kp: json["HARI_2_KP"],
        jam2Kp: json["JAM_2_KP"],
        ruang2Kp: json["RUANG_2_KP"],
      );

  Map<String, dynamic> toJson() => {
        "MAHASISWA": mahasiswa,
        "NRP": nrp,
        "NAMA": nama,
        "KODE": kode,
        "MATAKULIAH": matakuliah,
        "DURASI": durasi,
        "TAHUN": tahun,
        "SEMESTER": semester,
        "NOMOR_DOSEN": nomorDosen,
        "NIP_DOSEN": nipDosen,
        "NAMA_DOSEN": namaDosen,
        "HARI": hari,
        "JAM": jam,
        "RUANG": ruang,
        "HARI_2": hari2,
        "JAM_2": jam2,
        "RUANG_2": ruang2,
        "HARI_2_KP": hari2Kp,
        "JAM_2_KP": jam2Kp,
        "RUANG_2_KP": ruang2Kp,
      };
}
