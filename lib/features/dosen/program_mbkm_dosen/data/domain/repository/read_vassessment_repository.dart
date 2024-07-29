import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/read_vassessment_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/read_vassessment_response.dart';

abstract class VReadAssessmentRepository {
  Future<List<VReadAssessmentData>> getVReadAssessment();
}

class VReadAssessmentRepositoryImpl implements VReadAssessmentRepository {
  final VReadAssessmentRemoteDataSource remoteDataSource;

  VReadAssessmentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<VReadAssessmentData>> getVReadAssessment() async {
    try {
      final response = await remoteDataSource.getVReadAssessment();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
