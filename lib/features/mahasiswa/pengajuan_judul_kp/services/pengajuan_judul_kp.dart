// To parse this JSON data, do
//
//     final pengajuanJudulKp = pengajuanJudulKpFromJson(jsonString);

import 'dart:convert';

PengajuanJudulKp pengajuanJudulKpFromJson(String str) =>
    PengajuanJudulKp.fromJson(json.decode(str));

String pengajuanJudulKpToJson(PengajuanJudulKp data) =>
    json.encode(data.toJson());

class PengajuanJudulKp {
  PengajuanJudulKp({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory PengajuanJudulKp.fromJson(Map<String, dynamic> json) =>
      PengajuanJudulKp(
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
    required this.nrp,
    required this.nama,
    required this.tempat,
    required this.alamat,
    required this.kota,
    required this.waktuPelaksanaan,
    required this.pembimbing,
    required this.status,
    required this.catatan,
  });

  String tahun;
  String semester;
  String nrp;
  String nama;
  String tempat;
  String alamat;
  String kota;
  String waktuPelaksanaan;
  String pembimbing;
  String status;
  String catatan;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        tahun: json["TAHUN"] ?? '-',
        semester: json["SEMESTER"] ?? '-',
        nrp: json["NRP"] ?? '-',
        nama: json["NAMA"] ?? '-',
        tempat: json["TEMPAT"] ?? '-',
        alamat: json["ALAMAT"] ?? '-',
        kota: json["KOTA"] ?? '-',
        waktuPelaksanaan: json["WAKTU_PELAKSANAAN"] ?? '-',
        pembimbing: json["PEMBIMBING"] ?? '-',
        status: json["STATUS"] ?? '-',
        catatan: json["CATATAN"] ?? '-',
      );

  Map<String, dynamic> toJson() => {
        "TAHUN": tahun,
        "SEMESTER": semester,
        "NRP": nrp,
        "NAMA": nama,
        "TEMPAT": tempat,
        "ALAMAT": alamat,
        "KOTA": kota,
        "WAKTU_PELAKSANAAN": waktuPelaksanaan,
        "PEMBIMBING": pembimbing,
        "STATUS": status,
        "CATATAN": catatan,
      };
}
