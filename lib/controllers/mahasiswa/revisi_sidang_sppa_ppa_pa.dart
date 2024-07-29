import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../constants/url.dart';
import '../../features/mahasiswa/revisi_sidang_sppa_ppa_pa/services/revisi_sidang_sppa_ppa_pa.dart';

class RevisiSppaPpaPaController extends ChangeNotifier {
  RevisiSppaPpaPaController(this.userId);
  final int userId;

  List<String> ujianId = [
    'Sidang Proposal PA',
    'Sidang Progress PA',
    'Sidang Evaluasi 1 PA',
    'Sidang Evaluasi 2 PA',
    'Sidang Evaluasi 3 PA'
  ];
  String selectedUjianId = 'Sidang Proposal PA';
  int ujianIdConverted = 1;

  bool isLoading = false;
  String hasError = "";
  var revisiData;

  void getRevisiData() async {
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "vmy_revisi_ta",
      "data": ["*"],
      "filter": {"mahasiswa": userId, "ujian": ujianIdConverted}
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-api-key': apiKey
    };
    Uri uri = Uri.parse(url);
    try {
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(datas));
      final revisiSppaPpaPa = revisiSppaPpaPaFromJson(response.body);
      final revisiSppaPpaPaClean =
          revisiSppaPpaPaCleanFromJson(jsonEncode(revisiSppaPpaPa));
      revisiData = revisiSppaPpaPaClean;
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

  void setSelectedUjianId(String s) {
    switch (s) {
      case 'Sidang Proposal PA':
        ujianIdConverted = 1;
        break;
      case 'Sidang Progress PA':
        ujianIdConverted = 3;
        break;
      case 'Sidang Evaluasi 1 PA':
        ujianIdConverted = 4;
        break;
      case 'Sidang Evaluasi 2 PA':
        ujianIdConverted = 5;
        break;
      case 'Sidang Evaluasi 3 PA':
        ujianIdConverted = 6;
        break;
    }
    selectedUjianId = s;
    notifyListeners();
  }
}
