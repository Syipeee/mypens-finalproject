import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/pendaftaran_mbkm/data/api_service.dart';
import 'dart:convert';

import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/pendaftaran_mbkm/model/pendaftar_dosen_model.dart';


class PendaftarDosenProvider extends ChangeNotifier {
  List<PendaftarDosen> _pendaftarDosens = [];
  bool _isLoading = false;

  List<PendaftarDosen> get pendaftars => _pendaftarDosens;
  bool get isLoading => _isLoading;
  

  Future<void> fetchPendaftar() async {
    _isLoading = true;
    var client = DosenApiClient();
    try {
      final response = await client.getPendaftarDosen();
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        _pendaftarDosens = (data['data'] as List).map((item) => PendaftarDosen.fromJson(item)).toList();
        _isLoading = false;
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error fetching data: $e");
      _isLoading = false;
      notifyListeners();
    }
  }

}
