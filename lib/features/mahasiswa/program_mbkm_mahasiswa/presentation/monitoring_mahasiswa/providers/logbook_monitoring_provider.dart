import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/model/read_logbook_monitoring_model.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/services/apiservices.dart';
import 'dart:convert';

class LogbookMonitoringProvider extends ChangeNotifier {
  List<LogbookMonitoring> _logbookMonitorings = [];
  bool _isLoading = false;

  List<LogbookMonitoring> get logbookMonitorings => _logbookMonitorings;
  bool get isLoading => _isLoading;

  Future<void> fetchLogbookMonitoring(
      String tanggalAwal, String tanggalAkhir, String pendaftar) async {
    _isLoading = true;
    notifyListeners();

    var client = LogbookMonitoringServices();
    try {
      final response = await client.getLogbookMonitoring(
          tanggalAwal, tanggalAkhir, pendaftar);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        _logbookMonitorings = (data['data'] as List)
            .map((item) => LogbookMonitoring.fromJson(item))
            .toList();
        print('ini dari provider broo : $_logbookMonitorings');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String getPembimbingApprovalText() {
    for (var item in _logbookMonitorings) {
      if (item.vmitra == "") {
        return item.approval == "1" ? 'Approved' : 'Not Approve';
      }
    }
    return 'Not Approve';
  }

  String getPembimbingCatatan() {
    for (var item in _logbookMonitorings) {
      if (item.vmitra == "") {
        return item.catatan.isNotEmpty
            ? item.catatan
            : 'Catatan pembimbing tidak tersedia';
      }
    }
    return 'Catatan pembimbing tidak tersedia';
  }

  String getMitraApprovalText() {
    for (var item in _logbookMonitorings) {
      if (item.vmitra.isNotEmpty) {
        return item.approval == "1" ? 'Approved' : 'Not Approve';
      }
    }
    return 'Not Approve';
  }

  String getMitraCatatan() {
    for (var item in _logbookMonitorings) {
      if (item.vmitra.isNotEmpty) {
        return item.catatan.isNotEmpty
            ? item.catatan
            : 'Catatan mitra tidak tersedia';
      }
    }
    return 'Catatan mitra tidak tersedia';
  }
}
