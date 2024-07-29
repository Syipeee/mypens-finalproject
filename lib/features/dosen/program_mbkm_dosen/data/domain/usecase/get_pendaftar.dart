import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/pendaftar_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/pendaftar_response.dart';

class GetPendaftar {
  final PendaftarRepository repository;

  GetPendaftar(this.repository);
  Future<List<Pendaftar>> execute({
    String? page,
  }) async {
    final result = await repository.getPendaftar();
    return result;
  }
}
