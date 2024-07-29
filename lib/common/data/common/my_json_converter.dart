import 'package:get/get_utils/get_utils.dart';
import 'package:intl/intl.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/status_absensi.dart';

abstract class MyJsonConverter {
  static int? stringToInt(String? value) =>
    value != null ? int.parse(value) : null;
  
  static String? intToString(int? value) =>
    value?.toString();

  static DateTime? stringToDateTime(String? value) {
    if (value == null){
      return null;
    }

    final dateSegment = value.split('-');
    return _dateFormat.parse(
      "${dateSegment.first}-"
      "${dateSegment[1].toLowerCase().capitalizeFirst}-"
      "20${dateSegment.last}"
    );
  }



  static String? dateTimeToString(DateTime? value) =>
    value == null ? null : _dateFormat.format(value);

  static  final _dateFormat = DateFormat('dd-MMM-yy');

  static StatusPenerimaanPerizinan? stringToStatusPenerimaanPerizinan(String? value) =>
    value == null ? null : StatusPenerimaanPerizinan.from(id: int.parse(value));

  static int? statusPenerimaanPerizinanToInt(StatusPenerimaanPerizinan? value) =>
    value?.id;

  static StatusAbsensi? stringToStatusAbsensi(String? value) =>
    value == null ? null :
      StatusAbsensi.values.singleWhere((status) => status.value[0] == value);

  static String? statusAbsensiToString(StatusAbsensi? value) =>
    value == null ? null : value.value[0];

  static Semester? stringToSemester(String? value){
    if (value == null){
      return null;
    }
    return Semester.fromId(int.parse(value));
  }

  static String? semesterToString(Semester? value) =>
    value?.id.toString();
}