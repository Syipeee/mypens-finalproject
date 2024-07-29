import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/list_kegiatan_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/list_kegiatan_response.dart';

class GetListKegiatanResponse {
  final ListKegiatanResponseRepository repository;

  GetListKegiatanResponse(this.repository);

  Future<List<ListKegiatanResponse>> execute({String? page}) async {
    final result = await repository.getListKegiatanResponse();
    return result;
  }
}
