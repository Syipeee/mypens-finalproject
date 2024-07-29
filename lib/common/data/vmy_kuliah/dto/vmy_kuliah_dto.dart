
import 'package:json_annotation/json_annotation.dart';
import 'package:mypens/common/data/common/my_json_converter.dart';

part 'vmy_kuliah_dto.g.dart';

@JsonSerializable()
class VmyKuliahDto {
  @JsonKey(name: 'NOMOR_KULIAH', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? nomorKuliah;

  @JsonKey(name: 'MAHASISWA', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? nomorMahasiswa;

  @JsonKey(name: 'NRP', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? nrp;

  @JsonKey(name: 'NAMA')
  final String? namaMahasiswa;

  @JsonKey(name: 'KODE')
  final String? kode;

  @JsonKey(name: 'MATAKULIAH')
  final String? mataKuliah;

  @JsonKey(name: 'DURASI', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? durasi;

  @JsonKey(name: 'TAHUN', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? tahun;

  @JsonKey(name: 'SEMESTER', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? semester;

  @JsonKey(name: 'NOMOR_DOSEN', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? nomorDosen;

  @JsonKey(name: 'NIP_DOSEN')
  final String? nipDosen;

  @JsonKey(name: 'HARI')
  final String? hari;

  @JsonKey(name: 'JAM')
  final String? jam;

  @JsonKey(name: 'RUANG')
  final String? ruang;

  @JsonKey(name: 'HARI_2')
  final String? hari2;

  @JsonKey(name: 'JAM_2')
  final String? jam2;

  @JsonKey(name: 'RUANG_2')
  final String? ruang2;

  @JsonKey(name: 'JAM_2_KP')
  final String? jam2Kp;

  @JsonKey(name: 'RUANG_2_KP')
  final String? ruang2Kp;

  VmyKuliahDto({
    required this.nomorKuliah,
    required this.nomorMahasiswa,
    required this.nrp,
    required this.namaMahasiswa,
    required this.kode,
    required this.mataKuliah,
    required this.durasi,
    required this.tahun,
    required this.semester,
    required this.nomorDosen,
    required this.nipDosen,
    required this.hari,
    required this.jam,
    required this.ruang,
    required this.hari2,
    required this.jam2,
    required this.ruang2,
    required this.jam2Kp,
    required this.ruang2Kp,
  });
  // "NOMOR_KULIAH": "202846",
  // "MAHASISWA": "21509",
  // "NRP": "3121500020",
  // "NAMA": "Gilang Anjar Kusuma",
  // "KODE": "TI033102",
  // "MATAKULIAH": "Pemrograman Berorientasi Obyek",
  // "DURASI": "2",
  // "TAHUN": "2022",
  // "SEMESTER": "3",
  // "NOMOR_DOSEN": "234",
  // "NIP_DOSEN": "197807062002122003",
  // "NAMA_DOSEN": "Yuliana Setiowati",
  // "HARI": "Senin",
  // "JAM": "08:00 sd 09:40",
  // "RUANG": "HH-103",
  // "HARI_2": null,
  // "JAM_2": null,
  // "RUANG_2": null,
  // "HARI_2_KP": "Rabu",
  // "JAM_2_KP": "10:30",
  // "RUANG_2_KP": "HH-103"

  factory VmyKuliahDto.fromJson(Map<String, dynamic> json) =>
      _$VmyKuliahDtoFromJson(json);
  Map<String, dynamic> toJson() => _$VmyKuliahDtoToJson(this);
}