import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/filter_state.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/preview_perizinan_absensi_for_mahasiswa.dart';
import 'package:mypens/common/domain/perizinan_absensi/i_perizinan_absensi_alpha_repository.dart';

class HistoryPengajuanViewModel extends
  Bloc<HistoryPengajuanUiEvent , HistoryPengajuanUiState> {

  final IPengajuanPerizinanAbsensiAlphaRepository _repository;
  final int _nomorMahasiswa;

  HistoryPengajuanViewModel({
    required IPengajuanPerizinanAbsensiAlphaRepository repository,
    /// Tahun ajaran yang terakhir kali dijalankan oleh mahasiswa ini
    required int lastYear,
    /// Semester terakhir yang dijalankan oleh mahasiswa ini
    required Semester lastSemester,
    required int nomorMahasiswa,
  }) : _nomorMahasiswa = nomorMahasiswa, _repository = repository,
        super(HistoryPengajuanUiState(
          filterState: FilterState(
            tahunAjaran: lastYear,
            semester: lastSemester,
            status: null,
          ),
          listPerizinanAbsensiResponse: ApiResponseLoading(),
        )){
          on<MahasiswaReloadListPerizinanAbsensi>(_reloadListPerizinanAbsensi);
          on(_onChangeTahunAjaran);
          on(_onChangeSemester);
          on(_onChangeStatusPerizinan);

          add(MahasiswaReloadListPerizinanAbsensi());
        } 
        
  void _reloadListPerizinanAbsensi(
    MahasiswaReloadListPerizinanAbsensi event,
    Emitter<HistoryPengajuanUiState> emit
  ) async {
    emit(state.copy(listPerizinanAbsensiResponse: ApiResponseLoading()));
    final response = await _repository
      .getPreviewPengajuanAbsensiForMahasiswa(
        filter: state.filterState,
        nomorMahasiswa: _nomorMahasiswa,
      );
    emit(state.copy(listPerizinanAbsensiResponse: response));
  }

  void _onChangeTahunAjaran(
    OnChangeTahunAjaran event,
    Emitter<HistoryPengajuanUiState> emit
  ){
    emit(state.copy(filterState: state.filterState.copy(
      tahunAjaran: event.tahunAjaran
    )));
  }

  void _onChangeSemester(
    OnChangeSemester event,
    Emitter<HistoryPengajuanUiState> emit,
  ){
    emit(state.copy(filterState: state.filterState.copy(
      semester: event.semester,
    )));
  }

  void _onChangeStatusPerizinan(
    OnChangeStatusPerizinan event,
    Emitter<HistoryPengajuanUiState> emit,
  ){
    emit(state.copy(filterState: state.filterState.copy(
      status: () => event.status,
    )));
  }
}

class HistoryPengajuanUiState {
  final FilterState filterState;
  final ApiResponse<List<PreviewPerizinanAbsensiForMahasiswa>> listPerizinanAbsensiResponse;

  HistoryPengajuanUiState({
    required this.filterState,
    required this.listPerizinanAbsensiResponse,
  });
  
  HistoryPengajuanUiState copy({
    FilterState? filterState,
    ApiResponse<List<PreviewPerizinanAbsensiForMahasiswa>>? listPerizinanAbsensiResponse,
  }){
    return HistoryPengajuanUiState(
      filterState: filterState ?? this.filterState, 
      listPerizinanAbsensiResponse: listPerizinanAbsensiResponse ?? this.listPerizinanAbsensiResponse,
    );
  }
}

sealed class HistoryPengajuanUiEvent{}

class MahasiswaReloadListPerizinanAbsensi extends HistoryPengajuanUiEvent {}

class OnChangeTahunAjaran extends HistoryPengajuanUiEvent {
  final int tahunAjaran;
  OnChangeTahunAjaran({required this.tahunAjaran});
}

class OnChangeSemester extends HistoryPengajuanUiEvent {
  final Semester semester;
  OnChangeSemester({required this.semester});
}

class OnChangeStatusPerizinan extends HistoryPengajuanUiEvent {
  final StatusPenerimaanPerizinan? status;
  OnChangeStatusPerizinan({required this.status});
}