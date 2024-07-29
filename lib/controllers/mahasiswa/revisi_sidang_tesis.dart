import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../constants/url.dart';
import '../../features/mahasiswa/revisi_sidang_tesis/services/revisi_sidang_tesis.dart';

class RevisiSidangTesisController extends ChangeNotifier {
  RevisiSidangTesisController(this.userId);
  final int userId;

  List<String> ujianId = [
    'Sidang Proposal Tesis',
    'Sidang Progres Tesis 1',
    'Sidang Progres Tesis 2',
    'Sidang Tesis Akhir'
  ];
  String selectedUjianId = 'Sidang Proposal Tesis';
  int ujianIdConverted = 1;

  bool isLoading = false;
  String hasError = "";
  var revisiData;

  void getRevisiData() async {
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "vmy_revisi_tesis",
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
      final revisiSidangTesis = revisiSidangTesisFromJson(response.body);
      final revisiSidangTesisClean =
          revisiSidangTesisCleanFromJson(jsonEncode(revisiSidangTesis));
      revisiData = revisiSidangTesisClean;
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
      case 'Sidang Proposal Tesis':
        ujianIdConverted = 1;
        break;
      case 'Sidang Progres Tesis 1':
        ujianIdConverted = 3;
        break;
      case 'Sidang Progres Tesis 2':
        ujianIdConverted = 4;
        break;
      case 'Sidang Tesis Akhir':
        ujianIdConverted = 2;
        break;
    }
    selectedUjianId = s;
    notifyListeners();
  }
}
