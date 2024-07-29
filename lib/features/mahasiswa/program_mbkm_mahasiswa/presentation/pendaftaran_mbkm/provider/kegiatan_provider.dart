import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/kegiatan_model.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/data/api/api_service.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/kelompok_kegiatan_model.dart';

class KegiatanProvider extends ChangeNotifier {
  List<Kegiatan> _kegiatans = [];
  List<KelompokKegiatan> _kelompokKegiatans = [];
  bool _isLoading = false;

  final int idMahasiswa;
  KegiatanProvider({
    required this.idMahasiswa
  }) {
    print("IdMahasiswa = $idMahasiswa");
  }

  List<Kegiatan> get kegiatans => _kegiatans;
  List<KelompokKegiatan> get kelompokKegiatans => _kelompokKegiatans;
  bool get isLoading => _isLoading;

  Future<void> fetchKegiatans() async {
    _isLoading = true;

    try {
      final response = await KegiatanApiClient().getKegiatan();
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['status'] == 'sukses') {
          final List<dynamic> kegiatanData = responseData['data'];
          _kegiatans = kegiatanData.map((json) => Kegiatan.fromJson(json)).toList();
          _isLoading = false;
          notifyListeners();
        } else {
          throw Exception('Failed to load kegiatans');
        }
      } else {
        _isLoading = false;
        throw Exception('Failed to load kegiatans');
      }
    } catch (error) {
      _isLoading = false;
      throw Exception('Failed to load kegiatans: $error');
    }
  }

  Future<void> fetchKelompokKegiatans() async {
    _isLoading = true;

    try {
      final response = await KelompokKegiatanApiClient().getKelompokKegiatan();
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['status'] == 'sukses') {
          final List<dynamic> kelompokKegiatanData = responseData['data'];
          _kelompokKegiatans = kelompokKegiatanData.map((json) => KelompokKegiatan.fromJson(json)).toList();
          _isLoading = false;
          notifyListeners();
        } else {
          _isLoading = false;
          throw Exception('Failed to load kegiatans');
        }
      } else {
        _isLoading = false;
        throw Exception('Failed to load kegiatans');
      }
    } catch (error) {
      _isLoading = false;
      throw Exception('Failed to load kegiatans: $error');
    }
  }
}