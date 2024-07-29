import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mypens/constants/url.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/read_vassessment_response.dart';

abstract class VReadAssessmentRemoteDataSource {
  Future<List<VReadAssessmentData>> getVReadAssessment();
}

class VReadNilaiAssessmentRemoteDataSourceImpl
    implements VReadAssessmentRemoteDataSource {
  @override
  Future<List<VReadAssessmentData>> getVReadAssessment() async {
    final requestBody = {
      "table": "vnilai_assesment",
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
          .map((json) => VReadAssessmentData.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load Kategori assessment');
    }
  }
}
