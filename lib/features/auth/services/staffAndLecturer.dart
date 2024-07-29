// To parse this JSON data, do
//
//     final staffAndLecturer = staffAndLecturerFromJson(jsonString);

import 'dart:convert';

StaffAndLecturer staffAndLecturerFromJson(String str) =>
    StaffAndLecturer.fromJson(json.decode(str));

String staffAndLecturerToJson(StaffAndLecturer data) =>
    json.encode(data.toJson());

class StaffAndLecturer {
  StaffAndLecturer({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory StaffAndLecturer.fromJson(Map<String, dynamic> json) =>
      StaffAndLecturer(
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
    required this.nip,
    required this.nama,
    required this.staff,
    required this.jabatan,
    required this.sex,
  });

  String nomor;
  String nip;
  String nama;
  String staff;
  dynamic jabatan;
  String sex;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nomor: json["NOMOR"],
        nip: json["NIP"],
        nama: json["NAMA"],
        staff: json["STAFF"],
        jabatan: json["JABATAN"],
        sex: json["SEX"],
      );

  Map<String, dynamic> toJson() => {
        "NOMOR": nomor,
        "NIP": nip,
        "NAMA": nama,
        "STAFF": staff,
        "JABATAN": jabatan,
        "SEX": sex,
      };
}
