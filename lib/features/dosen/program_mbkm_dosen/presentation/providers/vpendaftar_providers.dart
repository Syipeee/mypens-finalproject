import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_vpendaftar.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/vpendaftar_response.dart';
import 'package:provider/provider.dart' as provider;

class VpendaftarProviders extends ChangeNotifier {
  final GetVpendaftar getVpendaftar;
  List<Vpendaftar>? _vpendaftars;
  final int nomorDosen;

  VpendaftarProviders({
    required this.getVpendaftar,
    required this.nomorDosen,
  });

  List<Vpendaftar>? get vpendaftars => _vpendaftars;

  Future<void> getVpendaftarData() async {
    try {
      final result = await getVpendaftar.execute(nomorDosen: nomorDosen);
      _vpendaftars = result;
      print('Response Supre: ${jsonEncode(result)}');

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  static VpendaftarProviders of(BuildContext context, {required bool listen}) {
    return provider.Provider.of<VpendaftarProviders>(context, listen: listen);
  }
}
