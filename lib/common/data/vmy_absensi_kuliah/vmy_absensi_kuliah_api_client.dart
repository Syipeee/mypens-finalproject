import 'dart:convert';

import 'package:http/http.dart';
import 'package:mypens/common/data/common/my_pens_http_header.dart';
import 'package:mypens/constants/url.dart';

class VmyAbsensiKuliahApiClient {
  Future<Response> getVmyAbsensiKuliah({
    int? nrp,
    int? tahunAjaran,
    int? idSemester
  }) async {
    final Map<String , dynamic> jsonBody = {
      "table": "vmy_absensi_kuliah",
      "data": ["*"],
      "limit": 1000000
    };
    final Map<String , dynamic> filter = {};
    if (nrp != null){
      filter.addAll({'nrp': nrp});
    }
    if (tahunAjaran != null){
      filter.addAll({'tahun': tahunAjaran});
    }
    if (idSemester != null){
      filter.addAll({'semester': idSemester});
    }
    assert(filter.isNotEmpty);
    jsonBody.addAll({'filter': filter});

    return await post(
      Uri.parse("${dynamicAPIUrl}read"),
      body: jsonEncode(jsonBody),
      headers: myPensHeader,
    );
  }
}