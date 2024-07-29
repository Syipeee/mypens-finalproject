import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../constants/url.dart';
import '../../features/mahasiswa/revisi_sidang_kp/services/revisi_sidang_kp.dart';

class RevisiSidangKPController extends ChangeNotifier {
  RevisiSidangKPController(this.userId);
  final int userId;

  var revisiData;
  bool isLoading = false;
  String hasError = "";

  void getRevisiData() async {
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "vmy_revisi_kp",
      "data": ["*"],
      "filter": {"mahasiswa": "$userId"}
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-api-key': apiKey
    };
    Uri uri = Uri.parse(url);
    try {
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(datas));
      final revisiSidangKp = revisiSidangKpFromJson(response.body);
      final revisiSidangKpClean =
          revisiSidangKpCleanFromJson(jsonEncode(revisiSidangKp));
      revisiData = revisiSidangKpClean;
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
}
