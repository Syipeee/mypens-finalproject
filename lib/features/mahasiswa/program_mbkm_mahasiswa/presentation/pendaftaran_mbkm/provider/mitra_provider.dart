import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/data/api/api_service.dart';
import 'dart:convert';

import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/mitra_model.dart';

class MitraProvider extends ChangeNotifier {
  List<Mitra> _mitra = [];

  List<Mitra> get mitra => _mitra;

  Future<void> fetchMitra() async {
    final response = await MitraApiClient().getMitra();
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['status'] == 'sukses') {
        final List<dynamic> mitraData = responseData['data'];
        _mitra = mitraData.map((json) => Mitra.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('failed to load mitra');
      }
    } else {
      throw Exception('Failed to load kegiatans');
    }
  }
}