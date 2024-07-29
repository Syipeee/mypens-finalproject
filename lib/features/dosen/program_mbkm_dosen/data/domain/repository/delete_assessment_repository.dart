// update_assessment_repository.dart

import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/delete_assessment_remote_datasource.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/delete_assessment_response.dart';

abstract class DeleteAssessmentRepository {
  Future<DeleteAssessmentResponse> deleteAssessment({
    required String nomor,
  });
}

class DeleteAssessmentRepositoryImpl implements DeleteAssessmentRepository {
  final DeleteAssessmentRemoteDataSource remoteDataSource;

  DeleteAssessmentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DeleteAssessmentResponse> deleteAssessment({
    required String nomor,
  }) async {
    try {
      final response = await remoteDataSource.deleteAssessmentData(
        nomor: nomor,
      );
      return response;
    } catch (e) {
      print('Error in DeleteAssessment: $e');
      rethrow;
    }
  }
}
