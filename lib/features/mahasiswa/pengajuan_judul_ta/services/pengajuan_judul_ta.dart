// To parse this JSON data, do
//
//     final pengajuanJudulTa = pengajuanJudulTaFromJson(jsonString);

import 'dart:convert';

PengajuanJudulTa pengajuanJudulTaFromJson(String str) =>
    PengajuanJudulTa.fromJson(json.decode(str));

String pengajuanJudulTaToJson(PengajuanJudulTa data) =>
    json.encode(data.toJson());

class PengajuanJudulTa {
  PengajuanJudulTa({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory PengajuanJudulTa.fromJson(Map<String, dynamic> json) =>
      PengajuanJudulTa(
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
    required this.judul,
    required this.pembimbing1,
    required this.pembimbing2,
    required this.pembimbing3,
    required this.prioritas,
    required this.status,
    required this.ambil,
  });

  String tahun;
  String semester;
  String nrp;
  String nama;
  String judul;
  String pembimbing1;
  String pembimbing2;
  dynamic pembimbing3;
  String prioritas;
  String status;
  String ambil;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        tahun: json["TAHUN"] ?? '-',
        semester: json["SEMESTER"] ?? '-',
        nrp: json["NRP"] ?? '-',
        nama: json["NAMA"] ?? '-',
        judul: json["JUDUL"] ?? '-',
        pembimbing1: json["PEMBIMBING1"] ?? '-',
        pembimbing2: json["PEMBIMBING2"] ?? '-',
        pembimbing3: json["PEMBIMBING3"] ?? '-',
        prioritas: json["PRIORITAS"] ?? '-',
        status: json["STATUS"] ?? '-',
        ambil: json["AMBIL"] ?? '-',
      );

  Map<String, dynamic> toJson() => {
        "TAHUN": tahun,
        "SEMESTER": semester,
        "NRP": nrp,
        "NAMA": nama,
        "JUDUL": judul,
        "PEMBIMBING1": pembimbing1,
        "PEMBIMBING2": pembimbing2,
        "PEMBIMBING3": pembimbing3,
        "PRIORITAS": prioritas,
        "STATUS": status,
        "AMBIL": ambil,
      };
}
