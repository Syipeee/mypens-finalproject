import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mypens/constants/url.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/insert_assessment_response.dart';

abstract class InsertAssessmentRemoteDataSource {
  Future<List<AssessmentData>> postInsertNilaiAssessment({
    String? kategoriAssessment,
    String? pendaftar,
    String? nilai,
    String? vmitra,
  });
}

// Remote Data Source
class InsertNilaiAssessmentRemoteDataSourceImpl
    implements InsertAssessmentRemoteDataSource {
  @override
  Future<List<AssessmentData>> postInsertNilaiAssessment({
    String? kategoriAssessment,
    String? pendaftar,
    String? nilai,
    String? vmitra,
  }) async {
    if (kategoriAssessment == null ||
        pendaftar == null ||
        nilai == null ||
        vmitra == null) {
      throw ArgumentError("Satu atau lebih parameter bernilai null");
    }

    try {
      final jsonData = {
        "table": "nilai_assesment",
        "data": [
          {
            "KATEGORI_ASSESMENT": kategoriAssessment,
            "PENDAFTAR": pendaftar,
            "NILAI": nilai,
            "VMITRA": vmitra
          }
        ]
      };

      final header = {
        "x-api-key": apiKey,
        HttpHeaders.contentTypeHeader: 'application/json'
      };

      final response = await post(
        Uri.parse("${jenisAssessment}insert_pendaftaran_mbkm"),
        body: jsonEncode(jsonData),
        headers: header,
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print('Respon JSON: $jsonResponse');

        if (jsonResponse['status'] == 'sukses') {
          final List<dynamic> responseData = jsonResponse['data'];
          final List<AssessmentData> assessments = responseData
              .map((data) => AssessmentData.fromJson(data))
              .toList();
          return assessments;
        } else {
          throw Exception(jsonResponse['deskripsi']);
        }
      } else {
        throw Exception('Gagal memasukkan nilai assessment');
      }
    } catch (e) {
      print('Error in postInsertNilaiAssessment: $e');
      rethrow;
    }
  }
}
