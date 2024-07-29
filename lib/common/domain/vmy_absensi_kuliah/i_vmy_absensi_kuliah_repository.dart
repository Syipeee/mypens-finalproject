import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/domain/vmy_absensi_kuliah/rekap_absensi_mahasiswa_model.dart';

/// Mendapatkan data rekap absensi seorang mahasiswa
abstract class IVmyAbsensiKuliahRepository {
  Future<ApiResponse<RekapAbsensiMahasiswa>> getRekapAbsensiForMahasiswa({
    required int nrp,
    required int tahunAjaran,
    required Semester semester,
  });
}