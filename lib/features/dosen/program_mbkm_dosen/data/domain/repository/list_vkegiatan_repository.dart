import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/list_vkegiatan_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/list_vkegiatan_response.dart';

abstract class ListVKegiatanResponseRepository {
  Future<List<ListVKegiatanResponse>> getListVKegiatanResponse();
}

class ListVKegiatanResponseRepositoryImpl
    implements ListVKegiatanResponseRepository {
  final ListVKegiatanResponseRemoteDataSource remoteDataSource;

  ListVKegiatanResponseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ListVKegiatanResponse>> getListVKegiatanResponse() async {
    try {
      final response = await remoteDataSource.getListVKegiatanResponse();

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
