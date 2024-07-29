import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/post_assessment.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/kategori_assessment_response.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/pendaftar_response.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/vmitra_response.dart';

class InsertAssessmentProviders extends ChangeNotifier {
  final PostInsertAssessment postInsertNilaiAssessment;

  InsertAssessmentProviders({required this.postInsertNilaiAssessment});

  final nilaiController = TextEditingController();
  Future<void> postInsertNilaiAssessmentData({
    VoidCallback? onSuccess,
    VoidCallback? onError,
    required KategoriAssessment? kategoriAssessment,
    required Pendaftar? pendaftar,
    required Vmitra? vmitra,
    required String nilai,
  }) async {
    try {
      final result =
          await postInsertNilaiAssessment.postInsertNilaiAssessmentData(
        kategoriAssessment: kategoriAssessment,
        pendaftar: pendaftar,
        vmitra: vmitra,
        nilai: nilai,
      );
      if (result.isNotEmpty) {
        if (result.first.status == 'sukses') {
          print('Data berhasil diinput');
          onSuccess?.call();
        } else {
          print('Data gagal diinput');
          onError?.call();
        }
      } else {
        print('Data gagal diinput');
        onError?.call();
      }
    } catch (e) {
      print('Error in postInsertNilaiAssessmentData: $e');
      onError?.call();
    }
  }

  void clear() {
    nilaiController.clear();
    notifyListeners();
  }
}
