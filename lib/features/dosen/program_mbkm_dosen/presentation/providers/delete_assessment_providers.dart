import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/post_del_assessment.dart';

class DeleteAssessmentProvider extends ChangeNotifier {
  final DeleteAssessment deleteAssessment;

  DeleteAssessmentProvider({required this.deleteAssessment});

  Future<void> deleteAssessmentData({
    required VoidCallback? onSuccess,
    required VoidCallback? onError,
    required String nomor,
  }) async {
    try {
      // Tidak perlu mengubah nilai tanggal menjadi objek Tanggal
      await deleteAssessment.deleteAssessment(
        onSuccess: onSuccess,
        onError: onError,
        nomor: nomor,
      );
      print('nomor :' + nomor);
    } catch (e) {
      print('Error in DeleteAssessmentData: $e');
      onError?.call();
    }
  }
}
