import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/models/read_vpendaftar_model.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/services/apiservices.dart';

class VPendaftarLogbookProvider extends ChangeNotifier {
  List<VPendaftarLogbook> _pendaftarLogbooks = [];
  bool _isLoading = false;
  String? _lastFetchedNomor;

  String? get lastFetchedNomor => _lastFetchedNomor;

  List<VPendaftarLogbook> get vpendaftar => _pendaftarLogbooks;
  bool get isLoading => _isLoading;

  final int idPembimbing;

  VPendaftarLogbookProvider({
    required this.idPembimbing,
  }) {
    print("IdPembimbing = $idPembimbing");
  }

  Future<void> fetchVPendaftarLogbook(int idPembimbing) async {
    _isLoading = true;
    var client = VPendaftarLogbookServices();
    try {
      final response = await client.getVPendaftarLogbook(idPembimbing);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('tttt$data');
        var vPendaftarList = (data['data'] as List)
            .map((item) => VPendaftarLogbook.fromJson(item))
            .toList();
        _pendaftarLogbooks = vPendaftarList;
        if (_pendaftarLogbooks.isNotEmpty) {
          _lastFetchedNomor = _pendaftarLogbooks.first.nomor;
        }
      } else {
        throw Exception('Gagal memuat data: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
