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

  String status;
  int code;
  List<Datum> data;

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
    required this.nomor,
    required this.nama,
    required this.tanggal,
    required this.bulan,
    required this.tahun,
    required this.masuk,
    required this.pulang,
    required this.jenis,
    required this.status,
  });

  String nomor;
  String nama;
  String tanggal;
  String bulan;
  String tahun;
  String masuk;
  String pulang;
  String jenis;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nomor: json["NOMOR"],
        nama: json["NAMA"],
        tanggal: json["TANGGAL"],
        bulan: json["BULAN"],
        tahun: json["TAHUN"],
        masuk: json["MASUK"] ?? 'Kosong',
        pulang: json["PULANG"] ?? 'Kosong',
        jenis: json["JENIS"],
        status: json["STATUS"],
      );

  Map<String, dynamic> toJson() => {
        "NOMOR": nomor,
        "NAMA": nama,
        "TANGGAL": tanggal,
        "BULAN": bulan,
        "TAHUN": tahun,
        "MASUK": masuk,
        "PULANG": pulang,
        "JENIS": jenis,
        "STATUS": status,
      };
}
