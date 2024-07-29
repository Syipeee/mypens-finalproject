import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/data/api/api_service.dart';
import 'dart:convert';

import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/kegiatan_posisi_model.dart';

class KegiatanPosisiProvider extends ChangeNotifier {
  List<KegiatanPosisi> _kegiatanPosisi = [];

  List<KegiatanPosisi> get kegiatanPosisi => _kegiatanPosisi;

  Future<void> fetchKegiatanPosisi() async {
    try {
      final response = await KegiatanPosisiApiClient().getKegiatanPosisi();
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['status'] == 'sukses') {
          final List<dynamic> kegiatanPosisiData = responseData['data'];
          _kegiatanPosisi = kegiatanPosisiData.map((json) => KegiatanPosisi.fromJson(json)).toList();
          notifyListeners();
        } else {
          throw Exception('Failed to load posisi: ${responseData['message']}');
        }
      } else {
        throw Exception('Failed to fetch data with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching posisi data: $e');
      throw e;
    }
  }

}