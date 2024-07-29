import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/read_vassessment_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/read_vassessment_response.dart';

class GetVReadAssessment {
  final VReadAssessmentRepository repository;

  GetVReadAssessment(this.repository);
  Future<List<VReadAssessmentData>> execute({
    String? page,
  }) async {
    final result = await repository.getVReadAssessment();
    return result;
  }
}
