import 'package:mypens/common/data/perizinan_absensi/dto/perizinan_absensi_dto.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';

class PreviewPerizinanAbsensiForMahasiswa {
  final DateTime dibuatPada;
  final String namaMatkul;
  final DateTime tanggalMatkul;
  final int mingguMatkul;
  final StatusPenerimaanPerizinan status;

  PreviewPerizinanAbsensiForMahasiswa({
    required this.dibuatPada,
    required this.namaMatkul,
    required this.tanggalMatkul,
    required this.mingguMatkul,
    required this.status,
  });
  
  factory PreviewPerizinanAbsensiForMahasiswa.fromDto(
    PerizinanAbsensiDto perizinanAbsensi    
  ){
    return PreviewPerizinanAbsensiForMahasiswa(
      dibuatPada: perizinanAbsensi.tanggalEntry!,
      namaMatkul: perizinanAbsensi.namaMataKuliah!,
      tanggalMatkul: perizinanAbsensi.tanggalPerkuliahan!,
      mingguMatkul: perizinanAbsensi.minggu!,
      status: perizinanAbsensi.statusPenerimaan!,
    );
  }
}