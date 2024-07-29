import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mypens/constants/url.dart';

class PendaftarApiClient {
  Future<Response> getPendaftar(int idMahasiswa) async {
    final requestBody = {
      "table": "pendaftar",
      "data": ["*"],
      "filter": {"mahasiswa": idMahasiswa}
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

  Future<Response> insertPendaftar(String mahasiswa, String kegiatan,
      String vmitra, String kegiatanPosisi, String urlInfoPosisi) async {
    final requestBody = {
      "table": "pendaftar",
      "data": [
        {
          "MAHASISWA": mahasiswa,
          "KEGIATAN": kegiatan,
          "VMITRA": vmitra,
          "KEGIATAN_POSISI": kegiatanPosisi,
          "URL_INFO_POSISI": urlInfoPosisi
          // "TANGGAL_AWAL": tglAwal,
          // "TANGGAL_AKHIR": tglAkhir
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

  Future<Response> updatePendaftar(
      String idMahasiswa, String pendaftar, String urlBuktiDiterima) async {
    final requestBody = {
      "table": "pendaftar",
      "data": {
        "URL_BUKTI_DITERIMA": urlBuktiDiterima,
      },
      "conditions": {
        "NOMOR": pendaftar,
        "MAHASISWA": idMahasiswa,
      },
      "operators": ["and"]
    };
    final headers = {
      "x-api-key": apiKey,
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    return post(
      Uri.parse("${dynamicAPIPendaftaran}update_pendaftaran_mbkm"),
      body: jsonEncode(requestBody),
      headers: headers,
    );
  }

  Future<Response> deletePendaftar(String nomor) async {
    final requestBody = {
      "table": "pendaftar",
      "conditions": {"nomor": nomor}
    };
    final headers = {
      "x-api-key": apiKey,
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    return post(
      Uri.parse("${dynamicAPIPendaftaran}delete_pendaftaran_mbkm"),
      body: jsonEncode(requestBody),
      headers: headers,
    );
  }
}

class KegiatanApiClient {
  Future<Response> getKegiatan() async {
    final requestBody = {
      "table": "kegiatan",
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

class KelompokKegiatanApiClient {
  Future<Response> getKelompokKegiatan() async {
    final requestBody = {
      "table": "kelompok_kegiatan",
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

class MitraApiClient {
  Future<Response> getMitra() async {
    final requestBody = {
      "table": "vmitra",
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

class KegiatanPosisiApiClient {
  Future<Response> getKegiatanPosisi() async {
    final requestBody = {
      "table": "kegiatan_posisi",
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
