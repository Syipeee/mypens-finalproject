import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mypens/constants/url.dart';

class DosenApiClient {

  Future<Response> getMahasiswaByIdDosen(int idDosenWali) async {
    final requestBody = {
      "table": "vmahasiswa",
      "data": ["*"],
      "filter": {
        "DOSEN_WALI": idDosenWali,
        "STATUS": "A"
      },
      "limit": 100
    };
    final headers = {
      "x-api-key": apiKey,
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    return post(
      Uri.parse("${dynamicAPIPendaftaran}read_pendaftaran_mbkm"),
      body: jsonEncode(requestBody),
      headers: headers,
    );
  }

  Future<Response> getPendaftarDosen() async {
    final requestBody = {
      "table": "pendaftar",
      "data": ["*"]
    };
    final headers = {
      "x-api-key": apiKey,
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    return post(
      Uri.parse("${dynamicAPIPendaftaran}read_pendaftaran_mbkm"),
      body: jsonEncode(requestBody),
      headers: headers,
    );
  }
  Future<Response> getVPendaftarDosen(int idDosenWali) async {
    final requestBody = {
      "table": "vpendaftar",
      "data": ["*"],
      "filter": {
        "NOMOR_DOSEN_WALI": idDosenWali,
      }
    };
    final headers = {
      "x-api-key": apiKey,
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    return post(
      Uri.parse("${dynamicAPIPendaftaran}read_pendaftaran_mbkm"),
      body: jsonEncode(requestBody),
      headers: headers,
    );
  }
}