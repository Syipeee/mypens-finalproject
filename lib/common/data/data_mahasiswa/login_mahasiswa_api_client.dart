import 'dart:convert';

import 'package:http/http.dart';
import 'package:mypens/constants/url.dart';

class LoginMahasiswaApiClient {
  Future<Response> loginMahasiswa({
    required String email,
    required String password
  }) async {
    final encodedPassword = base64.encode(utf8.encode(password));
    return get(
      Uri.parse("${studentLoginAPIUrl}confirmx.php?user=$email&passwd=$encodedPassword"),
    );
  }
}