import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';

class DosenPerizinanAbsensiFilterState {
  final int tahunAjaran;
  final Semester semester;
  final StatusPenerimaanPerizinan? status;
  DosenPerizinanAbsensiFilterState({
    required this.tahunAjaran,
    required this.semester,
    required this.status,
  });

  DosenPerizinanAbsensiFilterState copy({
    int? tahunAjaran,
    Semester? semester,
    StatusPenerimaanPerizinan? Function()? status
  }){
    return DosenPerizinanAbsensiFilterState(
      tahunAjaran: tahunAjaran ?? this.tahunAjaran,
      semester: semester ?? this.semester,
      status: status == null ? this.status : status(),
    );
  }
}