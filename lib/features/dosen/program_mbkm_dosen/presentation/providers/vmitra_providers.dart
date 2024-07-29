import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_vmitra.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/vmitra_response.dart';
import 'package:provider/provider.dart' as provider;

class VmitraProviders extends ChangeNotifier {
  final GetVmitra getVmitra;
  List<Vmitra>? _vmitras;

  VmitraProviders({required this.getVmitra});

  List<Vmitra>? get vmitras => _vmitras;

  Future<void> getVmitraData() async {
    try {
      final result = await getVmitra.execute();
      _vmitras = result;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  static VmitraProviders of(BuildContext context, {required bool listen}) {
    return provider.Provider.of<VmitraProviders>(context, listen: listen);
  }
}
