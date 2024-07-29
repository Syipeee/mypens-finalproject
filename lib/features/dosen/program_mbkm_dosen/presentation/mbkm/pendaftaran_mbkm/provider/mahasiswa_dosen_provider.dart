import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/pendaftaran_mbkm/data/api_service.dart';
import 'dart:convert';

import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/pendaftaran_mbkm/model/mahasiswa_dosen_model.dart';


class MahasiswaByIdDosenProvider extends ChangeNotifier {
  List<MahasiswaByIdDosen> _mahasiswaByIdDosen = [];
  bool _isLoading = false;

  List<MahasiswaByIdDosen> get mahasiswas => _mahasiswaByIdDosen;
  bool get isLoading => _isLoading;

  final int idDosen;

  MahasiswaByIdDosenProvider({required this.idDosen}) {
    fetchMahasiswaByIdDosen(idDosen);
    print ("id mahasiswa pendaftar = $idDosen");
  }

  Future<void> fetchMahasiswaByIdDosen(int idMahasiswa) async {
    _isLoading = true;
    var client = DosenApiClient();
    try {
      final response = await client.getMahasiswaByIdDosen(idDosen);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        _mahasiswaByIdDosen = (data['data'] as List).map((item) => MahasiswaByIdDosen.fromJson(item)).toList();
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
