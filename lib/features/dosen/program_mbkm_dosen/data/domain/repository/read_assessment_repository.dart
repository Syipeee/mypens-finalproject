import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/read_assessment_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/read_assessment_response.dart';

abstract class ReadAssessmentRepository {
  Future<List<ReadAssessmentData>> getReadAssessment();
}

class ReadAssessmentRepositoryImpl implements ReadAssessmentRepository {
  final ReadAssessmentRemoteDataSource remoteDataSource;

  ReadAssessmentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ReadAssessmentData>> getReadAssessment() async {
    try {
      final response = await remoteDataSource.getReadAssessment();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
