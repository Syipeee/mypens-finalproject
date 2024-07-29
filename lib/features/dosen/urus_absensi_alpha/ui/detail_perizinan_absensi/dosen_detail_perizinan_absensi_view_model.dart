

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/detail_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/domain/perizinan_absensi/i_perizinan_absensi_alpha_repository.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/domain/use_cases/terima_perizinan_absensi_use_case.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/domain/use_cases/tolak_perizinan_absensi_use_case.dart';

class DosenDetailAbsensiAlphaViewModel extends
  Bloc<DosenDetailAbsensiAlphaEvent , DosenDetailAbsensiAlphaState> {

  final IPengajuanPerizinanAbsensiAlphaRepository _repository;
  final TolakPerizinanAbsensiUseCase _tolakPerizinanAbsensi;
  final TerimaPerizinanAbsensiUseCase _terimaPerizinanAbsensi;
  final int _idPerizinan;

  DosenDetailAbsensiAlphaViewModel({
    required IPengajuanPerizinanAbsensiAlphaRepository repository,
    required int idPerizinan,
  }) : _repository = repository,
      _tolakPerizinanAbsensi = TolakPerizinanAbsensiUseCase(repository: repository),
      _terimaPerizinanAbsensi = TerimaPerizinanAbsensiUseCase(repository: repository),
      _idPerizinan = idPerizinan,
      super(
        DosenDetailAbsensiAlphaState(
          detailDataAbsensiResponse: ApiResponseLoading(),
          tolakOrTerimaPerizinanResponse: ApiResponseFailed(),
        )
      ){
        on(_onReloadDetailPerizinan);
        on(_onTolakPerizinanAbsensi);
        on(_onTerimaPerizinanAbsensi);

        add(OnReloadDetailPerizinan());
      }
  
  void _onReloadDetailPerizinan(
    OnReloadDetailPerizinan event,
    Emitter<DosenDetailAbsensiAlphaState> emit,
  ) async {
    emit(state.copy(detailDataAbsensiResponse: ApiResponseLoading()));

    final response = await _repository.getDetailPerizinanAbsensi(_idPerizinan);
    emit(state.copy(detailDataAbsensiResponse: response));
  }

  void _onTolakPerizinanAbsensi(
    OnTolakPerizinanAbsensi event,
    Emitter<DosenDetailAbsensiAlphaState> emit,
  ) async {
    emit(state.copy(tolakOrTerimaPerizinanResponse: ApiResponseLoading()));

    final response = await _tolakPerizinanAbsensi(_idPerizinan);
    emit(state.copy(tolakOrTerimaPerizinanResponse: response is ApiResponseSucceed ?
      ApiResponseSucceed(data: TertolakOrDiterima.ditolak) :
      ApiResponseFailed(exception: (response as ApiResponseFailed).exception))
    );
  }

  void _onTerimaPerizinanAbsensi(
    OnTerimaPerizinanAbsensi event,
    Emitter<DosenDetailAbsensiAlphaState> emit,
  ) async {
    emit(state.copy(tolakOrTerimaPerizinanResponse:  ApiResponseLoading()));

    final response = await _terimaPerizinanAbsensi(_idPerizinan);
    emit(state.copy(
      tolakOrTerimaPerizinanResponse: response is ApiResponseSucceed ?
        ApiResponseSucceed(data: TertolakOrDiterima.diterima) :
        ApiResponseFailed(exception: (response as ApiResponseFailed).exception)
    ));
  }
}

class DosenDetailAbsensiAlphaState {
  final ApiResponse<DetailPerizinanAbsensiForDosen> detailDataAbsensiResponse;
  final ApiResponse<TertolakOrDiterima> tolakOrTerimaPerizinanResponse;

  DosenDetailAbsensiAlphaState({
    required this.detailDataAbsensiResponse,
    required this.tolakOrTerimaPerizinanResponse,
  });

  DosenDetailAbsensiAlphaState copy({
    ApiResponse<DetailPerizinanAbsensiForDosen>? detailDataAbsensiResponse,
    ApiResponse<TertolakOrDiterima>? tolakOrTerimaPerizinanResponse,
  }){
    return DosenDetailAbsensiAlphaState(
      detailDataAbsensiResponse: detailDataAbsensiResponse ?? this.detailDataAbsensiResponse,
      tolakOrTerimaPerizinanResponse: tolakOrTerimaPerizinanResponse?? this.tolakOrTerimaPerizinanResponse,
    );
  }
}

enum TertolakOrDiterima {
  diterima, ditolak
}

sealed class DosenDetailAbsensiAlphaEvent {}

class OnReloadDetailPerizinan extends DosenDetailAbsensiAlphaEvent {}

class OnTolakPerizinanAbsensi extends DosenDetailAbsensiAlphaEvent {}

class OnTerimaPerizinanAbsensi extends DosenDetailAbsensiAlphaEvent {}