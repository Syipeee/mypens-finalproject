import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/list_vkegiatan_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/list_vkegiatan_response.dart';

class GetListVKegiatanResponse {
  final ListVKegiatanResponseRepository repository;

  GetListVKegiatanResponse(this.repository);

  Future<List<ListVKegiatanResponse>> execute({String? page}) async {
    final result = await repository.getListVKegiatanResponse();
    return result;

    // print(result);
  }
}
