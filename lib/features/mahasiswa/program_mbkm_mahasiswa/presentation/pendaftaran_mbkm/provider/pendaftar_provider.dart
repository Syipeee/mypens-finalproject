import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/data/api/api_service.dart';
import 'dart:convert';

import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/pendaftar_model.dart';


class PendaftarProvider extends ChangeNotifier {
  List<Pendaftar> _pendaftars = [];
  bool _isLoading = false;

  List<Pendaftar> get pendaftars => _pendaftars;
  bool get isLoading => _isLoading;

  final int idMahasiswa;

  PendaftarProvider({required this.idMahasiswa}) {
    fetchPendaftar(idMahasiswa);
    print ("id mahasiswa pendaftar = $idMahasiswa");
  }

  Future<void> fetchPendaftar(int idMahasiswa) async {
    _isLoading = true;
    var client = PendaftarApiClient();
    try {
      final response = await client.getPendaftar(idMahasiswa);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        _pendaftars = (data['data'] as List).map((item) => Pendaftar.fromJson(item)).toList();
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
