import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_list_vkegiatan.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/list_vkegiatan_response.dart';

import 'package:provider/provider.dart' as provider;

class ListVKegiatanProviders extends ChangeNotifier {
  final GetListVKegiatanResponse getListVKegiatanResponse;

  List<ListVKegiatanResponse>? _listVKegiatanResponse;

  ListVKegiatanProviders({required this.getListVKegiatanResponse});

  List<ListVKegiatanResponse>? get listVKegiatanResponse =>
      _listVKegiatanResponse;

  Future<void> getListKegiatanResponseData() async {
    try {
      final result = await getListVKegiatanResponse.execute();
      _listVKegiatanResponse = result;
      print('kegiatan Response : $_listVKegiatanResponse');
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  static ListVKegiatanProviders of(BuildContext context,
      {required bool listen}) {
    return provider.Provider.of<ListVKegiatanProviders>(context,
        listen: listen);
  }
}
