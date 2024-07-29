import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/model/read_logbook_pendaftar_model.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/services/apiservices.dart';

class LogbookPendaftarProvider extends ChangeNotifier {
  LogbookPendaftar logbookPendaftar = LogbookPendaftar();
  LogbookPendaftarModel? _latestLogbook;

  LogbookPendaftarModel? get latestLogbook => _latestLogbook;

  Future<void> fetchLatestLogbook(int idMahasiswa) async {
    try {
      final response = await logbookPendaftar.getLogbookPendaftar(idMahasiswa);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final List logbooks = responseData['data'];
        if (logbooks.isNotEmpty) {
          _latestLogbook = LogbookPendaftarModel.fromJson(logbooks.last);
        }
      }
      notifyListeners();
    } catch (e) {
      print('Gagal mendapatkan logbook: $e');
    }
  }
}
