// To parse this JSON data, do
//
//     final statusDaftarUlang = statusDaftarUlangFromJson(jsonString);

import 'dart:convert';

StatusDaftarUlang statusDaftarUlangFromJson(String str) =>
    StatusDaftarUlang.fromJson(json.decode(str));

String statusDaftarUlangToJson(StatusDaftarUlang data) =>
    json.encode(data.toJson());

class StatusDaftarUlang {
  StatusDaftarUlang({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory StatusDaftarUlang.fromJson(Map<String, dynamic> json) =>
      StatusDaftarUlang(
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
    required this.tanggal,
  });

  String tahun;
  String semester;
  String nrp;
  String nama;
  String tanggal;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        tahun: json["TAHUN"],
        semester: json["SEMESTER"],
        nrp: json["NRP"],
        nama: json["NAMA"],
        tanggal: json["TANGGAL"],
      );

  Map<String, dynamic> toJson() => {
        "TAHUN": tahun,
        "SEMESTER": semester,
        "NRP": nrp,
        "NAMA": nama,
        "TANGGAL": tanggal,
      };
}
