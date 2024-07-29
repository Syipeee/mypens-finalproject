import 'dart:convert';

import 'package:mypens/common/data/common/surround_with_http_try_catch.dart';
import 'package:mypens/common/data/perizinan_absensi/perizinan_absensi_api_client.dart';
import 'package:mypens/common/data/perizinan_absensi/perizinan_absensi_data_source.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/domain/perizinan_absensi/dto/submit_data_perizinan_absensi_dto.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/detail_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/dosen_filter_perizinan_absensi.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/preview_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/preview_perizinan_absensi_for_mahasiswa.dart';
import 'package:mypens/common/domain/perizinan_absensi/i_perizinan_absensi_alpha_repository.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/filter_state.dart';

class PerizinanAbsensiRepository implements IPengajuanPerizinanAbsensiAlphaRepository{

  final _apiClient = PerizinanAbsensiApiClient();
  final _perizinanAbsensiDataSource = PerizinanAbsensiDataSource();

  @override
  Future<ApiResponse<DetailPerizinanAbsensiForDosen>> getDetailPerizinanAbsensi(int idPerizinan) {
    return surroundWithHttpTryCatch(() async {
      final perizinanAbsensiDto = (await _perizinanAbsensiDataSource
          .getPerizinanAbsensi(idPerizinan: idPerizinan)).single;
      return ApiResponseSucceed(
        data: DetailPerizinanAbsensiForDosen.fromDto(perizinanAbsensiDto)
      );
    });
  }

  @override
  Future<ApiResponse<List<PreviewPerizinanAbsensiForDosen>>>
    getPreviewPengajuanAbsensiForDosen({
      required DosenPerizinanAbsensiFilterState filter,
      /// warning, nomor dosen bukan NIP
      required int nomorDosen,

    }) async {
    return surroundWithHttpTryCatch(() async {
      final listPerizinanDto = await _perizinanAbsensiDataSource
          .getPerizinanAbsensi(
        status: filter.status,
        semester: filter.semester,
        tahunAjaran: filter.tahunAjaran,
        nomorDosen: nomorDosen,
      );
      final listPerizinanPreviewDosen = listPerizinanDto.map((dto) =>
          PreviewPerizinanAbsensiForDosen.fromDto(dto)
      ).toList();
      return ApiResponseSucceed(
          data: listPerizinanPreviewDosen
      );
    });
  }

  @override
  Future<ApiResponse<List<PreviewPerizinanAbsensiForMahasiswa>>>
    getPreviewPengajuanAbsensiForMahasiswa({
      required FilterState filter,
      required int nomorMahasiswa,
    }) async {
    return surroundWithHttpTryCatch(() async {
      final listPerizinanAbsensiDto = await _perizinanAbsensiDataSource
          .getPerizinanAbsensi(
        status: filter.status,
        nomorMahasiswa: nomorMahasiswa,
        semester: filter.semester,
        tahunAjaran: filter.tahunAjaran,
      );

      final listPreviewPerizinanAbsensi = listPerizinanAbsensiDto.map(
              (perizinanAbsensi) {
            return PreviewPerizinanAbsensiForMahasiswa.fromDto(perizinanAbsensi);
          }).toList();

      return ApiResponseSucceed(data: listPreviewPerizinanAbsensi);
    });
  }

  @override
  Future<ApiResponse<SubmitDataPerizinanDto>> submitData(SubmitDataPerizinanDto data) async {
    return surroundWithHttpTryCatch(() async {
      final response = await _apiClient.submitData(data);
      final jsonBody = jsonDecode(response.body);
      return jsonBody['status'] == 'sukses' ?
      ApiResponseSucceed() : throw Exception(response.body);
    });
  }

  @override
  Future<ApiResponse<Object>> updatePerizinanAbsensi({
    required int idPerizinan,
    StatusPenerimaanPerizinan? newStatusPenerimaan
  }) {
    return surroundWithHttpTryCatch(() async {
      final responseDto = await _perizinanAbsensiDataSource.updatePerizinanAbsensi(
        idPerizinan: idPerizinan,
        newStatusPenerimaan: newStatusPenerimaan,
      );
      if (responseDto.status == 'sukses'){
        return ApiResponseSucceed();
      }
      throw Exception('Kesalahan tidak diketahui, gagal mengupdate data');
    });
  }



}