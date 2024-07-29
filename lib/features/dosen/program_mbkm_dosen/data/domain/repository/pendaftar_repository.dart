import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/pendaftar_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/pendaftar_response.dart';

abstract class PendaftarRepository {
  Future<List<Pendaftar>> getPendaftar();
}

class PendaftarRepositoryImpl implements PendaftarRepository {
  final PendaftarRemoteDataSource remoteDataSource;

  PendaftarRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Pendaftar>> getPendaftar() async {
    try {
      final response = await remoteDataSource.getPendaftar();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
