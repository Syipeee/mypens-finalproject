import 'dart:ui';

import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/insert_nilai_assessment_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/kategori_assessment_response.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/insert_assessment_response.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/pendaftar_response.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/vmitra_response.dart';

class PostInsertAssessment {
  final InsertAssessmentRepository repository;

  PostInsertAssessment(this.repository);

  Future<List<AssessmentData>> postInsertNilaiAssessmentData({
    VoidCallback? onSuccess,
    VoidCallback? onError,
    required KategoriAssessment? kategoriAssessment,
    required Pendaftar? pendaftar,
    required Vmitra? vmitra,
    required String nilai,
  }) async {
    try {
      final List<AssessmentData> result =
          await repository.postInsertNilaiAssessment(
        kategoriAssessment: kategoriAssessment?.nomor,
        pendaftar: pendaftar?.nomor,
        nilai: nilai,
        vmitra: vmitra?.nomor,
      );

      // Menambahkan pengecekan status response
      if (result.isNotEmpty && result.first.status == 'sukses') {
        onSuccess?.call();
      } else {
        onError?.call();
      }
      return result;
    } catch (e) {
      print('Error in postInsertNilaiAssessmentData: $e');
      rethrow;
    }
  }
}
