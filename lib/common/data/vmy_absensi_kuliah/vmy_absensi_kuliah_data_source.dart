import 'package:mypens/common/data/common/dto/my_pens_api_data_wrapper.dart';
import 'package:mypens/common/data/vmy_absensi_kuliah/dto/vmy_absensi_kuliah_dto.dart';
import 'package:mypens/common/data/vmy_absensi_kuliah/vmy_absensi_kuliah_api_client.dart';

class VmyAbsensiKuliahDataSource {
  final _apiClient = VmyAbsensiKuliahApiClient();

  Future<MyPensApiDataWrapper<VmyAbsensiKuliahDto>> getListVmyAbsensiKuliahDto({
    int? nrp,
    int? tahunAjaran,
    int? idSemester,
  }) async {
    final response = await _apiClient.getVmyAbsensiKuliah(
      nrp: nrp, tahunAjaran: tahunAjaran, idSemester: idSemester
    );
    return MyPensApiDataWrapper.fromJsonString(
      response.body, dataMapper: VmyAbsensiKuliahDto.fromJson
    );
  }
}