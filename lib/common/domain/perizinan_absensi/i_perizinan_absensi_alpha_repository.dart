import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/domain/perizinan_absensi/dto/submit_data_perizinan_absensi_dto.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/detail_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/dosen_filter_perizinan_absensi.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/preview_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/filter_state.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/preview_perizinan_absensi_for_mahasiswa.dart';

/// repository untuk menangani data-data perizinan absensi alpha
abstract class IPengajuanPerizinanAbsensiAlphaRepository {

  /// Mendapatkan list pengajuan absensi yang sudah ter-paginasi
  Future<ApiResponse<List<PreviewPerizinanAbsensiForMahasiswa>>>
    getPreviewPengajuanAbsensiForMahasiswa({
    required FilterState filter,
    required int nomorMahasiswa,
  });

  Future<ApiResponse<List<PreviewPerizinanAbsensiForDosen>>>
    getPreviewPengajuanAbsensiForDosen({
      required DosenPerizinanAbsensiFilterState filter,
      required int nomorDosen,
    });

  Future<ApiResponse<DetailPerizinanAbsensiForDosen>>
    getDetailPerizinanAbsensi(int pengajuanId);

  Future<ApiResponse<SubmitDataPerizinanDto>> submitData(SubmitDataPerizinanDto data);

  Future<ApiResponse<Object>> updatePerizinanAbsensi({
    required int idPerizinan,
    StatusPenerimaanPerizinan? newStatusPenerimaan,
  });
}