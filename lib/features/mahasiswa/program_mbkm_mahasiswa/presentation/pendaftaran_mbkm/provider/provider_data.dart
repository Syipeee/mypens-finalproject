import 'package:flutter/material.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/appstate.dart';

class FormDataProvider extends ChangeNotifier {
  String _mitra = '';
  String _posisi = '';
  String _urlInfo = '';

  String get mitra => _mitra;
  String get posisi => _posisi;
  String get urlInfo => _urlInfo;

  void setMitra(String value) {
    _mitra = value;
    notifyListeners();
  }

  void setPosisi(String value) {
    _posisi = value;
    notifyListeners();
  }

  void setUrlInfo(String value) {
    _urlInfo = value;
    notifyListeners();
  }
}
