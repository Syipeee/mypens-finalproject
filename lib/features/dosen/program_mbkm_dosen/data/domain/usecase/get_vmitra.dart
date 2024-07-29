import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/vmitra_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/vmitra_response.dart';

class GetVmitra {
  final VmitraRepository repository;

  GetVmitra(this.repository);
  Future<List<Vmitra>> execute({
    String? page,
  }) async {
    final result = await repository.getVmitra();
    return result;
  }
}
