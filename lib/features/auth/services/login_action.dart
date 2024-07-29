import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../constants/url.dart';

class LoginAction {
  static doLoginStudent(String email, String password) async {
    String encoded = base64.encode(utf8.encode(password));
    String url =
        '${studentLoginAPIUrl}confirmx.php?user=$email&passwd=$encoded';
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      dynamic result;
      if (response.body != 'failed') {
        var getUserNrp = int.parse(response.body.split(':')[1]);
        result = {"response": "success", "userNrp": "$getUserNrp"};
      } else {
        result = {"response": "failed"};
      }

      return result;
    } catch (e) {
      return {"response": "error"};
    }
  }

  static doLoginStaffAndDosen(String email, String password, int type) async {
    String encoded = base64.encode(utf8.encode(password));
    String emailClean = email.substring(0, email.indexOf('@'));
    String url = '';

    switch (type) {
      case 1:
        url =
            '$staffAndLecturerLoginAPIUrl?username=$emailClean&pass=$encoded&dn=staff';
        break;
      case 2:
        url =
            '$staffAndLecturerLoginAPIUrl?username=$emailClean&pass=$encoded&dn=dosen';
        break;
    }

    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      dynamic result;
      if (response.body != 'failed') {
        var getUserNip = response.body.split(':')[1];
        result = {"response": "success", "userNip": getUserNip};
      } else {
        result = {"response": "failed"};
      }

      return result;
    } catch (e) {
      return {"response": "error"};
    }
  }
}
