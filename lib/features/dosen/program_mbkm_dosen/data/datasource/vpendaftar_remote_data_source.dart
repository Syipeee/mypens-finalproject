import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mypens/constants/url.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/vpendaftar_response.dart';

abstract class VpendaftarRemoteDataSource {
  Future<List<Vpendaftar>> getVpendaftar({required int nomorDosen});
}

class VpendaftarRemoteDataSourceImpl implements VpendaftarRemoteDataSource {
  @override
  Future<List<Vpendaftar>> getVpendaftar({required int nomorDosen}) async {
    final requestBody = {
      "table": "vpendaftar",
      "data": ["*"],
      "filter": {
        "PEMBIMBING": nomorDosen,
      }
    };
    print(requestBody);
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
      return responseData.map((json) => Vpendaftar.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Vpendaftar ');
    }
  }
}
