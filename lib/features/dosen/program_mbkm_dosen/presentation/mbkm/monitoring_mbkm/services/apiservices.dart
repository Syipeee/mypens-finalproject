import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mypens/constants/url.dart';

class VPendaftarLogbookServices {
  Future<Response> getVPendaftarLogbook(int idPembimbing) async {
    final requestBody = {
      "table": "vpendaftar",
      "data": ["*"],
      "filter": {
        "PEMBIMBING": idPembimbing,
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

class LogbookMonitoringServices {
  Future<Response> insertLogbookMonitoring(String pendaftar, String tanggalAwal,
      String tanggalAkhir, String catatan, String approval) async {
    final requestBody = {
      "table": "logbook_monitoring",
      "data": [
        {
          "PENDAFTAR": pendaftar,
          "TANGGAL_AWAL": tanggalAwal,
          "TANGGAL_AKHIR": tanggalAkhir,
          "CATATAN": catatan,
          "APPROVAL": approval,
        }
      ]
    };
    final headers = {
      "x-api-key": apiKey,
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    final response = await post(
      Uri.parse("${dynamicAPIPendaftaran}insert_pendaftaran_mbkm"),
      body: jsonEncode(requestBody),
      headers: headers,
    );

    print('Request Body: ${jsonEncode(requestBody)}');
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    return response;
  }
}

class LogbookPendaftarDosbimServices {
  Future<Response> getLogbookPendaftar(int idPembimbing) async {
    final requestBody = {
      "table": "logbook_pendaftar",
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
}

class LogbookPendaftarDokumenDosbimServices {
  Future<http.Response> getLogbookPendaftarDokumen(
      String logbookPendaftar) async {
    final requestBody = {
      "table": "logbook_pendaftar_dokumen",
      "data": ["*"],
      "filter": {
        "LOGBOOK_PENDAFTAR": logbookPendaftar,
      }
    };
    final headers = {
      "x-api-key": apiKey,
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    print('Request Body: $requestBody'); // Tambahkan print statement

    final response = await http.post(
      Uri.parse("${dynamicAPIPendaftaran}read_pendaftaran_mbkm"),
      body: jsonEncode(requestBody),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('Response body: ${response.body}'); // Tambahkan print statement
      return response;
    } else {
      print(
          'Failed to fetch logbook dokumen: ${response.statusCode}'); // Tambahkan print statement
      throw Exception('Failed to load logbook data');
    }
  }
}
