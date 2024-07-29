import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../constants/url.dart';
import '../../features/mahasiswa/profil_dosen/services/profil_dosen.dart';

class Dosen {
  final String nip;
  final String nidn;
  final String nama;
  final String golakhir;
  final String jabatanFungsional;
  final String jenis;
  final String telp;
  Dosen({
    required this.nip,
    required this.nidn,
    required this.nama,
    required this.golakhir,
    required this.jabatanFungsional,
    required this.jenis,
    required this.telp,
  });
}

class ProfilDosenController extends ChangeNotifier {
  List<Dosen> profilDosenList = [];
  List<Dosen> searched = [];
  bool isLoading = false;
  String hasError = "";

  void getListProfilDosen() async {
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "vmy_profile_dosen",
      "data": ["*"],
      "limit": 2000
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-api-key': apiKey
    };
    Uri uri = Uri.parse(url);
    try {
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(datas));
      final profilDosen = profilDosenFromJson(response.body);
      final profilDosenClean =
          profilDosenCleanFromJson(jsonEncode(profilDosen));

      for (var element in profilDosenClean.data) {
        var fullname =
            "${element.gelarDpn == 'Kosong' ? '' : element.gelarDpn} ${element.nama} ${element.gelarBlk == 'Kosong' ? '' : element.gelarBlk}";
        profilDosenList.add(Dosen(
            nip: element.nip,
            nidn: element.nidn,
            nama: fullname.trim(),
            golakhir: element.golakhir,
            jabatanFungsional: element.jabatanFungsional,
            jenis: element.jenis,
            telp: element.telp));
      }
      searched = profilDosenList;

      hasError = "";
      isLoading = false;
      notifyListeners();
    } catch (e) {
      hasError =
          "UHohh (⁠☉⁠｡⁠☉⁠)⁠!\n\nTelah terjadi masalah antara internet kamu atau server kami!\n\nCoba lagi beberapa saat, atau kontak eis@pens.ac.id";
      isLoading = false;
      notifyListeners();
    }
  }

  onSearch(String query) {
    searched = profilDosenList;
    searched =
        searched.where((element) => element.nama.contains(query)).toList();
    notifyListeners();
  }
}
