// To parse this JSON data, do
//
//     final ikoma = ikomaFromJson(jsonString);

import 'dart:convert';

Ikoma ikomaFromJson(String str) => Ikoma.fromJson(json.decode(str));

String ikomaToJson(Ikoma data) => json.encode(data.toJson());

class Ikoma {
  Ikoma({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Map<String, String>> data;

  factory Ikoma.fromJson(Map<String, dynamic> json) => Ikoma(
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
//     final ikomaClean = ikomaCleanFromJson(jsonString);

IkomaClean ikomaCleanFromJson(String str) =>
    IkomaClean.fromJson(json.decode(str));

String ikomaCleanToJson(IkomaClean data) => json.encode(data.toJson());

class IkomaClean {
  IkomaClean({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory IkomaClean.fromJson(Map<String, dynamic> json) => IkomaClean(
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
    required this.nrp,
    required this.nama,
    required this.ketBayar,
    required this.ketBayar2,
    required this.tahun,
    required this.semester,
    required this.statusBayar,
    required this.tanggalBayar,
    required this.bank,
    required this.mahasiswa,
    required this.mahasiswaPrestasi,
    required this.pengalihan,
    required this.bebasSpi,
    required this.kodeBayarMandiri,
    required this.kodeBayarBsi,
    required this.kodeBayarBni,
  });

  String nrp;
  String nama;
  String ketBayar;
  String ketBayar2;
  String tahun;
  String semester;
  String statusBayar;
  String tanggalBayar;
  String bank;
  String mahasiswa;
  String mahasiswaPrestasi;
  String pengalihan;
  String bebasSpi;
  String kodeBayarMandiri;
  String kodeBayarBsi;
  String kodeBayarBni;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nrp: json["NRP"],
        nama: json["NAMA"],
        ketBayar: json["KET_BAYAR"],
        ketBayar2: json["KET_BAYAR2"],
        tahun: json["TAHUN"],
        semester: json["SEMESTER"],
        statusBayar: json["STATUS_BAYAR"],
        tanggalBayar: json["TANGGAL_BAYAR"],
        bank: json["BANK"],
        mahasiswa: json["MAHASISWA"],
        mahasiswaPrestasi: json["MAHASISWA_PRESTASI"],
        pengalihan: json["PENGALIHAN"],
        bebasSpi: json["BEBAS_SPI"],
        kodeBayarMandiri: json["KODE_BAYAR_MANDIRI"],
        kodeBayarBsi: json["KODE_BAYAR_BSI"],
        kodeBayarBni: json["KODE_BAYAR_BNI"],
      );

  Map<String, dynamic> toJson() => {
        "NRP": nrp,
        "NAMA": nama,
        "KET_BAYAR": ketBayar,
        "KET_BAYAR2": ketBayar2,
        "TAHUN": tahun,
        "SEMESTER": semester,
        "STATUS_BAYAR": statusBayar,
        "TANGGAL_BAYAR": tanggalBayar,
        "BANK": bank,
        "MAHASISWA": mahasiswa,
        "MAHASISWA_PRESTASI": mahasiswaPrestasi,
        "PENGALIHAN": pengalihan,
        "BEBAS_SPI": bebasSpi,
        "KODE_BAYAR_MANDIRI": kodeBayarMandiri,
        "KODE_BAYAR_BSI": kodeBayarBsi,
        "KODE_BAYAR_BNI": kodeBayarBni,
      };
}
