import 'package:mypens/common/data/perizinan_absensi/dto/perizinan_absensi_dto.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';
import 'package:mypens/common/utils/my_date_formatter.dart';

class DetailPerizinanAbsensiForDosen {
  final int idPerizinan;
  final String dibuatPada;
  final String dibuatOleh;
  final StatusPenerimaanPerizinan statusPenerimaan;
  final String namaMatkul;
  final String tanggalPerkuliahan;
  final int mingguKeMatkul;
  final String statusYangDiinginkan;
  final String? keterangan;
  final String urlBuktiFile;

  DetailPerizinanAbsensiForDosen({
    required this.idPerizinan,
    required this.dibuatPada,
    required this.dibuatOleh,
    required this.statusPenerimaan,
    required this.namaMatkul,
    required this.tanggalPerkuliahan,
    required this.mingguKeMatkul,
    required this.statusYangDiinginkan,
    required this.keterangan,
    required this.urlBuktiFile,
  });

  static DetailPerizinanAbsensiForDosen fromDto(PerizinanAbsensiDto dto){
    return DetailPerizinanAbsensiForDosen(
      idPerizinan: dto.idPerizinan!,
      dibuatPada: myDateFormatter.format(dto.tanggalEntry!),
      dibuatOleh: dto.namaMahasiswa!,
      statusPenerimaan: dto.statusPenerimaan!,
      namaMatkul: dto.namaMataKuliah!,
      tanggalPerkuliahan: myDateFormatter.format(dto.tanggalPerkuliahan!),
      mingguKeMatkul: dto.minggu!,
      statusYangDiinginkan: dto.statusYangDiinginkan!.value[0],
      keterangan: dto.keterangan ?? "-",
      urlBuktiFile: dto.linkBuktiFile!,
    );
  }
}