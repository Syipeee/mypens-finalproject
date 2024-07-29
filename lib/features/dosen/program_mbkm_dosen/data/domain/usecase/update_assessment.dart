// update_assessment_usecase.dart

import 'dart:ui';

import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/update_assessment_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/update_assessment_response.dart';

class UpdateAssessment {
  final UpdateAssessmentRepository repository;

  UpdateAssessment(this.repository);

  Future<void> updateAssessment({
    VoidCallback? onSuccess,
    VoidCallback? onError,
    required String nilai,
    required String nomor,
    required String tanggal,
  }) async {
    try {
      final AssessmentResponseUpdate response =
          await repository.updateAssessment(
        nilai: nilai,
        nomor: nomor,
        tanggal: tanggal,
      );

      // Menambahkan pengecekan status response
      if (response.status == 'sukses') {
        onSuccess?.call();
      } else {
        onError?.call();
      }
    } catch (e) {
      print('Error in updateAssessment: $e');
      rethrow;
    }
  }
}
