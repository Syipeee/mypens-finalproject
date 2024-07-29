import 'package:json_annotation/json_annotation.dart';
import 'package:mypens/common/data/common/my_json_converter.dart';

part 'detail_dosen_or_staff_dto.g.dart';

@JsonSerializable()
class DetailDosenOrStaffDto {
  @JsonKey(name: 'NOMOR', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? nomor;

  @JsonKey(name: 'NIP')
  final String? nip;

  @JsonKey(name: 'NAMA')
  final String? nama;

  @JsonKey(name: 'STAFF')
  final String? tipeStaff;

  @JsonKey(name: 'JABATAN')
  final String? jabatan;

  @JsonKey(name: 'SEX')
  final String? sex;

  DetailDosenOrStaffDto({
    required this.nomor,
    required this.nip,
    required this.nama,
    required this.tipeStaff,
    required this.jabatan,
    required this.sex,
  });
  // {
  // "NOMOR": "232",
  // "NIP": "197911212005011003",
  // "NAMA": "Wiratmoko Yuwono",
  // "STAFF": "4",
  // "JABATAN": null,
  // "SEX": "L"
  // }
  factory DetailDosenOrStaffDto.fromJson(Map<String , dynamic> json) =>
      _$DetailDosenOrStaffDtoFromJson(json);

  Map<String , dynamic> toJson() => _$DetailDosenOrStaffDtoToJson(this);
}