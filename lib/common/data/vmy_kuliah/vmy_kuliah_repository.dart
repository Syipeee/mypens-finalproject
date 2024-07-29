import 'package:collection/collection.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/data/vmy_kuliah/vmy_kuliah_api_client.dart';
import 'package:mypens/common/data/vmy_kuliah/vmy_kuliah_mapper.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/mata_kuliah_preview.dart';
import 'package:mypens/common/domain/vmy_kuliah/i_vmy_kuliah_repository.dart';

class VmyKuliahRepository implements IVmyKuliahRepository {
  final _apiClient = VmyKuliahApiClient();
  final _mapper = VmyKuliahMapper();

  @override
  Future<ApiResponse<List<MataKuliahPreview>>> getMataKuliahFilteredAsApiResponse({
    required String keyword,
    required int idMahasiswa
  }) async {
    try {
      final response = await _apiClient
        .getVmyKuliah(idMahasiswa: idMahasiswa);

      if (response.statusCode < 300){
        final listAllMataKuliah = _mapper.getListMataKuliahPreviewFromBody(response.body);
        final filteredMataKuliah = listAllMataKuliah.where((matkul) =>
          matkul.namaMatkul.contains(keyword)
        ).sortedBy((matkul) => matkul.namaMatkul).toList();

        return ApiResponseSucceed(data: filteredMataKuliah);
      } else {
        return ApiResponseFailed(exception: Exception(response.body));
      }
    } on Exception catch (e) {
      return ApiResponseFailed(exception: e);
    }
  }

  @override
  Future<List<MataKuliahPreview>> getMataKuliahFiltered({
    required String keyword, 
    required int idMahasiswa
  }) async {
    final apiResponse = await getMataKuliahFilteredAsApiResponse(
        keyword: keyword, idMahasiswa: idMahasiswa
    );
    
    if (apiResponse is ApiResponseSucceed){
      return (apiResponse as ApiResponseSucceed<List<MataKuliahPreview>>).data!;
    }
    throw (apiResponse as ApiResponseFailed).exception!;
  }

}