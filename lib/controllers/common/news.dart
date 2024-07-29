import 'package:flutter/material.dart';
import '../../../../constants/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../features/global/news/services/news.dart';

class PengumumanController extends ChangeNotifier {
  var pengumuman;
  bool isLoading = false;
  String hasError = "";

  void getPengumuman() async {
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "vmy_pengumuman",
      "data": ["*"]
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-api-key': apiKey
    };
    Uri uri = Uri.parse(url);
    try {
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(datas));
      final result = pengumumanFromJson(response.body);
      pengumuman = result;
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
