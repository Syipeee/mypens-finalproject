// update_assessment_repository.dart

import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/update_assessment_remote_datasource.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/update_assessment_response.dart';

abstract class UpdateAssessmentRepository {
  Future<AssessmentResponseUpdate> updateAssessment({
    required String nilai,
    required String nomor,
    required String tanggal,
  });
}

class UpdateAssessmentRepositoryImpl implements UpdateAssessmentRepository {
  final UpdateAssessmentRemoteDataSource remoteDataSource;

  UpdateAssessmentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AssessmentResponseUpdate> updateAssessment({
    required String nilai,
    required String nomor,
    required String tanggal, // Mengubah tipe data tanggal menjadi String
  }) async {
    try {
      final response = await remoteDataSource.updateAssessmentData(
        nilai: nilai,
        tanggal: tanggal,
        nomor: nomor,
      );
      return response;
    } catch (e) {
      print('Error in updateAssessment: $e');
      rethrow;
    }
  }
}
