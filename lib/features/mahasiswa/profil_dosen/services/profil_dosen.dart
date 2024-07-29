// To parse this JSON data, do
//
//     final profilDosen = profilDosenFromJson(jsonString);

import 'dart:convert';

ProfilDosen profilDosenFromJson(String str) =>
    ProfilDosen.fromJson(json.decode(str));

String profilDosenToJson(ProfilDosen data) => json.encode(data.toJson());

class ProfilDosen {
  ProfilDosen({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Map<String, String>> data;

  factory ProfilDosen.fromJson(Map<String, dynamic> json) => ProfilDosen(
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
//     final profilDosenClean = profilDosenCleanFromJson(jsonString);

ProfilDosenClean profilDosenCleanFromJson(String str) =>
    ProfilDosenClean.fromJson(json.decode(str));

String profilDosenCleanToJson(ProfilDosenClean data) =>
    json.encode(data.toJson());

class ProfilDosenClean {
  ProfilDosenClean({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory ProfilDosenClean.fromJson(Map<String, dynamic> json) =>
      ProfilDosenClean(
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
    required this.jenis,
    required this.telp,
  });

  String nip;
  String nidn;
  String nama;
  dynamic gelarDpn;
  String gelarBlk;
  String golakhir;
  String jabatanFungsional;
  String jenis;
  String telp;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nip: json["NIP"],
        nidn: json["NIDN"],
        nama: json["NAMA"],
        gelarDpn: json["GELAR_DPN"],
        gelarBlk: json["GELAR_BLK"],
        golakhir: json["GOLAKHIR"],
        jabatanFungsional: json["JABATAN_FUNGSIONAL"],
        jenis: json["JENIS"],
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
        "JENIS": jenis,
        "TELP": telp,
      };
}
