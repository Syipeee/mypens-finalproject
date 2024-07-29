// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perizinan_absensi_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerizinanAbsensiDto _$PerizinanAbsensiDtoFromJson(Map<String, dynamic> json) =>
    PerizinanAbsensiDto(
      idPerizinan: MyJsonConverter.stringToInt(json['NOMOR'] as String?),
      tanggalEntry:
          MyJsonConverter.stringToDateTime(json['TANGGAL_ENTRI'] as String?),
      nomorMahasiswa: MyJsonConverter.stringToInt(json['MAHASISWA'] as String?),
      namaMahasiswa: json['NAMA'] as String?,
      nomorDosen: MyJsonConverter.stringToInt(json['DOSEN'] as String?),
      nomorKuliah: MyJsonConverter.stringToInt(json['KULIAH'] as String?),
      namaMataKuliah: json['MATAKULIAH'] as String?,
      tahunAjaran: MyJsonConverter.stringToInt(json['TAHUN'] as String?),
      semester: MyJsonConverter.stringToSemester(json['SEMESTER'] as String?),
      statusPenerimaan: MyJsonConverter.stringToStatusPenerimaanPerizinan(
          json['STATUS_PENERIMAAN'] as String?),
      minggu: MyJsonConverter.stringToInt(json['MINGGU'] as String?),
      tanggalPerkuliahan:
          MyJsonConverter.stringToDateTime(json['TANGGAL'] as String?),
      keterangan: json['KETERANGAN'] as String?,
      statusYangDiinginkan: MyJsonConverter.stringToStatusAbsensi(
          json['STATUS_YANG_DIINGINKAN'] as String?),
      linkBuktiFile: json['LINK_BUKTI_FILE'] as String?,
    );

Map<String, dynamic> _$PerizinanAbsensiDtoToJson(
        PerizinanAbsensiDto instance) =>
    <String, dynamic>{
      'NOMOR': MyJsonConverter.intToString(instance.idPerizinan),
      'TANGGAL_ENTRI': instance.tanggalEntry?.toIso8601String(),
      'MAHASISWA': MyJsonConverter.intToString(instance.nomorMahasiswa),
      'NAMA': instance.namaMahasiswa,
      'DOSEN': MyJsonConverter.intToString(instance.nomorDosen),
      'KULIAH': MyJsonConverter.intToString(instance.nomorKuliah),
      'MATAKULIAH': instance.namaMataKuliah,
      'TAHUN': MyJsonConverter.intToString(instance.tahunAjaran),
      'SEMESTER': MyJsonConverter.semesterToString(instance.semester),
      'STATUS_PENERIMAAN': MyJsonConverter.statusPenerimaanPerizinanToInt(
          instance.statusPenerimaan),
      'MINGGU': MyJsonConverter.intToString(instance.minggu),
      'TANGGAL': MyJsonConverter.dateTimeToString(instance.tanggalPerkuliahan),
      'KETERANGAN': instance.keterangan,
      'STATUS_YANG_DIINGINKAN':
          MyJsonConverter.statusAbsensiToString(instance.statusYangDiinginkan),
      'LINK_BUKTI_FILE': instance.linkBuktiFile,
    };
