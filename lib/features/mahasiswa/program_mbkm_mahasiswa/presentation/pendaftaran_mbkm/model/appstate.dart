import 'package:flutter/material.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/model_form.dart';

class AppState extends ChangeNotifier {
  List<Kegiatan> _kegiatans = [];

  List<Kegiatan> get kegiatans => _kegiatans;

  void addKegiatan(Kegiatan kegiatan) {
    _kegiatans.add(kegiatan);
    notifyListeners();
  }
}