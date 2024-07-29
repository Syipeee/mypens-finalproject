import 'package:flutter/material.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/services/apiservices.dart';
import 'dart:convert';

import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/pendaftar_model.dart';

class PendaftarLogbookProvider extends ChangeNotifier {
  List<Pendaftar> _pendaftarLogbooks = [];
  bool _isLoading = false;
  String? _lastFetchedNomor;

  String? get lastFetchedNomor => _lastFetchedNomor;

  List<Pendaftar> get pendaftars => _pendaftarLogbooks;
  bool get isLoading => _isLoading;

  Future<void> fetchPendaftarLogbook(int idMahasiswa,
      Function(DateTime startDate, DateTime endDate) onDatesReceived) async {
    _isLoading = true;
    var client = PendaftarLogbookClient();
    try {
      final response = await client.getPendaftarLogbook(idMahasiswa);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        var pendaftarList = (data['data'] as List)
            .map((item) => Pendaftar.fromJson(item))
            .toList();
        if (pendaftarList.isNotEmpty) {
          _lastFetchedNomor = pendaftarList.first.nomor;
          DateTime startDate = _parseDate(pendaftarList.first.tanggalAwal);
          DateTime endDate = _parseDate(pendaftarList.first.tanggalAkhir);
          onDatesReceived(startDate, endDate);
        }
        _pendaftarLogbooks = pendaftarList;
        print('Ini respon provider pendaftar: $_pendaftarLogbooks');
        notifyListeners(); // Perpindahan notifyListeners ke luar dari if-else
      } else {
        throw Exception('Gagal memuat data: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching data: $e");
      _isLoading = false;
      notifyListeners();
    }
  }

  DateTime _parseDate(String dateStr) {
    try {
      List<String> parts = dateStr.split('-');
      int day = int.parse(parts[0]);
      int month = _parseMonth(parts[1]);
      int year = 2000 + int.parse(parts[2]); // Asumsi '24' adalah '2024'
      return DateTime(year, month, day);
    } catch (e) {
      print("Error parsing date: $e");
      return DateTime.now(); // Kembalikan tanggal saat ini jika parsing gagal
    }
  }

  int _parseMonth(String monthStr) {
    switch (monthStr.toUpperCase()) {
      case 'JAN':
        return DateTime.january;
      case 'FEB':
        return DateTime.february;
      case 'MAR':
        return DateTime.march;
      case 'APR':
        return DateTime.april;
      case 'MAY':
        return DateTime.may;
      case 'JUN':
        return DateTime.june;
      case 'JUL':
        return DateTime.july;
      case 'AUG':
        return DateTime.august;
      case 'SEP':
        return DateTime.september;
      case 'OCT':
        return DateTime.october;
      case 'NOV':
        return DateTime.november;
      case 'DEC':
        return DateTime.december;
      default:
        throw Exception('Bulan tidak valid: $monthStr');
    }
  }
}
