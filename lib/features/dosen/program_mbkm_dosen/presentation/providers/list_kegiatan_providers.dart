import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_list_kegiatan.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/list_kegiatan_response.dart';

import 'package:provider/provider.dart' as provider;

class ListKegiatanProviders extends ChangeNotifier {
  final GetListKegiatanResponse getListKegiatanResponse;

  List<ListKegiatanResponse>? _listKegiatanResponse;

  ListKegiatanProviders({required this.getListKegiatanResponse});

  List<ListKegiatanResponse>? get listKegiatanResponse => _listKegiatanResponse;

  Future<void> getListKegiatanResponseData() async {
    try {
      final result = await getListKegiatanResponse.execute();
      _listKegiatanResponse = result;
      // print('kegiatan Response : $_listKegiatanResponse');
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  static ListKegiatanProviders of(BuildContext context,
      {required bool listen}) {
    return provider.Provider.of<ListKegiatanProviders>(context, listen: listen);
  }
}
