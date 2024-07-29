import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../../constants/url.dart';
import '../../features/staff/daily_activity/services/daily_activity.dart';

class DailyActivityController extends ChangeNotifier {
  DailyActivityController(this.nip);

  var choosenDate;
  var dateNow;
  bool isLoading = false;
  String hasError = "";
  final String nip;
  dynamic detail;

  void setChoosenDate(date) {
    choosenDate = date;

    final year = int.parse(DateFormat('y').format(date));
    final month = int.parse(DateFormat('M').format(date));
    final day = int.parse(DateFormat('d').format(date));
    String dayString;
    if (day < 10) {
      dayString = day.toString().padLeft(2, '0');
    } else {
      dayString = day.toString();
    }
    dateNow = "$dayString-$month-$year";
    notifyListeners();

    getDetail();
  }

  void renderInitDate() {
    final DateTime now = DateTime.now();
    final year = int.parse(DateFormat('y').format(now));
    final month = int.parse(DateFormat('M').format(now));
    final day = int.parse(DateFormat('d').format(now));

    DateTime date = DateTime(year, month, day);
    choosenDate = date;
    notifyListeners();
  }

  void getDetailToday() {
    final DateTime now = DateTime.now();
    final year = int.parse(DateFormat('y').format(now));
    var month = int.parse(DateFormat('M').format(now));
    var day = int.parse(DateFormat('d').format(now));
    String dayString, monthString;
    if (day < 10 || month < 10) {
      dayString = day.toString().padLeft(2, '0');
      monthString = month.toString().padLeft(2, '0');
    } else {
      dayString = day.toString();
      monthString = month.toString();
    }
    dateNow = "$monthString-$dayString-$year";
    notifyListeners();

    getDetail();
  }

  void getDetail() async {
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "vmy_daily_activity",
      "data": ["*"],
      "filter": {"nip": nip, "tanggal_filter": dateNow}
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-api-key': apiKey
    };
    Uri uri = Uri.parse(url);
    try {
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(datas));
      final dailyActivity = dailyActivityFromJson(response.body);
      detail = dailyActivity;
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
