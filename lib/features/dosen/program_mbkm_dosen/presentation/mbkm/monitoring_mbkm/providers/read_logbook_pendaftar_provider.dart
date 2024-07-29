import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/models/read_logbook_pendaftar_model.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/services/apiservices.dart';

class LogbookPendaftarDosbimProvider extends ChangeNotifier {
  List<LogbookPendaftar> _logbookPendaftar = [];
  bool _isLoading = false;

  List<LogbookPendaftar> get logbookPendaftar => _logbookPendaftar;
  bool get isLoading => _isLoading;

  Future<void> fetchLogbookPendaftar(int idPembimbing) async {
    _isLoading = true;
    notifyListeners();

    LogbookPendaftarDosbimServices service = LogbookPendaftarDosbimServices();
    try {
      final response = await service.getLogbookPendaftar(idPembimbing);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('Data from API: $data'); // Tambahkan print statement
        var logbookList = (data['data'] as List)
            .map((item) => LogbookPendaftar.fromJson(item))
            .toList();
        _logbookPendaftar = logbookList;
      } else {
        throw Exception('Failed to load logbook data');
      }
    } catch (e) {
      print('Error fetching logbook data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  LogbookPendaftar? getLogbookByDate(String date, String idPendaftar) {
    try {
      print(
          'Looking for logbook with date: $date and idPendaftar: $idPendaftar'); // Tambahkan print statement
      DateTime parsedDate = DateFormat('dd MMM yyyy').parse(date);
      String formattedDate =
          DateFormat('dd-MMM-yy').format(parsedDate).toUpperCase();
      print('Formatted Date: $formattedDate'); // Tambahkan print statement

      var logbook = _logbookPendaftar.firstWhere(
        (log) => log.tanggal == formattedDate && log.pendaftar == idPendaftar,
        orElse: () => LogbookPendaftar(
          nomor: '',
          pendaftar: '',
          tanggal: '',
          namaKegiatan: '',
          latitude: '',
          longitude: '',
        ),
      );
      print('Found logbook: $logbook'); // Tambahkan print statement
      return logbook;
    } catch (e) {
      print('Error finding logbook by date: $e');
      return null;
    }
  }
}
