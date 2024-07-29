import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mypens/constants/url.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/kategori_assessment_response.dart';

abstract class KategoriAssessmentRemoteDataSource {
  Future<List<KategoriAssessment>> getKategoriAssessment();
}

class KategoriAssessmentRemoteDataSourceImpl
    implements KategoriAssessmentRemoteDataSource {
  @override
  Future<List<KategoriAssessment>> getKategoriAssessment() async {
    final requestBody = {
      "table": "kategori_assesment",
      "data": ["*"],
    };
    final header = {
      "x-api-key": apiKey,
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    final response = await post(
      Uri.parse("${jenisAssessment}read_pendaftaran_mbkm"),
      body: jsonEncode(requestBody),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print('JSON Response: $jsonResponse');
      final List<dynamic> responseData = jsonResponse['data'];
      // print('Response Data: $responseData');
      return responseData
          .map((json) => KategoriAssessment.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load Kategori assessment');
    }
  }
}
