import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/update_assessment.dart';

class UpdateAssessmentProvider extends ChangeNotifier {
  final UpdateAssessment updateAssessment;

  UpdateAssessmentProvider({required this.updateAssessment});

  final TextEditingController nilaiController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();

  void initTextController({
    required String initialTanggal,
    required String initialNilai,
  }) {
    nilaiController.text = initialNilai;
    tanggalController.text = initialTanggal;
  }

  Future<void> updateAssessmentData({
    required VoidCallback? onSuccess,
    required VoidCallback? onError,
    required String nilai,
    required String nomor,
    required String tanggal,
  }) async {
    try {
      final String nilaiValue = nilai;
      final String tanggalValue = tanggal;

      // Tidak perlu mengubah nilai tanggal menjadi objek Tanggal
      await updateAssessment.updateAssessment(
        onSuccess: onSuccess,
        onError: onError,
        nilai: nilaiValue,
        nomor: nomor,
        tanggal: tanggalValue,
      );
    } catch (e) {
      print('Error in updateAssessmentData: $e');
      onError?.call();
    }
  }

  void clear() {
    nilaiController.clear();
    tanggalController.clear();
    notifyListeners();
  }
}
