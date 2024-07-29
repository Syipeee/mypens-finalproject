
import 'package:mypens/common/data/common/dto/my_pens_api_data_wrapper.dart';
import 'package:mypens/common/data/perizinan_absensi/dto/perizinan_absensi_dto.dart';
import 'package:mypens/common/data/perizinan_absensi/perizinan_absensi_api_client.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';

class PerizinanAbsensiDataSource {
  final _apiClient = PerizinanAbsensiApiClient();
  
  Future<List<PerizinanAbsensiDto>> getPerizinanAbsensi({
    StatusPenerimaanPerizinan? status,
    int? nomorMahasiswa,
    int? nomorDosen,
    int? tahunAjaran,
    Semester? semester,
    int? idPerizinan,
  }) async {
    final response = await _apiClient.getPerizinanAbsensi(
      status: status,
      nomorMahasiswa: nomorMahasiswa,
      nomorDosen: nomorDosen,
      tahunAjaran: tahunAjaran,
      semester: semester,
      idPerizinan: idPerizinan,
    );
    final listPerizinan = await _getListPerizinanAbsensiDtoFromResponseBody(
      response.body
    );

    return listPerizinan;
  }
  
  Future<List<PerizinanAbsensiDto>> 
    _getListPerizinanAbsensiDtoFromResponseBody(String jsonString) async {
    final dataWrapper = MyPensApiDataWrapper
      .fromJsonString(jsonString, dataMapper: PerizinanAbsensiDto.fromJson);
    return dataWrapper.data!;
  }

  Future<MyPensApiDataWrapper<dynamic>> updatePerizinanAbsensi({
    required int idPerizinan,
    StatusPenerimaanPerizinan? newStatusPenerimaan,
  }) async {
    final response = await _apiClient.updatePerizinanAbsensi(
      idPerizinan: idPerizinan,
      newStatus: newStatusPenerimaan
    );
    return MyPensApiDataWrapper
      .fromJsonString(response.body, dataMapper: null);
  }

}