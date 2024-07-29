// To parse this JSON data, do
//
//     final profilPegawai = profilPegawaiFromJson(jsonString);

import 'dart:convert';

ProfilPegawai profilPegawaiFromJson(String str) =>
    ProfilPegawai.fromJson(json.decode(str));

String profilPegawaiToJson(ProfilPegawai data) => json.encode(data.toJson());

class ProfilPegawai {
  ProfilPegawai({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Map<String, String>> data;

  factory ProfilPegawai.fromJson(Map<String, dynamic> json) => ProfilPegawai(
        status: json["status"],
        code: json["code"],
        data: List<Map<String, String>>.from(json["data"].map((x) =>
            Map.from(x).map((k, v) => MapEntry<String, String>(k, v ?? '-')))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) =>
            Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v ?? '-')))),
      };
}

// To parse this JSON data, do
//
//     final profilPegawaiClean = profilPegawaiCleanFromJson(jsonString);

ProfilPegawaiClean profilPegawaiCleanFromJson(String str) =>
    ProfilPegawaiClean.fromJson(json.decode(str));

String profilPegawaiCleanToJson(ProfilPegawaiClean data) =>
    json.encode(data.toJson());

class ProfilPegawaiClean {
  ProfilPegawaiClean({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory ProfilPegawaiClean.fromJson(Map<String, dynamic> json) =>
      ProfilPegawaiClean(
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
    required this.nip,
    required this.nidn,
    required this.nama,
    required this.gelarDpn,
    required this.gelarBlk,
    required this.golakhir,
    required this.jabatanFungsional,
    required this.staff,
    required this.alamat,
    required this.telp,
  });

  String nip;
  String nidn;
  String nama;
  dynamic gelarDpn;
  String gelarBlk;
  String golakhir;
  String jabatanFungsional;
  String staff;
  String alamat;
  dynamic telp;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nip: json["NIP"],
        nidn: json["NIDN"],
        nama: json["NAMA"],
        gelarDpn: json["GELAR_DPN"],
        gelarBlk: json["GELAR_BLK"],
        golakhir: json["GOLAKHIR"],
        jabatanFungsional: json["JABATAN_FUNGSIONAL"],
        staff: json["STAFF"],
        alamat: json["ALAMAT"],
        telp: json["TELP"],
      );

  Map<String, dynamic> toJson() => {
        "NIP": nip,
        "NIDN": nidn,
        "NAMA": nama,
        "GELAR_DPN": gelarDpn,
        "GELAR_BLK": gelarBlk,
        "GOLAKHIR": golakhir,
        "JABATAN_FUNGSIONAL": jabatanFungsional,
        "STAFF": staff,
        "ALAMAT": alamat,
        "TELP": telp,
      };
}
