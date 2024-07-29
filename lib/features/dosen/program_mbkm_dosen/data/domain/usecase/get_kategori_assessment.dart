import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/kategori_assessment_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/kategori_assessment_response.dart';

class GetKategoriAssessment {
  final KategoriAssessmentRepository repository;

  GetKategoriAssessment(this.repository);
  Future<List<KategoriAssessment>> execute({
    String? page,
  }) async {
    final result = await repository.getKategoriAssessment();
    return result;
  }
}
