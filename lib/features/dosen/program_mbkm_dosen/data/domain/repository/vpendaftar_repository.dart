import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/vpendaftar_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/vpendaftar_response.dart';

abstract class VpendaftarRepository {
  Future<List<Vpendaftar>> getVpendaftar({required int nomorDosen});
}

class VpendaftarRepositoryImpl implements VpendaftarRepository {
  final VpendaftarRemoteDataSource remoteDataSource;

  VpendaftarRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Vpendaftar>> getVpendaftar({required int nomorDosen}) async {
    try {
      final response =
          await remoteDataSource.getVpendaftar(nomorDosen: nomorDosen);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
