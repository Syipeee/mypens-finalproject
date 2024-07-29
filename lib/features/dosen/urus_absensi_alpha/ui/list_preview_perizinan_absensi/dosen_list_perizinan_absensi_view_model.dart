import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypens/common/data/perizinan_absensi/perizinan_absensi_repository.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/domain/perizinan_absensi/i_perizinan_absensi_alpha_repository.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/dosen_filter_perizinan_absensi.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/preview_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';

class DosenListPerizinanAbsensiViewModel extends
  Bloc<DosenListPerizinanAbsensiEvent, DosenListPerizinanAbsensiUiState> {
  final IPengajuanPerizinanAbsensiAlphaRepository _repo =
    PerizinanAbsensiRepository();
  final int nomorDosen;

  DosenListPerizinanAbsensiViewModel({
    required this.nomorDosen,
    required int maxTahunAjaran,
    required Semester maxSemester,
  }) :
    super(DosenListPerizinanAbsensiUiState(
      listPerizinanAbsensiResponse: ApiResponseLoading(),
      filterState: DosenPerizinanAbsensiFilterState(
        tahunAjaran: maxTahunAjaran,
        semester: maxSemester,
        status: StatusPenerimaanPerizinan.menunggu,
      )
    )){
      on(_dosenReloadListPerizinanAbsensi);
      on(_changeTahunAjaranFilter);
      on(_changeSemesterFilter);
      on(_changeStatusPenerimaanPerizinan);

      add(OnReloadListPerizinanAbsensi());
    }

  void _dosenReloadListPerizinanAbsensi(
    OnReloadListPerizinanAbsensi event,
    Emitter<DosenListPerizinanAbsensiUiState> emit,
  ) async {
    emit(state.copy(listPerizinanAbsensiResponse: ApiResponseLoading()));
    final response = await _repo.getPreviewPengajuanAbsensiForDosen(
        nomorDosen: nomorDosen, filter: state.filterState,
    );
    emit(state.copy(listPerizinanAbsensiResponse: response));
  }
  
  void _changeTahunAjaranFilter(
    OnChangeTahunAjaranFilter event,
    Emitter<DosenListPerizinanAbsensiUiState> emit,  
  ) async {
    emit(state.copy(filterState: state.filterState.copy(
      tahunAjaran: event.tahun,
    )));
  }

  void _changeSemesterFilter(
    OnChangeSemesterFilter event,
    Emitter<DosenListPerizinanAbsensiUiState> emit,
  ){
    emit(state.copy(filterState: state.filterState.copy(
      semester: event.newSemester,
    )));
  }

  void _changeStatusPenerimaanPerizinan(
    OnChangeStatusPenerimaanFilter event,
    Emitter<DosenListPerizinanAbsensiUiState> emit,
  ){
    emit(state.copy(filterState: state.filterState.copy(
      status: () => event.status,
    )));
  }
}

class DosenListPerizinanAbsensiUiState {
  final ApiResponse<List<PreviewPerizinanAbsensiForDosen>> listPerizinanAbsensiResponse;
  final DosenPerizinanAbsensiFilterState filterState;
  DosenListPerizinanAbsensiUiState({
    required this.listPerizinanAbsensiResponse,
    required this.filterState,
  });

  DosenListPerizinanAbsensiUiState copy({
    ApiResponse<List<PreviewPerizinanAbsensiForDosen>>? listPerizinanAbsensiResponse,
    DosenPerizinanAbsensiFilterState? filterState
  }){
    return DosenListPerizinanAbsensiUiState(
      listPerizinanAbsensiResponse: listPerizinanAbsensiResponse ?? this.listPerizinanAbsensiResponse,
      filterState: filterState ?? this.filterState,
    );
  }
}

sealed class DosenListPerizinanAbsensiEvent {}

class OnReloadListPerizinanAbsensi extends DosenListPerizinanAbsensiEvent{}

class OnChangeTahunAjaranFilter extends DosenListPerizinanAbsensiEvent {
  final int tahun;
  OnChangeTahunAjaranFilter(this.tahun);
}

class OnChangeSemesterFilter extends DosenListPerizinanAbsensiEvent{
  final Semester newSemester;
  OnChangeSemesterFilter(this.newSemester);
}

class OnChangeStatusPenerimaanFilter extends DosenListPerizinanAbsensiEvent {
  final StatusPenerimaanPerizinan? status;
  OnChangeStatusPenerimaanFilter(this.status);
}