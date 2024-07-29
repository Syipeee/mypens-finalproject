// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_dosen_or_staff_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailDosenOrStaffDto _$DetailDosenOrStaffDtoFromJson(
        Map<String, dynamic> json) =>
    DetailDosenOrStaffDto(
      nomor: MyJsonConverter.stringToInt(json['NOMOR'] as String?),
      nip: json['NIP'] as String?,
      nama: json['NAMA'] as String?,
      tipeStaff: json['STAFF'] as String?,
      jabatan: json['JABATAN'] as String?,
      sex: json['SEX'] as String?,
    );

Map<String, dynamic> _$DetailDosenOrStaffDtoToJson(
        DetailDosenOrStaffDto instance) =>
    <String, dynamic>{
      'NOMOR': MyJsonConverter.intToString(instance.nomor),
      'NIP': instance.nip,
      'NAMA': instance.nama,
      'STAFF': instance.tipeStaff,
      'JABATAN': instance.jabatan,
      'SEX': instance.sex,
    };
