import 'package:json_annotation/json_annotation.dart';
import 'package:mypens/common/data/common/my_json_converter.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/status_absensi.dart';

part 'perizinan_absensi_dto.g.dart';

@JsonSerializable()
class PerizinanAbsensiDto {
  @JsonKey(name: 'NOMOR', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? idPerizinan;

  @JsonKey(name: 'TANGGAL_ENTRI', fromJson: MyJsonConverter.stringToDateTime)
  final DateTime? tanggalEntry;

  @JsonKey(name: 'MAHASISWA' , fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? nomorMahasiswa;

  @JsonKey(name: 'NAMA')
  final String? namaMahasiswa;

  @JsonKey(name: 'DOSEN', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? nomorDosen;

  @JsonKey(name: 'KULIAH', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? nomorKuliah;

  @JsonKey(name: 'MATAKULIAH')
  final String? namaMataKuliah;

  @JsonKey(name: 'TAHUN', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? tahunAjaran;

  @JsonKey(name: 'SEMESTER', fromJson: MyJsonConverter.stringToSemester, toJson: MyJsonConverter.semesterToString)
  final Semester? semester;

  @JsonKey(name: 'STATUS_PENERIMAAN', fromJson: MyJsonConverter.stringToStatusPenerimaanPerizinan, toJson: MyJsonConverter.statusPenerimaanPerizinanToInt)
  final StatusPenerimaanPerizinan? statusPenerimaan;

  @JsonKey(name: 'MINGGU', fromJson: MyJsonConverter.stringToInt, toJson: MyJsonConverter.intToString)
  final int? minggu;

  @JsonKey(name: 'TANGGAL', fromJson: MyJsonConverter.stringToDateTime, toJson: MyJsonConverter.dateTimeToString)
  final DateTime? tanggalPerkuliahan;

  @JsonKey(name: 'KETERANGAN')
  final String? keterangan;

  @JsonKey(name: 'STATUS_YANG_DIINGINKAN', fromJson: MyJsonConverter.stringToStatusAbsensi, toJson: MyJsonConverter.statusAbsensiToString)
  final StatusAbsensi? statusYangDiinginkan;

  @JsonKey(name: 'LINK_BUKTI_FILE')
  final String? linkBuktiFile;

  PerizinanAbsensiDto({
    required this.idPerizinan,
    required this.tanggalEntry,
    required this.nomorMahasiswa,
    required this.namaMahasiswa,
    required this.nomorDosen,
    required this.nomorKuliah,
    required this.namaMataKuliah,
    required this.tahunAjaran,
    required this.semester,
    required this.statusPenerimaan,
    required this.minggu,
    required this.tanggalPerkuliahan,
    required this.keterangan,
    required this.statusYangDiinginkan,
    required this.linkBuktiFile,
  });

  factory PerizinanAbsensiDto.fromJson(Map<String , dynamic> json) =>
      _$PerizinanAbsensiDtoFromJson(json);
  Map<String , dynamic> toJson() => _$PerizinanAbsensiDtoToJson(this);
  //        {
  //             "NOMOR": "4",
  //             "TANGGAL_ENTRI": "22-FEB-24",
  //             "MAHASISWA": "2",
  //             "KULIAH": "1",
  //             "STATUS_PENERIMAAN": "1",
  //             "MINGGU": "3",
  //             "TANGGAL": "16-SEP-23",
  //             "KETERANGAN": null,
  //             "STATUS_YANG_DIINGINKAN": "H",
  //             "LINK_BUKTI_FILE": "https://www.google.com"
  //         },
}