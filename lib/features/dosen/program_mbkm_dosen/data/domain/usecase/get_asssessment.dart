import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/read_assessment_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/read_assessment_response.dart';

class GetReadAssessment {
  final ReadAssessmentRepository repository;

  GetReadAssessment(this.repository);
  Future<List<ReadAssessmentData>> execute({
    String? page,
  }) async {
    final result = await repository.getReadAssessment();
    return result;
  }
}
