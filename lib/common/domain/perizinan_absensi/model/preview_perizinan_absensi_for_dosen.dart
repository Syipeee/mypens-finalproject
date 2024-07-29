import 'package:mypens/common/data/perizinan_absensi/dto/perizinan_absensi_dto.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';

class PreviewPerizinanAbsensiForDosen {
  final DateTime tanggalMatkul;
  final String namaMatkul;
  final String mahasiswaPengaju;
  final StatusPenerimaanPerizinan status;
  final int idPerizinan;

  PreviewPerizinanAbsensiForDosen({
    required this.tanggalMatkul,
    required this.namaMatkul,
    required this.mahasiswaPengaju,
    required this.status,
    required this.idPerizinan,

  });

  factory PreviewPerizinanAbsensiForDosen.fromDto(
    PerizinanAbsensiDto dto
  ){
    return PreviewPerizinanAbsensiForDosen(
      tanggalMatkul: dto.tanggalPerkuliahan!,
      namaMatkul: dto.namaMataKuliah!,
      mahasiswaPengaju: dto.namaMahasiswa!,
      status: dto.statusPenerimaan!,
      idPerizinan: dto.idPerizinan!,
    );
  }
}