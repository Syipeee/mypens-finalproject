// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class ResponseOfUserDto {
  ResponseOfUserDto({
    required this.status,
    required this.code,
    required this.data,
  });

  final String status;
  final int code;
  final List<DetailMahasiswa> data;

  factory ResponseOfUserDto.fromJson(String jsonString) {
    final Map<String , dynamic> json = jsonDecode(jsonString);
    return ResponseOfUserDto(
      status: json["status"],
      code: json["code"],
      data: List<DetailMahasiswa>.from(
          json["data"].map((x) => DetailMahasiswa.fromJson(x))),
    );
  }

    Map<String, dynamic> toJson() => {
      "status": status,
      "code": code,
      "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };


}

class DetailMahasiswa {
  DetailMahasiswa({
    required this.nomor,
    required this.nrp,
    required this.nama,
    required this.kelas,
    required this.tmplahir,
    required this.tgllahir,
    required this.jenisKelamin,
    required this.agama,
    required this.ayah,
    required this.ibu,
    required this.status,
  });

  final String nomor;
  final String nrp;
  final String nama;
  final String kelas;
  final String tmplahir;
  final String tgllahir;
  final String jenisKelamin;
  final String agama;
  final String ayah;
  final String ibu;
  final String status;

  factory DetailMahasiswa.fromJson(Map<String, dynamic> json) => DetailMahasiswa(
        nomor: json["NOMOR"],
        nrp: json["NRP"],
        nama: json["NAMA"],
        kelas: json["KELAS"],
        tmplahir: json["TMPLAHIR"],
        tgllahir: json["TGLLAHIR"],
        jenisKelamin: json["JENIS_KELAMIN"],
        agama: json["AGAMA"],
        ayah: json["AYAH"],
        ibu: json["IBU"],
        status: json["STATUS"],
      );

  Map<String, dynamic> toJson() => {
        "NOMOR": nomor,
        "NRP": nrp,
        "NAMA": nama,
        "KELAS": kelas,
        "TMPLAHIR": tmplahir,
        "TGLLAHIR": tgllahir,
        "JENIS_KELAMIN": jenisKelamin,
        "AGAMA": agama,
        "AYAH": ayah,
        "IBU": ibu,
        "STATUS": status,
      };
}
