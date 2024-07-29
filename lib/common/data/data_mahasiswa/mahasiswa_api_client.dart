import 'dart:convert';

import 'package:http/http.dart';
import 'package:mypens/common/data/common/my_pens_http_header.dart';
import 'package:mypens/constants/url.dart';

class MahasiswaApiClient {
  Future<Response> getListMahasiswa({
    int? nrp,
  }) async {
    final body = {
      "table": "mahasiswa",
      "data": ["*"],
      "limit": 1,
    };

    final filterData = <String , dynamic>{};
    if (nrp != null){
      filterData.addAll({'nrp' : nrp});
    }
    assert(filterData.isNotEmpty);
    body.addAll({'filter': filterData});

    return post(
      Uri.parse("${dynamicAPIUrl}read"),
      headers: myPensHeader,
      body: jsonEncode(body),
    );
  }
}