import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/list_kegiatan_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/list_kegiatan_response.dart';

abstract class ListKegiatanResponseRepository {
  Future<List<ListKegiatanResponse>> getListKegiatanResponse();
}

class ListKegiatanResponseRepositoryImpl
    implements ListKegiatanResponseRepository {
  final ListKegiatanResponseRemoteDataSource remoteDataSource;

  ListKegiatanResponseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ListKegiatanResponse>> getListKegiatanResponse() async {
    try {
      final response = await remoteDataSource.getListKegiatanResponse();

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
