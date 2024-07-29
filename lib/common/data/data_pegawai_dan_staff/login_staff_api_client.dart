import 'dart:convert';

import 'package:http/http.dart';
import 'package:mypens/constants/url.dart';
import 'package:mypens/common/domain/authentication/model/user_type_enum.dart';

class LoginStaffApiClient {
  Future<Response> getNipFromEmailAndPassword({
    required String email,
    required String password,
    required UserType userType,
  }) async {
    final encodedPassword = base64.encode(utf8.encode(password));
    final username = email.substring(0, email.indexOf('@'));

    return await get(
      Uri.parse('$staffAndLecturerLoginAPIUrl?'
          'username=$username&'
          'pass=$encodedPassword&'
          'dn=${userType == UserType.dosen ? 'dosen' : 'staff'}'),
    );
  }
}