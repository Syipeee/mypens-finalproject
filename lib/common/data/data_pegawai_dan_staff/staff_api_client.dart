import 'dart:convert';

import 'package:http/http.dart';
import 'package:mypens/common/data/common/my_pens_http_header.dart';
import 'package:mypens/constants/url.dart';

/// Digunakan untuk memfetch data detail-detail staff
class StaffApiClient {
  Future<Response> getDataDosenOrStaff({
    String? nip,
  }){
    final jsonBody = {
      "table": "pegawai",
      "data": ["*"],
    };

    final Map<String , dynamic> filter = {};
    if (nip != null){
      filter.addAll({'nip' : nip});
    }
    assert(filter.isNotEmpty);
    jsonBody.addAll({'filter' : filter});

    final encodedJsonBody = jsonEncode(jsonBody);

    return post(
      Uri.parse("${dynamicAPIUrl}read"),
      body: encodedJsonBody,
      headers: myPensHeader,
    );
  }
}