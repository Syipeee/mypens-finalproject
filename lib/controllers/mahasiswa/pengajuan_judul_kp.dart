import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../constants/url.dart';
import '../../features/mahasiswa/pengajuan_judul_kp/services/pengajuan_judul_kp.dart';

class PengajuanJudulKpController extends ChangeNotifier {
  PengajuanJudulKpController(this.userNrp);
  final int userNrp;
  dynamic detail;
  String hasError = "";

  void getDetail() async {
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "vmy_pengajuan_judul_kp",
      "data": ["*"],
      "filter": {"nrp": userNrp}
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-api-key': apiKey
    };
    Uri uri = Uri.parse(url);
    try {
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(datas));
      final pengajuanJudulKp = pengajuanJudulKpFromJson(response.body);
      detail = pengajuanJudulKp;
      hasError = "";
      notifyListeners();
    } catch (e) {
      hasError =
          "UHohh (⁠☉⁠｡⁠☉⁠)⁠!\n\nTelah terjadi masalah antara internet kamu atau server kami!\n\nCoba lagi beberapa saat, atau kontak eis@pens.ac.id";
      notifyListeners();
    }
  }
}
