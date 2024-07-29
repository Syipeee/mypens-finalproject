
import 'package:json_annotation/json_annotation.dart';
import 'package:mypens/common/data/common/my_json_converter.dart';
import 'package:mypens/common/domain/common/model/semester.dart';

part 'vmy_absensi_kuliah_dto.g.dart';

@JsonSerializable()
class VmyAbsensiKuliahDto {
  @JsonKey(name: 'MAHASISWA', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? nomorMahasiswa;

  @JsonKey(name: 'NRP', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? nrp;

  @JsonKey(name: 'NAMA')
  final String? namaMahasiswa;

  @JsonKey(name: 'KODE')
  final String? kodeMataKuliah;

  @JsonKey(name: 'MATAKULIAH')
  final String? namaMataKuliah;

  @JsonKey(name: 'JAM')
  final String? jam;

  @JsonKey(name: 'SEMESTER', fromJson: MyJsonConverter.stringToSemester, toJson: MyJsonConverter.semesterToString)
  final Semester? semester;

  @JsonKey(name: 'TANGGAL', fromJson: MyJsonConverter.stringToDateTime, toJson: MyJsonConverter.dateTimeToString)
  final DateTime? tanggal;

  @JsonKey(name: 'MINGGU', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? mingguKe;

  @JsonKey(name: 'STATUS')
  final String? status;

  @JsonKey(name: 'PROSES_KEHADIRAN')
  final String? persenKehadiran;

  VmyAbsensiKuliahDto({
    required this.nomorMahasiswa,
    required this.nrp,
    required this.namaMahasiswa,
    required this.kodeMataKuliah,
    required this.namaMataKuliah,
    required this.jam,
    required this.semester,
    required this.tanggal,
    required this.mingguKe,
    required this.status,
    required this.persenKehadiran,
  });

  factory VmyAbsensiKuliahDto.fromJson(Map<String, dynamic> json){
    return _$VmyAbsensiKuliahDtoFromJson(json);
  }
  //             "MAHASISWA": "19496",
  //             "NRP": "3120600046",
  //             "NAMA": "Aqilah Akmalia Dewi",
  //             "KODE": "VIT204308",
  //             "MATAKULIAH": "Administrasi & Manajemen Jaringan",
  //             "JAM": "4",
  //             "TAHUN": "2021",
  //             "SEMESTER": "2",
  //             "TANGGAL": "14-FEB-22",
  //             "MINGGU": "1",
  //             "STATUS": "H",
  //             "PROSEN_KEHADIRAN": "100"
}