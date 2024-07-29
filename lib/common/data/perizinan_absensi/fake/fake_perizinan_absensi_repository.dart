import 'dart:math';

import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/domain/perizinan_absensi/dto/submit_data_perizinan_absensi_dto.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/detail_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/dosen_filter_perizinan_absensi.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/preview_perizinan_absensi_for_dosen.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/filter_state.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/preview_perizinan_absensi_for_mahasiswa.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';
import 'package:mypens/common/domain/perizinan_absensi/i_perizinan_absensi_alpha_repository.dart';

class FakePerizinanAbsensiRepository extends IPengajuanPerizinanAbsensiAlphaRepository {

  @override
  Future<ApiResponse<List<PreviewPerizinanAbsensiForMahasiswa>>>
    getPreviewPengajuanAbsensiForMahasiswa({
    required FilterState filter,
    required int nomorMahasiswa,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    if (_rand.nextInt(10) < 4) {
      return ApiResponseFailed(exception: Exception('Koneksi Gagal'));
    } else {
      return ApiResponseSucceed(
        data: List.generate(20, (index) =>
          PreviewPerizinanAbsensiForMahasiswa(
            dibuatPada: DateTime(2000, 1, 1),
            namaMatkul: _getRandomListMatkul(),
            tanggalMatkul: DateTime(2000, 1, 1),
            mingguMatkul: 3,
            status: _getRandomStatus()
          )
        ),
      );
    }
  }

  static final _rand = Random();

  final _listMatkul = [
    'Workshop Pemrograman Perangkat Bergerak',
    'Workshop Pengembangan Perangkat Lunak Berbasis Agile',
    'Basis Data Lanjutan',
    'Basis Data',
    'Pengenalan Teknologi Informasi'
  ];

  String _getRandomListMatkul(){
    return _listMatkul[_rand.nextInt(_listMatkul.length)];
  }

  StatusPenerimaanPerizinan _getRandomStatus(){
    switch (_rand.nextInt(3)){
      case 0:
        return StatusPenerimaanPerizinan.diterima;
      case 1:
        return StatusPenerimaanPerizinan.ditolak;
      case 2:
        return StatusPenerimaanPerizinan.menunggu;
      default:
        throw Exception("Unexpected random number");
    }
  }

  @override
  Future<ApiResponse<List<PreviewPerizinanAbsensiForDosen>>>
    getPreviewPengajuanAbsensiForDosen({
      required DosenPerizinanAbsensiFilterState filter,
      required int nomorDosen,
    }) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return ApiResponseSucceed(
      data: List.generate(20, (index) =>
        PreviewPerizinanAbsensiForDosen(
          tanggalMatkul: DateTime(2024, 1, 31),
          namaMatkul: _listMatkul[_rand.nextInt(_listMatkul.length)],
          mahasiswaPengaju: _listMahasiswa[_rand.nextInt(_listMahasiswa.length)],
          status: StatusPenerimaanPerizinan.values[_rand.nextInt(3)],
          idPerizinan: -1,
        ),
      ),
    );
  }

  final _listMahasiswa = [
    'Bagus Anggriawan',
    'Nur Wachid',
    'Hezbi Sulaiman',
    'Nuril Huda',
  ];

  @override
  Future<ApiResponse<DetailPerizinanAbsensiForDosen>>
    getDetailPerizinanAbsensi(int pengajuanId) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    return ApiResponseSucceed(
      data: DetailPerizinanAbsensiForDosen(
        idPerizinan: 1,
        dibuatOleh: 'Hezbi Muhammad Sulaiman',
        dibuatPada: 'Senin, 28 Agustus 2023, 14.00 WIB',
        statusPenerimaan: StatusPenerimaanPerizinan.menunggu,
        namaMatkul: 'Workshop Pengembangan Perangkat Lunak Berbasis Agile',
        tanggalPerkuliahan: '22 April 2023',
        mingguKeMatkul: 8,
        statusYangDiinginkan: 'Izin',
        keterangan: '-',
        urlBuktiFile: 'https://drive.google.com/file/d/15JPFeYFW1ol4c-2ANZY2HzEHqlixIhyH/view?usp=sharing'
      ),
    );
  }

  @override
  Future<ApiResponse<SubmitDataPerizinanDto>> submitData(SubmitDataPerizinanDto data) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<Object>> updatePerizinanAbsensi({
    required int idPerizinan,
    StatusPenerimaanPerizinan? newStatusPenerimaan
  }) {
    throw UnimplementedError();
  }





}