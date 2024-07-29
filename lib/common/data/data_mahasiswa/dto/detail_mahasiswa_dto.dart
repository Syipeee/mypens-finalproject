import 'package:json_annotation/json_annotation.dart';
import 'package:mypens/common/data/common/my_json_converter.dart';

part 'detail_mahasiswa_dto.g.dart';

@JsonSerializable()
class DetailMahasiswaDto {
  @JsonKey(name: 'NOMOR', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? nomor;

  @JsonKey(name: 'NRP', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? nrp;

  @JsonKey(name: 'NAMA')
  final String? nama;

  @JsonKey(name: 'KELAS', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? kelas;

  @JsonKey(name: 'TMPLAHIR')
  final String? tempatLahir;

  @JsonKey(name: 'TGLLAHIR')
  final String? tanggalLahir;

  @JsonKey(name: 'JENIS_KELAMIN')
  final String? jenisKelamin;

  @JsonKey(name: 'AGAMA', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? agama;

  @JsonKey(name: 'AYAH')
  final String? ayah;

  @JsonKey(name: 'IBU')
  final String? ibu;

  @JsonKey(name: 'STATUS')
  final String? status;

  DetailMahasiswaDto({
    required this.nomor,
    required this.nrp,
    required this.nama,
    required this.kelas,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.agama,
    required this.ayah,
    required this.ibu,
    required this.status,
  });

  factory DetailMahasiswaDto.fromJson(Map<String , dynamic> json) =>
      _$DetailMahasiswaDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DetailMahasiswaDtoToJson(this);

  // {
  // "NOMOR": "21873",
  // "NRP": "3121500060",
  // "NAMA": "Moh. Alfan Al Amin",
  // "KELAS": "77",
  // "TMPLAHIR": "GRESIK",
  // "TGLLAHIR": "11-JUL-02",
  // "JENIS_KELAMIN": "L",
  // "AGAMA": "1",
  // "AYAH": "Sulaiman",
  // "IBU": "Nurul Huda",
  // "STATUS": "A"
  // }
}