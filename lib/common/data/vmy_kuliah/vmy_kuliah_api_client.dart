import 'dart:convert';

import 'package:http/http.dart';
import 'package:mypens/common/data/common/my_pens_http_header.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/constants/url.dart';

class VmyKuliahApiClient {
  Future<Response> getVmyKuliah({
    int? idMahasiswa,
    String? nip,
    Semester? semester,
    int? tahunAjaran,    
  }) async {
    final Map<String , dynamic> requestBody = {
      "table": "vmy_kuliah",
      "data": ["*"],
    };

    final Map<String, dynamic> filter = {};
    if (idMahasiswa != null){
      filter.addAll({'mahasiswa' : idMahasiswa,});
    }
    if (nip != null){
      filter.addAll({'nip_dosen' : nip,});
    }
    if (semester != null){
      filter.addAll({'semester' : semester.id,});
    }
    if (tahunAjaran != null) {
      filter.addAll({'tahun' : tahunAjaran,});
    }
    assert(filter.isNotEmpty);
    requestBody.addAll({'filter' : filter});

    return post(
      Uri.parse("${dynamicAPIUrl}read"),
      body: jsonEncode(requestBody),
      headers: myPensHeader,
    );
  }
}