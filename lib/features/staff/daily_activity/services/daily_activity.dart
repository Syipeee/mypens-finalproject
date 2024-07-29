// To parse this JSON data, do
//
//     final dailyActivity = dailyActivityFromJson(jsonString);

import 'dart:convert';

DailyActivity dailyActivityFromJson(String str) =>
    DailyActivity.fromJson(json.decode(str));

String dailyActivityToJson(DailyActivity data) => json.encode(data.toJson());

class DailyActivity {
  DailyActivity({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory DailyActivity.fromJson(Map<String, dynamic> json) => DailyActivity(
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
    required this.nama,
    required this.title,
    required this.location,
    required this.notes,
    required this.tanggalFilter,
    required this.tanggal,
    required this.timeStart,
  });

  String nip;
  String nama;
  dynamic title;
  String location;
  String notes;
  String tanggalFilter;
  String tanggal;
  String timeStart;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nip: json["NIP"],
        nama: json["NAMA"],
        title: json["TITLE"],
        location: json["LOCATION"],
        notes: json["NOTES"],
        tanggalFilter: json["TANGGAL_FILTER"],
        tanggal: json["TANGGAL"],
        timeStart: json["TIME_START"],
      );

  Map<String, dynamic> toJson() => {
        "NIP": nip,
        "NAMA": nama,
        "TITLE": title,
        "LOCATION": location,
        "NOTES": notes,
        "TANGGAL_FILTER": tanggalFilter,
        "TANGGAL": tanggal,
        "TIME_START": timeStart,
      };
}
