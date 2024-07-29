import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_pendaftar.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/pendaftar_response.dart';
import 'package:provider/provider.dart' as provider;

class PendaftarProviders extends ChangeNotifier {
  final GetPendaftar getPendaftar;
  List<Pendaftar>? _pendaftars;

  PendaftarProviders({required this.getPendaftar});

  List<Pendaftar>? get pendaftars => _pendaftars;

  Future<void> getPendaftarData() async {
    try {
      final result = await getPendaftar.execute();
      _pendaftars = result;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  static PendaftarProviders of(BuildContext context, {required bool listen}) {
    return provider.Provider.of<PendaftarProviders>(context, listen: listen);
  }
}
