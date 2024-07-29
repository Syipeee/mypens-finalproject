import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mypens/constants/url.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/list_vkegiatan_response.dart';

abstract class ListVKegiatanResponseRemoteDataSource {
  Future<List<ListVKegiatanResponse>> getListVKegiatanResponse();
}

class ListVKegiatanResponseRemoteDataSourceImpl
    implements ListVKegiatanResponseRemoteDataSource {
  @override
  Future<List<ListVKegiatanResponse>> getListVKegiatanResponse() async {
    final requestBody = {
      "table": "vkegiatan",
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
      print('belly: $jsonResponse');
      final List<dynamic> responseData = jsonResponse['data'];
      print('supre: $responseData');
      return responseData
          .map((json) => ListVKegiatanResponse.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load list kegiatan');
    }
  }
}
