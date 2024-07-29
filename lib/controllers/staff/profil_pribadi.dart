import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../../../../constants/url.dart';
import '../../features/staff/profil_pribadi/services/profil_pribadi.dart';

class ProfilPribadiController extends ChangeNotifier {
  ProfilPribadiController(this.nip);

  bool isLoading = false;
  String hasError = "";
  String nip;
  dynamic detail;

  void getDetail() async {
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "vmy_profile_pegawai",
      "data": ["*"],
      "filter": {"nip": nip}
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
      detail = profilPegawaiClean;
      hasError = "";
      notifyListeners();
    } catch (e) {
      hasError =
          "UHohh (⁠☉⁠｡⁠☉⁠)⁠!\n\nTelah terjadi masalah antara internet kamu atau server kami!\n\nCoba lagi beberapa saat, atau kontak eis@pens.ac.id";
      notifyListeners();
    }
  }
}
