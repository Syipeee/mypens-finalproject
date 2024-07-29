import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/mata_kuliah_preview.dart';

abstract class IVmyKuliahRepository {
  Future<ApiResponse<List<MataKuliahPreview>>> getMataKuliahFilteredAsApiResponse({
    required String keyword,
    required int idMahasiswa,
  });
  
  Future<List<MataKuliahPreview>> getMataKuliahFiltered({
    required String keyword,
    required int idMahasiswa,
  });
}