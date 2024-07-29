import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../constants/url.dart';
import 'package:basic_utils/basic_utils.dart';

class PresensiController extends ChangeNotifier {
  PresensiController(this.userNrp);

  double latitude = 0;
  double longtitude = 0;

  final int userNrp;

  String errorCode = '';
  String errorMessage = '';

  void setLocation(double lat, double long) {
    latitude = lat;
    longtitude = long;
    notifyListeners();
  }

  void setErrorCode(String arg) {
    errorCode = arg;
    notifyListeners();
    reset();
  }

  void setErrorMessage(String arg) {
    errorMessage = arg;
    notifyListeners();
    reset();
  }

  void reset() {
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        setErrorCode('');
        setErrorMessage('');
        // Update user about remaining time
      },
    );
  }

  Future<String> doPresensi(
      int nrp, int pin, double lat, double long, double distance) async {
    String url =
        '${attendance}DataV2.php?PIN=$pin&NRP=$nrp&Lat=$lat&Long=$long&op=3';
    Uri uri = Uri.parse(url);
    try {
      String rawResponse;
      http.Response response = await http.get(uri);

      if (response.body.contains('null')) {
        return 'fail';
      } else {
        var findTopLimit = response.body.indexOf('{');
        rawResponse = StringUtils.addCharAtPosition(
            response.body.substring(findTopLimit), "", 0);
        var findLowerLimit = rawResponse.indexOf('}');
        rawResponse =
            StringUtils.removeCharAtPosition(rawResponse, (findLowerLimit + 2));

        return rawResponse;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
