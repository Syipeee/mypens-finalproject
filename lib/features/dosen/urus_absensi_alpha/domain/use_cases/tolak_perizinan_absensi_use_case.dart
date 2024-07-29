import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/domain/perizinan_absensi/i_perizinan_absensi_alpha_repository.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';

class TolakPerizinanAbsensiUseCase {
  final IPengajuanPerizinanAbsensiAlphaRepository _repository;
  TolakPerizinanAbsensiUseCase({
    required IPengajuanPerizinanAbsensiAlphaRepository repository
  }) : _repository = repository;

  Future<ApiResponse<Object>> call(int idPerizinan){
    return _repository.updatePerizinanAbsensi(
      idPerizinan: idPerizinan,
      newStatusPenerimaan: StatusPenerimaanPerizinan.ditolak,
    );
  }
}