import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../constants/url.dart';
import '../../features/staff/profil_pegawai/services/profil_pegawai.dart';

class Dosen {
  String nip;
  String nidn;
  String nama;
  String golakhir;
  String jabatanFungsional;
  String staff;
  String alamat;
  String telp;
  Dosen(
      {required this.nip,
      required this.nidn,
      required this.nama,
      required this.golakhir,
      required this.jabatanFungsional,
      required this.staff,
      required this.alamat,
      required this.telp});
}

class ProfilPegawaiController extends ChangeNotifier {
  bool isLoading = false;
  String hasError = "";

  List<Dosen> profilDosenList = [];
  List<Dosen> searched = [];

  void getListProfilPegawai() async {
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "vmy_profile_pegawai",
      "data": ["*"],
      "limit": 5000
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-api-key': apiKey
    };
    Uri uri = Uri.parse(url);
    try {
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(datas));
      final profilPegawai = profilPegawaiFromJson(response.body);
      final profilPegawaiClean =
          profilPegawaiCleanFromJson(jsonEncode(profilPegawai));

      for (var element in profilPegawaiClean.data) {
        var fullname =
            "${element.gelarDpn == '-' ? '' : element.gelarDpn} ${element.nama} ${element.gelarBlk == '-' ? '' : element.gelarBlk}";
        profilDosenList.add(Dosen(
            nip: element.nip,
            nidn: element.nidn,
            nama: fullname.trim(),
            golakhir: element.golakhir,
            jabatanFungsional: element.jabatanFungsional,
            staff: element.staff,
            alamat: element.alamat,
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
    }
  }

  onSearch(String query) {
    searched = profilDosenList;
    searched =
        searched.where((element) => element.nama.contains(query)).toList();
    notifyListeners();
  }
}
