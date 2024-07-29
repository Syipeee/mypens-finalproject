import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/vmitra_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/vmitra_response.dart';

abstract class VmitraRepository {
  Future<List<Vmitra>> getVmitra();
}

class VmitraRepositoryImpl implements VmitraRepository {
  final VmitraRemoteDataSource remoteDataSource;

  VmitraRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Vmitra>> getVmitra() async {
    try {
      final response = await remoteDataSource.getVmitra();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
