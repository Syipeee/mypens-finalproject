import 'package:mypens/common/data/common/surround_with_http_try_catch.dart';
import 'package:mypens/common/data/vmy_absensi_kuliah/vmy_absensi_kuliah_data_source.dart';
import 'package:mypens/common/data/vmy_absensi_kuliah/vmy_absensi_kuliah_mapper.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/domain/vmy_absensi_kuliah/i_vmy_absensi_kuliah_repository.dart';
import 'package:mypens/common/domain/vmy_absensi_kuliah/rekap_absensi_mahasiswa_model.dart';

class VmyAbsensiKuliahRepository implements IVmyAbsensiKuliahRepository {
  final _dataSource = VmyAbsensiKuliahDataSource();
  final _mapper = VmyAbsensiKuliahMapper();

  @override
  Future<ApiResponse<RekapAbsensiMahasiswa>> getRekapAbsensiForMahasiswa({
    required int nrp,
    required int tahunAjaran,
    required Semester semester
  }) async {
    return surroundWithHttpTryCatch(() async {
      final dto = await _dataSource.getListVmyAbsensiKuliahDto(
        nrp: nrp, tahunAjaran: tahunAjaran, idSemester: semester.id
      );
      return ApiResponseSucceed(
        data: await _mapper.fromListDtoToRekapAbsensiMahasiswa(dto.data!)
      );
    });
  }

}