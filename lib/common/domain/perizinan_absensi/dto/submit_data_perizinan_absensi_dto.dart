import 'package:mypens/common/utils/my_date_formatter.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/status_absensi.dart';

class SubmitDataPerizinanDto {
  final int nomorMahasiswa;
  final String nomorKuliah;
  final int minggu;
  final DateTime tanggal;
  final StatusAbsensi statusYangDiinginkan;
  final String linkBuktiFile;
  final String keterangan;
  SubmitDataPerizinanDto({
    required this.nomorMahasiswa,
    required this.nomorKuliah,
    required this.minggu,
    required this.tanggal,
    required this.statusYangDiinginkan,
    required this.linkBuktiFile,
    required this.keterangan,
  });

  Map<String , dynamic> toJson(){
    return {
      'mahasiswa' : nomorMahasiswa,
      'kuliah' : nomorKuliah,
      'minggu' : minggu,
      'tanggal' : {
        'type' : 'date',
        'value' : myDateFormatter.format(tanggal)
      },
      'status_yang_diinginkan' : statusYangDiinginkan.toString()[0],
      'link_bukti_file' : linkBuktiFile,
      'keterangan' : keterangan,
    };
  }

}