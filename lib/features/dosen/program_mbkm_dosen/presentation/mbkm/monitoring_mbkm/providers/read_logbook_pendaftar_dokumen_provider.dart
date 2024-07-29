import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/models/read_logbook_pendaftar_dokumen_model.dart';
import 'dart:convert';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/services/apiservices.dart';

class LogbookPendaftarDokumenDosbimProvider extends ChangeNotifier {
  final LogbookPendaftarDokumenDosbimServices _services =
      LogbookPendaftarDokumenDosbimServices();
  List<LogbookPendaftarDokumen> _logbooks = [];

  List<LogbookPendaftarDokumen> get logbooks => _logbooks;

  Future<void> fetchLogbookPendaftarDokumen(String logbookPendaftar) async {
    print(
        'Fetching logbook dokumen with logbookPendaftar: $logbookPendaftar'); // Debug statement
    final response =
        await _services.getLogbookPendaftarDokumen(logbookPendaftar);
    print('Response status: ${response.statusCode}'); // Debug statement
    print('Response body: ${response.body}'); // Debug statement
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      print('Data from API: $data'); // Debug statement
      if (data is List) {
        _logbooks =
            data.map((item) => LogbookPendaftarDokumen.fromJson(item)).toList();
      } else {
        _logbooks = [];
      }
      print('Fetched logbook dokumen data: $_logbooks'); // Debug statement
      notifyListeners();
    } else {
      print(
          'Failed to fetch logbook dokumen: ${response.statusCode}'); // Debug statement untuk status kode yang gagal
    }
  }

  List<LogbookPendaftarDokumen> getLogbookDokumenByNomor(String nomor) {
    final filteredLogbooks = _logbooks
        .where((logbook) => logbook.logbookPendaftar == nomor)
        .toList();
    print(
        'Filtered logbooks for nomor $nomor: $filteredLogbooks'); // Debug statement
    return filteredLogbooks;
  }
}
