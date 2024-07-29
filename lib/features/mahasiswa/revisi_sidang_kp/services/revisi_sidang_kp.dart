// To parse this JSON data, do
//
//     final revisiSidangKp = revisiSidangKpFromJson(jsonString);

import 'dart:convert';

RevisiSidangKp revisiSidangKpFromJson(String str) =>
    RevisiSidangKp.fromJson(json.decode(str));

String revisiSidangKpToJson(RevisiSidangKp data) => json.encode(data.toJson());

class RevisiSidangKp {
  RevisiSidangKp({
    required this.status,
    required this.code,
    required this.data,
  });

  final String status;
  final int code;
  final List<Map<String, String>> data;

  factory RevisiSidangKp.fromJson(Map<String, dynamic> json) => RevisiSidangKp(
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
//     final revisiSidangKpClean = revisiSidangKpCleanFromJson(jsonString);

RevisiSidangKpClean revisiSidangKpCleanFromJson(String str) =>
    RevisiSidangKpClean.fromJson(json.decode(str));

String revisiSidangKpCleanToJson(RevisiSidangKpClean data) =>
    json.encode(data.toJson());

class RevisiSidangKpClean {
  RevisiSidangKpClean({
    required this.status,
    required this.code,
    required this.data,
  });

  final String status;
  final int code;
  final List<Datum> data;

  factory RevisiSidangKpClean.fromJson(Map<String, dynamic> json) =>
      RevisiSidangKpClean(
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
    required this.pegawai,
    required this.mahasiswa,
    required this.namapegawai,
    required this.catatan,
    required this.sudahRevisi,
    required this.tanggalRevisi,
    required this.urlRevisi,
    required this.catatanMhsKeDosen,
    required this.tahun,
    required this.semester,
    required this.tempat,
    required this.judulBuku,
    required this.keyBuku,
    required this.tanggalUjian,
  });

  final String nomor;
  final String pegawai;
  final String mahasiswa;
  final String namapegawai;
  final String catatan;
  final String sudahRevisi;
  final String tanggalRevisi;
  final String urlRevisi;
  final String catatanMhsKeDosen;
  final String tahun;
  final String semester;
  final String tempat;
  final String judulBuku;
  final String keyBuku;
  final String tanggalUjian;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nomor: json["NOMOR"],
        pegawai: json["PEGAWAI"],
        mahasiswa: json["MAHASISWA"],
        namapegawai: json["NAMAPEGAWAI"],
        catatan: json["CATATAN"],
        sudahRevisi: json["SUDAH_REVISI"],
        tanggalRevisi: json["TANGGAL_REVISI"],
        urlRevisi: json["URL_REVISI"],
        catatanMhsKeDosen: json["CATATAN_MHS_KE_DOSEN"],
        tahun: json["TAHUN"],
        semester: json["SEMESTER"],
        tempat: json["TEMPAT"],
        judulBuku: json["JUDUL_BUKU"],
        keyBuku: json["KEY_BUKU"],
        tanggalUjian: json["TANGGAL_UJIAN"],
      );

  Map<String, dynamic> toJson() => {
        "NOMOR": nomor,
        "PEGAWAI": pegawai,
        "MAHASISWA": mahasiswa,
        "NAMAPEGAWAI": namapegawai,
        "CATATAN": catatan,
        "SUDAH_REVISI": sudahRevisi,
        "TANGGAL_REVISI": tanggalRevisi,
        "URL_REVISI": urlRevisi,
        "CATATAN_MHS_KE_DOSEN": catatanMhsKeDosen,
        "TAHUN": tahun,
        "SEMESTER": semester,
        "TEMPAT": tempat,
        "JUDUL_BUKU": judulBuku,
        "KEY_BUKU": keyBuku,
        "TANGGAL_UJIAN": tanggalUjian,
      };
}
