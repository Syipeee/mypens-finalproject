import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mypens/constants/url.dart';

class LogbookPendaftarService {
  Future<Response> insertLogbookPendaftar(String pendaftar, String namakegiatan,
      String latitude, String longitude) async {
    final requestBody = {
      "table": "logbook_pendaftar",
      "data": [
        {
          "PENDAFTAR": pendaftar,
          "NAMA_KEGIATAN": namakegiatan,
          "LATITUDE": latitude,
          "LONGITUDE": longitude,
        }
      ]
    };
    final headers = {
      "x-api-key": apiKey,
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    return post(
      Uri.parse("${dynamicAPIPendaftaran}insert_pendaftaran_mbkm"),
      body: jsonEncode(requestBody),
      headers: headers,
    );
  }
}

class PendaftarLogbookClient {
  Future<Response> getPendaftarLogbook(int idMahasiswa) async {
    final requestBody = {
      "table": "pendaftar",
      "data": ["*"],
      "filter": {
        "mahasiswa": idMahasiswa,
        "status_diterima": "1",
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
  Future<Response> getLogbookMonitoring(
      String tanggalAwal, String tanggalAkhir, String pendaftar) async {
    final requestBody = {
      "table": "logbook_monitoring",
      "data": ["*"],
      "filter": {
        "tanggal_awal": tanggalAwal,
        "tanggal_akhir": tanggalAkhir,
        "PENDAFTAR": pendaftar,
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

class LogbookPendaftarDokumenService {
  Future<Response> insertLogbookPendaftarDokumen(
      String noLogbook, String urlDokumen) async {
    final requestBody = {
      "table": "logbook_pendaftar_dokumen",
      "data": [
        {"LOGBOOK_PENDAFTAR": noLogbook, "URL": urlDokumen}
      ]
    };
    final headers = {
      "x-api-key": apiKey,
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    return post(
      Uri.parse("${dynamicAPIPendaftaran}insert_pendaftaran_mbkm"),
      body: jsonEncode(requestBody),
      headers: headers,
    );
  }
}

class LogbookPendaftarDokumentasiService {
  Future<Response> insertLogbookPendaftarDokumentasi(
      String noLogbook, String urlDokumentasi) async {
    final requestBody = {
      "table": "logbook_pendaftar_dokumen",
      "data": [
        {"LOGBOOK_PENDAFTAR": noLogbook, "URL": urlDokumentasi}
      ]
    };
    final headers = {
      "x-api-key": apiKey,
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    return post(
      Uri.parse("${dynamicAPIPendaftaran}insert_pendaftaran_mbkm"),
      body: jsonEncode(requestBody),
      headers: headers,
    );
  }
}

class LogbookPendaftar {
  Future<Response> getLogbookPendaftar(int idMahasiswa) async {
    final requestBody = {
      "table": "Logbook_pendaftar",
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
