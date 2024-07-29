// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_mahasiswa_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailMahasiswaDto _$DetailMahasiswaDtoFromJson(Map<String, dynamic> json) =>
    DetailMahasiswaDto(
      nomor: MyJsonConverter.stringToInt(json['NOMOR'] as String?),
      nrp: MyJsonConverter.stringToInt(json['NRP'] as String?),
      nama: json['NAMA'] as String?,
      kelas: MyJsonConverter.stringToInt(json['KELAS'] as String?),
      tempatLahir: json['TMPLAHIR'] as String?,
      tanggalLahir: json['TGLLAHIR'] as String?,
      jenisKelamin: json['JENIS_KELAMIN'] as String?,
      agama: MyJsonConverter.stringToInt(json['AGAMA'] as String?),
      ayah: json['AYAH'] as String?,
      ibu: json['IBU'] as String?,
      status: json['STATUS'] as String?,
    );

Map<String, dynamic> _$DetailMahasiswaDtoToJson(DetailMahasiswaDto instance) =>
    <String, dynamic>{
      'NOMOR': MyJsonConverter.intToString(instance.nomor),
      'NRP': MyJsonConverter.intToString(instance.nrp),
      'NAMA': instance.nama,
      'KELAS': MyJsonConverter.intToString(instance.kelas),
      'TMPLAHIR': instance.tempatLahir,
      'TGLLAHIR': instance.tanggalLahir,
      'JENIS_KELAMIN': instance.jenisKelamin,
      'AGAMA': MyJsonConverter.intToString(instance.agama),
      'AYAH': instance.ayah,
      'IBU': instance.ibu,
      'STATUS': instance.status,
    };
