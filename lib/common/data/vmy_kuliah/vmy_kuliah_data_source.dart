
import 'package:mypens/common/data/common/dto/my_pens_api_data_wrapper.dart';
import 'package:mypens/common/data/vmy_kuliah/dto/vmy_kuliah_dto.dart';
import 'package:mypens/common/data/vmy_kuliah/vmy_kuliah_api_client.dart';
import 'package:mypens/common/domain/common/model/semester.dart';

class VmyKuliahDataSource {
  final _apiClient = VmyKuliahApiClient();

  Future<List<VmyKuliahDto>> getListVmyKuliahDto({
    int? nomorMahasiswa,
    String? nip,
    Semester? semester,
    int? tahunAjaran,
  }) async {
    final response = await _apiClient.getVmyKuliah(
      idMahasiswa: nomorMahasiswa,
      nip: nip,
      semester: semester,
      tahunAjaran: tahunAjaran,
    );

    return _parseJsonToListVmyKuliahDto(response.body);
  }

  Future<List<VmyKuliahDto>> _parseJsonToListVmyKuliahDto(String jsonBody) async {
    final dataWrapper = MyPensApiDataWrapper.fromJsonString(
      jsonBody,
      dataMapper: VmyKuliahDto.fromJson
    );
    return dataWrapper.data!;
  }
}