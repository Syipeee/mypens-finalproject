// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Map<String, String>> data;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        status: json["status"],
        code: json["code"],
        data: List<Map<String, String>>.from(json["data"].map((x) => Map.from(x)
            .map((k, v) => MapEntry<String, String>(k, v ?? 'Kosong')))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => Map.from(x).map(
            (k, v) => MapEntry<String, dynamic>(k, v == 'Kosong' ? null : v)))),
      };
}

// To parse this JSON data, do
//
//     final profileClean = profileCleanFromJson(jsonString);

ProfileClean profileCleanFromJson(String str) =>
    ProfileClean.fromJson(json.decode(str));

String profileCleanToJson(ProfileClean data) => json.encode(data.toJson());

class ProfileClean {
  ProfileClean({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory ProfileClean.fromJson(Map<String, dynamic> json) => ProfileClean(
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
    required this.noDaftar,
    required this.namaDaftar,
    required this.keterangan,
    required this.cicilanKe,
    required this.kodeBayarMandiri,
    required this.nominalTagihan,
    required this.tanggalTagihanAwal,
    required this.tanggalTagihanAkhir,
    required this.statusPembayaran,
    required this.nominalBayar,
    required this.tanggalBayar,
  });

  String tahun;
  String semester;
  String nrp;
  String nama;
  dynamic noDaftar;
  dynamic namaDaftar;
  String keterangan;
  String cicilanKe;
  String kodeBayarMandiri;
  String nominalTagihan;
  String tanggalTagihanAwal;
  String tanggalTagihanAkhir;
  String statusPembayaran;
  String nominalBayar;
  String tanggalBayar;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        tahun: json["TAHUN"],
        semester: json["SEMESTER"],
        nrp: json["NRP"],
        nama: json["NAMA"],
        noDaftar: json["NO_DAFTAR"],
        namaDaftar: json["NAMA_DAFTAR"],
        keterangan: json["KETERANGAN"],
        cicilanKe: json["CICILAN_KE"],
        kodeBayarMandiri: json["KODE_BAYAR_MANDIRI"],
        nominalTagihan: json["NOMINAL_TAGIHAN"],
        tanggalTagihanAwal: json["TANGGAL_TAGIHAN_AWAL"],
        tanggalTagihanAkhir: json["TANGGAL_TAGIHAN_AKHIR"],
        statusPembayaran: json["STATUS_PEMBAYARAN"],
        nominalBayar: json["NOMINAL_BAYAR"],
        tanggalBayar: json["TANGGAL_BAYAR"],
      );

  Map<String, dynamic> toJson() => {
        "TAHUN": tahun,
        "SEMESTER": semester,
        "NRP": nrp,
        "NAMA": nama,
        "NO_DAFTAR": noDaftar,
        "NAMA_DAFTAR": namaDaftar,
        "KETERANGAN": keterangan,
        "CICILAN_KE": cicilanKe,
        "KODE_BAYAR_MANDIRI": kodeBayarMandiri,
        "NOMINAL_TAGIHAN": nominalTagihan,
        "TANGGAL_TAGIHAN_AWAL": tanggalTagihanAwal,
        "TANGGAL_TAGIHAN_AKHIR": tanggalTagihanAkhir,
        "STATUS_PEMBAYARAN": statusPembayaran,
        "NOMINAL_BAYAR": nominalBayar,
        "TANGGAL_BAYAR": tanggalBayar,
      };
}
