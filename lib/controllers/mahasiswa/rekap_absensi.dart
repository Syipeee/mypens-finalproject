import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mypens/features/mahasiswa/rekap_absen/services/absen.dart';
import '../../../../constants/url.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class RekapAbsensiController extends ChangeNotifier {
  final int userId;

  RekapAbsensiController(this.userId);
  bool isLoading = false;
  String hasError = "";
  RekapAbsensi? absensi;

  List<String> totalMataKuliah = [];

  List<String> yearList = [];
  List<String> semesterList = [
    'Ganjil',
    'Genap',
    'Semester Antara Ganjil',
    'Semester Antara Genap'
  ];
  String selectedYear = '';
  String selectedSemester = '';

  void generateYearList() {
    yearList = [];

    var startDate = 2019;
    final DateTime now = DateTime.now();
    final year = int.parse(DateFormat('y').format(now));
    var range = int.parse(year.toString().substring(2, 4)) +
        2 -
        int.parse(startDate.toString().substring(2, 4));
    for (var i = 0; i < range; i++) {
      var constructYear =
          "${startDate.toString()}/${(startDate + 1).toString()}";
      yearList.add(constructYear);
      startDate++;
    }

    getYearAndSemester();
  }

  int getSemesterId() {
    int result = 0;

    switch (selectedSemester) {
      case 'Ganjil':
        result = 1;
        break;
      case 'Genap':
        result = 2;
        break;
      case 'Semester Antara Ganjil':
        result = 3;
        break;
      case 'Semester Antara Genap':
        result = 4;
        break;
    }

    return result;
  }

  void getTotalMataKuliah() {
    for (var element in absensi!.data) {
      totalMataKuliah.add(element.matakuliah);
    }
    totalMataKuliah = totalMataKuliah.toSet().toList();
  }

  void getRekapAbsensi() async {
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "vmy_absensi_kuliah",
      "data": ["*"],
      "filter": {
        "mahasiswa": userId,
        "tahun": int.parse(selectedYear.substring(0, 4)),
        "semester": getSemesterId()
      },
      "limit": 1000
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-api-key': apiKey
    };
    Uri uri = Uri.parse(url);
    try {
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(datas));
      final rekapAbsensi = rekapAbsensiFromJson(response.body);
      absensi = rekapAbsensi;
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

  void getYearAndSemester() {
    final DateTime now = DateTime.now();
    final month = int.parse(DateFormat('M').format(now));
    final year = int.parse(DateFormat('y').format(now));
    if (month > 7 || month < 2) {
      if (month < 2) {
        selectedYear = '${(year - 1).toString()}/${year.toString()}';
        selectedSemester = "Ganjil";
      } else {
        selectedYear = '${year.toString()}/${(year + 1).toString()}';
        selectedSemester = "Ganjil";
      }
    } else {
      selectedYear = '${(year - 1).toString()}/${year.toString()}';
      selectedSemester = "Genap";
    }
    notifyListeners();
    getRekapAbsensi();
  }

  void setSelectedYear(String s) {
    selectedYear = s;
    notifyListeners();
  }

  void setSelectedSemester(String s) {
    selectedSemester = s;
    notifyListeners();
  }
}
