// To parse this JSON data, do
//
//     final pengumuman = pengumumanFromJson(jsonString);

import 'dart:convert';

Pengumuman pengumumanFromJson(String str) =>
    Pengumuman.fromJson(json.decode(str));

String pengumumanToJson(Pengumuman data) => json.encode(data.toJson());

class Pengumuman {
  Pengumuman({
    required this.status,
    required this.code,
    required this.data,
  });

  final String status;
  final int code;
  final List<Datum> data;

  factory Pengumuman.fromJson(Map<String, dynamic> json) => Pengumuman(
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
    required this.author,
    required this.tanggalDibuat,
    required this.kategori,
    required this.judul,
    required this.uraian,
  });

  final String author;
  final String tanggalDibuat;
  final String kategori;
  final String judul;
  final String uraian;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        author: json["AUTHOR"],
        tanggalDibuat: json["TANGGAL_DIBUAT"],
        kategori: json["KATEGORI"],
        judul: json["JUDUL"] == null ? 'Kosong' : json["JUDUL"],
        uraian: json["URAIAN"],
      );

  Map<String, dynamic> toJson() => {
        "AUTHOR": author,
        "TANGGAL_DIBUAT": tanggalDibuat,
        "KATEGORI": kategori,
        "JUDUL": judul == null ? 'Kosong' : judul,
        "URAIAN": uraian,
      };
}
