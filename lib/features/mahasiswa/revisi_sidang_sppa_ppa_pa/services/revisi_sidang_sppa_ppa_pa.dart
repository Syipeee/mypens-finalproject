// To parse this JSON data, do
//
//     final revisiSppaPpaPa = revisiSppaPpaPaFromJson(jsonString);

import 'dart:convert';

RevisiSppaPpaPa revisiSppaPpaPaFromJson(String str) =>
    RevisiSppaPpaPa.fromJson(json.decode(str));

String revisiSppaPpaPaToJson(RevisiSppaPpaPa data) =>
    json.encode(data.toJson());

class RevisiSppaPpaPa {
  RevisiSppaPpaPa({
    required this.status,
    required this.code,
    required this.data,
  });

  final String status;
  final int code;
  final List<Map<String, String>> data;

  factory RevisiSppaPpaPa.fromJson(Map<String, dynamic> json) =>
      RevisiSppaPpaPa(
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
//     final revisiSppaPpaPaClean = revisiSppaPpaPaCleanFromJson(jsonString);

RevisiSppaPpaPaClean revisiSppaPpaPaCleanFromJson(String str) =>
    RevisiSppaPpaPaClean.fromJson(json.decode(str));

String revisiSppaPpaPaCleanToJson(RevisiSppaPpaPaClean data) =>
    json.encode(data.toJson());

class RevisiSppaPpaPaClean {
  RevisiSppaPpaPaClean({
    required this.status,
    required this.code,
    required this.data,
  });

  final String status;
  final int code;
  final List<Datum> data;

  factory RevisiSppaPpaPaClean.fromJson(Map<String, dynamic> json) =>
      RevisiSppaPpaPaClean(
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
    required this.mahasiswa,
    required this.ujian,
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
  final String mahasiswa;
  final String ujian;
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
        mahasiswa: json["MAHASISWA"],
        ujian: json["UJIAN"],
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
        "MAHASISWA": mahasiswa,
        "UJIAN": ujian,
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
