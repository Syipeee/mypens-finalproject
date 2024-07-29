import 'package:flutter/material.dart';
import 'package:mypens/common/data/vmy_absensi_kuliah/vmy_absensi_kuliah_repository.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/domain/vmy_absensi_kuliah/rekap_absensi_mahasiswa_model.dart';

class RekapAbsenMahasiswaViewModel extends ChangeNotifier {
  final int _nrp;
  final _repository = VmyAbsensiKuliahRepository();

  int _tahunAjaran;
  int get tahunAjaran => _tahunAjaran;
  void onChangeTahunAjaran(int? newTahunAjaran){
    if (newTahunAjaran != null && newTahunAjaran != _tahunAjaran){
      _tahunAjaran = newTahunAjaran;
      reloadRekapAbsensi();
    }
  }

  Semester _semester;
  Semester get semester => _semester;
  void onChangeSemester(Semester? newSemester){
    if (newSemester != null && newSemester.id != _semester.id){
      _semester = newSemester;
      reloadRekapAbsensi();
    }
  }

  ApiResponse<RekapAbsensiMahasiswa> _rekapAbsensiResponse = ApiResponseLoading();
  ApiResponse<RekapAbsensiMahasiswa> get rekapAbsensiResponse => _rekapAbsensiResponse;
  void reloadRekapAbsensi() async {
    _rekapAbsensiResponse = ApiResponseLoading();
    notifyListeners();

    _rekapAbsensiResponse = await _repository.getRekapAbsensiForMahasiswa(
      nrp: _nrp,
      tahunAjaran: _tahunAjaran,
      semester: semester
    );
    notifyListeners();
  }

  RekapAbsenMahasiswaViewModel({
    required int initialTahunAjaran,
    required Semester initialSemester,
    required int nrp,
  }) : _tahunAjaran = initialTahunAjaran,
        _semester = initialSemester,
        _nrp = nrp {
    reloadRekapAbsensi();
  }
}