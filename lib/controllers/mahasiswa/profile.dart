import 'package:flutter/material.dart';
import '../../constants/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../features/mahasiswa/profile/services/profile.dart';

class ProfileController extends ChangeNotifier {
  ProfileController(this.nrp);
  final int nrp;
  dynamic profile;

  void getCicilan() async {
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "vmy_cicilan",
      "data": ["*"],
      "filter": {"nrp": nrp}
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-api-key': apiKey
    };
    Uri uri = Uri.parse(url);
    try {
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(datas));
      final result = profileFromJson(response.body);
      final profileClean = profileCleanFromJson(jsonEncode(result));
      profile = profileClean;
      notifyListeners();
      // log(profile.data.length.toString());
    } catch (e) {
      print(e);
    }
  }
}
