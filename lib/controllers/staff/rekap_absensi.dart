import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../constants/url.dart';
import '../../features/staff/rekap_absensi/services/rekap_absensi.dart';

class StaffRekapAbsensiController extends ChangeNotifier {
  StaffRekapAbsensiController(this.pegawaiId);

  bool isLoading = false;
  String hasError = "";
  List<RekapAbsensi> rekapAbsensi = [];

  final int pegawaiId;

  List<String> yearList = [];
  List<String> monthList = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];
  String selectedYear = '';
  String selectedMonth = '';

  void generateYearList() {
    yearList = [];

    var startDate = 2019;
    final DateTime now = DateTime.now();
    final year = int.parse(DateFormat('y').format(now));
    var range = int.parse(year.toString().substring(2, 4)) +
        2 -
        int.parse(startDate.toString().substring(2, 4));
    for (var i = 0; i < range; i++) {
      var constructYear = startDate.toString();
      yearList.add(constructYear);
      startDate++;
    }

    getYearAndMonth();
  }

  void setSelectedYear(String s) {
    selectedYear = s;
    notifyListeners();
  }

  void setSelectedMonth(String s) {
    selectedMonth = s;
    notifyListeners();
  }

  String monthToIntConvert(String s) {
    String value = '';
    switch (s) {
      case 'Januari':
        value = "01";
        break;
      case 'Februari':
        value = "02";
        break;
      case 'Maret':
        value = "03";
        break;
      case 'April':
        value = "04";
        break;
      case 'Mei':
        value = "05";
        break;
      case 'Juni':
        value = "06";
        break;
      case 'Juli':
        value = "07";
        break;
      case 'Agustus':
        value = "08";
        break;
      case 'September':
        value = "09";
        break;
      case 'Oktober':
        value = "10";
        break;
      case 'November':
        value = "11";
        break;
      case 'Desember':
        value = "12";
        break;
    }
    return value;
  }

  String intToMonthConvert(String s) {
    String month = '';
    switch (s) {
      case '1':
        month = "Januari";
        break;
      case '2':
        month = "Februari";
        break;
      case '3':
        month = "Maret";
        break;
      case '4':
        month = "April";
        break;
      case '5':
        month = "Mei";
        break;
      case '6':
        month = "Juni";
        break;
      case '7':
        month = "Juli";
        break;
      case '8':
        month = "Agustus";
        break;
      case '9':
        month = "September";
        break;
      case '10':
        month = "Oktober";
        break;
      case '11':
        month = "November";
        break;
      case '12':
        month = "Desember";
        break;
    }
    return month;
  }

  void getYearAndMonth() {
    final DateTime now = DateTime.now();
    final month = int.parse(DateFormat('M').format(now));
    final year = int.parse(DateFormat('y').format(now));
    selectedMonth = intToMonthConvert(month.toString());
    selectedYear = year.toString();
    notifyListeners();
    getRekapAbsensi();
  }

  void getRekapAbsensi() async {
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "vmy_absensi_pegawai",
      "data": ["*"],
      "filter": {
        "nomor": pegawaiId,
        "bulan": monthToIntConvert(selectedMonth),
        "tahun": selectedYear
      }
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-api-key': apiKey
    };
    Uri uri = Uri.parse(url);
    try {
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(datas));
      Map<String, dynamic> data =
          (json.decode(response.body) as Map<String, dynamic>);
      final int totalData = data['data'].length;
      rekapAbsensi = [];

      if (totalData != 0) {
        for (var i = 0; i < totalData; i++) {
          rekapAbsensi.add(RekapAbsensi(
            nomor: data['data'][i]['NOMOR'] ?? '-',
            nama: data['data'][i]['NAMA'] ?? '-',
            tanggal: data['data'][i]['TANGGAL'] ?? '-',
            bulan: data['data'][i]['BULAN'] ?? '-',
            tahun: data['data'][i]['MATAKULIAH'] ?? 'TAHUN',
            masuk: data['data'][i]['MASUK'] ?? '-',
            pulang: data['data'][i]['PULANG'] ?? '-',
            jenis: data['data'][i]['JENIS'] ?? '-',
            status: data['data'][i]['STATUS'] ?? '-',
          ));
        }

        rekapAbsensi.sort((a, b) {
          var adate = a.tanggal;
          var bdate = b.tanggal;
          return adate.compareTo(bdate);
        });
      }

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
