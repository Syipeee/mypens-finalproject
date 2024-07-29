import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/vpendaftar_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/vpendaftar_response.dart';

class GetVpendaftar {
  final VpendaftarRepository repository;

  GetVpendaftar(this.repository);
  Future<List<Vpendaftar>> execute(
      {String? page, required int nomorDosen}) async {
    final result = await repository.getVpendaftar(nomorDosen: nomorDosen);
    return result;
  }
}
