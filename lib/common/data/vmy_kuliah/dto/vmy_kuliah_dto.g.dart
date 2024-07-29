// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vmy_kuliah_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VmyKuliahDto _$VmyKuliahDtoFromJson(Map<String, dynamic> json) => VmyKuliahDto(
      nomorKuliah: MyJsonConverter.stringToInt(json['NOMOR_KULIAH'] as String?),
      nomorMahasiswa: MyJsonConverter.stringToInt(json['MAHASISWA'] as String?),
      nrp: MyJsonConverter.stringToInt(json['NRP'] as String?),
      namaMahasiswa: json['NAMA'] as String?,
      kode: json['KODE'] as String?,
      mataKuliah: json['MATAKULIAH'] as String?,
      durasi: MyJsonConverter.stringToInt(json['DURASI'] as String?),
      tahun: MyJsonConverter.stringToInt(json['TAHUN'] as String?),
      semester: MyJsonConverter.stringToInt(json['SEMESTER'] as String?),
      nomorDosen: MyJsonConverter.stringToInt(json['NOMOR_DOSEN'] as String?),
      nipDosen: json['NIP_DOSEN'] as String?,
      hari: json['HARI'] as String?,
      jam: json['JAM'] as String?,
      ruang: json['RUANG'] as String?,
      hari2: json['HARI_2'] as String?,
      jam2: json['JAM_2'] as String?,
      ruang2: json['RUANG_2'] as String?,
      jam2Kp: json['JAM_2_KP'] as String?,
      ruang2Kp: json['RUANG_2_KP'] as String?,
    );

Map<String, dynamic> _$VmyKuliahDtoToJson(VmyKuliahDto instance) =>
    <String, dynamic>{
      'NOMOR_KULIAH': MyJsonConverter.intToString(instance.nomorKuliah),
      'MAHASISWA': MyJsonConverter.intToString(instance.nomorMahasiswa),
      'NRP': MyJsonConverter.intToString(instance.nrp),
      'NAMA': instance.namaMahasiswa,
      'KODE': instance.kode,
      'MATAKULIAH': instance.mataKuliah,
      'DURASI': MyJsonConverter.intToString(instance.durasi),
      'TAHUN': MyJsonConverter.intToString(instance.tahun),
      'SEMESTER': MyJsonConverter.intToString(instance.semester),
      'NOMOR_DOSEN': MyJsonConverter.intToString(instance.nomorDosen),
      'NIP_DOSEN': instance.nipDosen,
      'HARI': instance.hari,
      'JAM': instance.jam,
      'RUANG': instance.ruang,
      'HARI_2': instance.hari2,
      'JAM_2': instance.jam2,
      'RUANG_2': instance.ruang2,
      'JAM_2_KP': instance.jam2Kp,
      'RUANG_2_KP': instance.ruang2Kp,
    };
