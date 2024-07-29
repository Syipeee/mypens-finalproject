// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vmy_absensi_kuliah_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VmyAbsensiKuliahDto _$VmyAbsensiKuliahDtoFromJson(Map<String, dynamic> json) =>
    VmyAbsensiKuliahDto(
      nomorMahasiswa: MyJsonConverter.stringToInt(json['MAHASISWA'] as String?),
      nrp: MyJsonConverter.stringToInt(json['NRP'] as String?),
      namaMahasiswa: json['NAMA'] as String?,
      kodeMataKuliah: json['KODE'] as String?,
      namaMataKuliah: json['MATAKULIAH'] as String?,
      jam: json['JAM'] as String?,
      semester: MyJsonConverter.stringToSemester(json['SEMESTER'] as String?),
      tanggal: MyJsonConverter.stringToDateTime(json['TANGGAL'] as String?),
      mingguKe: MyJsonConverter.stringToInt(json['MINGGU'] as String?),
      status: json['STATUS'] as String?,
      persenKehadiran: json['PROSES_KEHADIRAN'] as String?,
    );

Map<String, dynamic> _$VmyAbsensiKuliahDtoToJson(
        VmyAbsensiKuliahDto instance) =>
    <String, dynamic>{
      'MAHASISWA': MyJsonConverter.intToString(instance.nomorMahasiswa),
      'NRP': MyJsonConverter.intToString(instance.nrp),
      'NAMA': instance.namaMahasiswa,
      'KODE': instance.kodeMataKuliah,
      'MATAKULIAH': instance.namaMataKuliah,
      'JAM': instance.jam,
      'SEMESTER': MyJsonConverter.semesterToString(instance.semester),
      'TANGGAL': MyJsonConverter.dateTimeToString(instance.tanggal),
      'MINGGU': MyJsonConverter.intToString(instance.mingguKe),
      'STATUS': instance.status,
      'PROSES_KEHADIRAN': instance.persenKehadiran,
    };
