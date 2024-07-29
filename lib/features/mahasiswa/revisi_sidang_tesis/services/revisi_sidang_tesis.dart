// To parse this JSON data, do
//
//     final revisiSidangTesis = revisiSidangTesisFromJson(jsonString);

import 'dart:convert';

revisiSidangTesis revisiSidangTesisFromJson(String str) =>
    revisiSidangTesis.fromJson(json.decode(str));

String revisiSidangTesisToJson(revisiSidangTesis data) =>
    json.encode(data.toJson());

class revisiSidangTesis {
  revisiSidangTesis({
    required this.status,
    required this.code,
    required this.data,
  });

  final String status;
  final int code;
  final List<Map<String, String>> data;

  factory revisiSidangTesis.fromJson(Map<String, dynamic> json) =>
      revisiSidangTesis(
        status: json["status"],
        code: json["code"],
        data: List<Map<String, String>>.from(json["data"].map((x) => Map.from(x)
            .map((k, v) =>
                MapEntry<String, String>(k, v == null ? 'Kosong' : v)))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => Map.from(x).map(
            (k, v) => MapEntry<String, dynamic>(k, v == null ? 'Kosong' : v)))),
      };
}

// To parse this JSON data, do
//
//     final revisiSidangTesisClean = revisiSidangTesisCleanFromJson(jsonString);

RevisiSidangTesisClean revisiSidangTesisCleanFromJson(String str) =>
    RevisiSidangTesisClean.fromJson(json.decode(str));

String revisiSidangTesisCleanToJson(RevisiSidangTesisClean data) =>
    json.encode(data.toJson());

class RevisiSidangTesisClean {
  RevisiSidangTesisClean({
    required this.status,
    required this.code,
    required this.data,
  });

  final String status;
  final int code;
  final List<Datum> data;

  factory RevisiSidangTesisClean.fromJson(Map<String, dynamic> json) =>
      RevisiSidangTesisClean(
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
    required this.jenis,
    required this.ketJenis,
    required this.ujian,
    required this.mahasiswa,
    required this.ketUjian,
    required this.pegawai,
    required this.nipDosen,
    required this.catatan,
    required this.sudahRevisi,
    required this.ketRevisi,
    required this.urlRevisi,
    required this.catatanMhsKeDosen,
  });

  final String nomor;
  final String jenis;
  final String ketJenis;
  final String ujian;
  final String mahasiswa;
  final String ketUjian;
  final String pegawai;
  final String nipDosen;
  final String catatan;
  final String sudahRevisi;
  final String ketRevisi;
  final String urlRevisi;
  final String catatanMhsKeDosen;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nomor: json["NOMOR"],
        jenis: json["JENIS"],
        ketJenis: json["KET_JENIS"],
        ujian: json["UJIAN"],
        mahasiswa: json["MAHASISWA"],
        ketUjian: json["KET_UJIAN"],
        pegawai: json["PEGAWAI"],
        nipDosen: json["NIP_DOSEN"],
        catatan: json["CATATAN"],
        sudahRevisi: json["SUDAH_REVISI"],
        ketRevisi: json["KET_REVISI"],
        urlRevisi: json["URL_REVISI"],
        catatanMhsKeDosen: json["CATATAN_MHS_KE_DOSEN"],
      );

  Map<String, dynamic> toJson() => {
        "NOMOR": nomor,
        "JENIS": jenis,
        "KET_JENIS": ketJenis,
        "UJIAN": ujian,
        "MAHASISWA": mahasiswa,
        "KET_UJIAN": ketUjian,
        "PEGAWAI": pegawai,
        "NIP_DOSEN": nipDosen,
        "CATATAN": catatan,
        "SUDAH_REVISI": sudahRevisi,
        "KET_REVISI": ketRevisi,
        "URL_REVISI": urlRevisi,
        "CATATAN_MHS_KE_DOSEN": catatanMhsKeDosen,
      };
}
