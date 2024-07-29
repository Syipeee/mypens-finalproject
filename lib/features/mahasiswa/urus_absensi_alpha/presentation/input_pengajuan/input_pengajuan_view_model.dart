import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/data/perizinan_absensi/perizinan_absensi_repository.dart';
import 'package:mypens/common/domain/perizinan_absensi/dto/submit_data_perizinan_absensi_dto.dart';
import 'package:mypens/common/domain/perizinan_absensi/i_perizinan_absensi_alpha_repository.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/mata_kuliah_preview.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/status_absensi.dart';
import 'package:mypens/common/domain/vmy_kuliah/i_vmy_kuliah_repository.dart';

class InputPengajuanViewModel
    extends Bloc<InputPengajuanEvent , InputPengajuanUiState>{

  final IVmyKuliahRepository _repository;
  final IPengajuanPerizinanAbsensiAlphaRepository _perizinanRepository =
    PerizinanAbsensiRepository();
  final int _idMahasiswa;

  InputPengajuanViewModel({
    required IVmyKuliahRepository repository,
    required int idMahasiswa,
  }) : _repository = repository,
       _idMahasiswa = idMahasiswa,
       super(InputPengajuanUiState.viewInitialUiState)
       {
          on(_changeStatus);
          on(_changeMatkul);
          on(_changeMingguKe);
          on(_changeTanggal);
          on(_changeUrlBuktiFile);
          on(_changeKeterangan);
          on(_submit);
       }

  Future<List<MataKuliahPreview>> loadMataKuliah(
    String filter,
  ) =>
      _repository.getMataKuliahFiltered(
        keyword: filter,
        idMahasiswa: _idMahasiswa
      );

  void _changeStatus(
    OnChangeStatusYangDiinginkan event,
    Emitter<InputPengajuanUiState> emit
  ){
    emit(state.copy(statusYangDiinginkan: () => event.status));
  }

  void _changeMatkul(
    OnChangeMataKuliahDipilih event,
    Emitter<InputPengajuanUiState> emit,
  ){
    emit(state.copy(mataKuliahDipilih: () => event.matkul));
  }

  void _changeMingguKe(
    OnChangeMingguKe event,
    Emitter<InputPengajuanUiState> emit,
  ){
    emit(state.copy(mingguKe: () => event.mingguKe));
  }

  void _changeTanggal(
    OnChangeTanggal event,
    Emitter<InputPengajuanUiState> emit,
  ){
    emit(state.copy(tanggal: () => event.tanggal));
  }

  void _changeUrlBuktiFile(
    OnChangeUrlBuktiFile event,
    Emitter<InputPengajuanUiState> emit,
  ){
    emit(state.copy(urlBuktiFile: () => event.url));
  }

  void _changeKeterangan(
    OnChangeKeterangan event,
    Emitter<InputPengajuanUiState> emit,
  ){
    emit(state.copy(keterangan: () => event.keterangan));
  }

  Future<void> _submit(
    OnSubmit event,
    Emitter<InputPengajuanUiState> emit,
  ) async {
    emit(state.copy(submitResponse: () => ApiResponseLoading()));

    String? statusError;
    String? mataKuliahError;
    String? mingguKeError;
    String? tanggalError;
    String? urlBuktiFileError;
    if (state.statusYangDiinginkan == null){
      statusError = 'Status yang diinginkan tidak boleh kosong';
    }
    if (state.mataKuliahDipilih == null){
      mataKuliahError = 'Mata kuliah tidak boleh kosong';
    }
    if (state.mingguKe == null){
      mingguKeError = 'Minggu tidak boleh kosong';
    }
    if (state.tanggal == null){
      tanggalError = 'tanggal tidak boleh kosong';
    }
    if (state.urlBuktiFile.isEmpty){
      urlBuktiFileError = 'Bukti file tidak boleh kosong';
    }
    late ApiResponse submitResponse;
    // Jika ada error
    if (
      [statusError, mataKuliahError,
       mingguKeError, tanggalError,
       urlBuktiFileError].any((error) => error != null)
    ){
      submitResponse = ApiResponseFailed();
    }
    else {
      submitResponse = await _perizinanRepository.submitData(SubmitDataPerizinanDto(
          nomorMahasiswa: _idMahasiswa,
          nomorKuliah: state.mataKuliahDipilih!.idMatkul,
          minggu: state.mingguKe!,
          tanggal: state.tanggal!,
          statusYangDiinginkan: state.statusYangDiinginkan!,
          linkBuktiFile: state.urlBuktiFile,
          keterangan: state.keterangan,
      ));
    }
    final newState = state.copy(
      submitResponse: () => submitResponse,
      statusError: () => statusError,
      mataKuliahError: () => mataKuliahError,
      mingguKeError: () => mingguKeError,
      tanggalError: () => tanggalError,
      urlBuktiFileError: () => urlBuktiFileError,
    );
    emit(newState);
  }


}

sealed class InputPengajuanEvent {}

class OnChangeMataKuliahDipilih extends InputPengajuanEvent{
  final MataKuliahPreview matkul;
  OnChangeMataKuliahDipilih(this.matkul);
}

class OnChangeStatusYangDiinginkan extends InputPengajuanEvent{
  final StatusAbsensi status;
  OnChangeStatusYangDiinginkan(this.status);
}

class OnChangeMingguKe extends InputPengajuanEvent{
  final int? mingguKe;
  OnChangeMingguKe(String textMingguKe) : mingguKe = int.tryParse(textMingguKe);
}

class OnChangeUrlBuktiFile extends InputPengajuanEvent{
  final String url;
  OnChangeUrlBuktiFile(this.url);
}

class OnChangeKeterangan extends InputPengajuanEvent{
  final String keterangan;
  OnChangeKeterangan(this.keterangan);
}

class OnChangeTanggal extends InputPengajuanEvent {
  final DateTime tanggal;
  OnChangeTanggal(this.tanggal);
}

class OnSubmit extends InputPengajuanEvent{}


class InputPengajuanUiState {
  final StatusAbsensi? statusYangDiinginkan;
  final MataKuliahPreview? mataKuliahDipilih;
  final int? mingguKe;
  final DateTime? tanggal;
  final String urlBuktiFile;
  final String keterangan;
  final ApiResponse? submitResponse;

  final String? statusError;
  final String? mataKuliahError;
  final String? mingguKeError;
  final String? tanggalError;
  final String? urlBuktiFileError;

  InputPengajuanUiState({
    required this.statusYangDiinginkan,
    required this.mataKuliahDipilih,
    required this.mingguKe,
    required this.tanggal,
    required this.urlBuktiFile,
    required this.keterangan,
    required this.submitResponse,
    required this.statusError,
    required this.mataKuliahError,
    required this.mingguKeError,
    required this.tanggalError,
    required this.urlBuktiFileError,
  });

  InputPengajuanUiState copy({
    StatusAbsensi? Function()? statusYangDiinginkan,
    MataKuliahPreview? Function()? mataKuliahDipilih,
    int? Function()? mingguKe,
    DateTime? Function()? tanggal,
    String Function()? urlBuktiFile,
    String Function()? keterangan,
    String? Function()? statusError,
    String? Function()? mataKuliahError,
    String? Function()? mingguKeError,
    String? Function()? tanggalError,
    String? Function()? urlBuktiFileError,
    ApiResponse Function()? submitResponse,
  }) {
    return InputPengajuanUiState(
      statusYangDiinginkan: statusYangDiinginkan != null ? statusYangDiinginkan() : this.statusYangDiinginkan,
      mataKuliahDipilih: mataKuliahDipilih != null ? mataKuliahDipilih() : this.mataKuliahDipilih,
      mingguKe: mingguKe != null ? mingguKe() : this.mingguKe,
      tanggal: tanggal != null ? tanggal() : this.tanggal,
      urlBuktiFile: urlBuktiFile != null ? urlBuktiFile() : this.urlBuktiFile,
      keterangan: keterangan != null ? keterangan() : this.keterangan,
      submitResponse: submitResponse != null ? submitResponse() : this.submitResponse,
      statusError: statusError != null ? statusError() : this.statusError,
      mataKuliahError: mataKuliahError != null ? mataKuliahError() : this.mataKuliahError,
      mingguKeError: mingguKeError != null ? mingguKeError() : this.mingguKeError,
      tanggalError: tanggalError != null ? tanggalError() : this.tanggalError,
      urlBuktiFileError: urlBuktiFileError != null ? urlBuktiFileError() : this.urlBuktiFileError,
    );
  }

    static InputPengajuanUiState get viewInitialUiState =>
      InputPengajuanUiState(
        statusYangDiinginkan: null,
        mataKuliahDipilih: null,
        mingguKe: null,
        tanggal: null,
        urlBuktiFile: '',
        keterangan: '',
        submitResponse: null,
        mataKuliahError: null,
        mingguKeError: null,
        statusError: null,
        tanggalError: null,
        urlBuktiFileError: null,
    );
}
