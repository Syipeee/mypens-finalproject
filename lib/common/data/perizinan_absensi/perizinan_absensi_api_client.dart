import 'dart:convert';

import 'package:http/http.dart';
import 'package:mypens/common/data/common/my_pens_http_header.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/domain/perizinan_absensi/dto/submit_data_perizinan_absensi_dto.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';
import 'package:mypens/constants/url.dart';

class PerizinanAbsensiApiClient {
  Future<Response> submitData(SubmitDataPerizinanDto data) async {
    final wrappedJsonData = {
      "table": "perizinan_absensi",
      "data" : [
        data.toJson()
      ]
    };

    return post(
      Uri.parse("${dynamicAPIUrl}insert"),
      headers: myPensHeader,
      body: jsonEncode(wrappedJsonData),
    );
  }

  Future<Response> getPerizinanAbsensi({
    required StatusPenerimaanPerizinan? status,
    int? nomorMahasiswa,
    int? nomorDosen,
    int? tahunAjaran,
    Semester? semester,
    int? idPerizinan,
  }) async {
    final Map<String , dynamic> jsonBody = {
      "table": "vmy_perizinan_absensi",
      "data" : ["*"],
    };
    final Map<String , dynamic> filter = {};
    
    if (nomorMahasiswa != null){
      filter.addAll({"mahasiswa" : nomorMahasiswa});
    }
    if (status != null) {
      filter.addAll({"status_penerimaan": status.id});
    }
    if (nomorDosen != null){
      filter.addAll({'dosen': nomorDosen});
    }
    if (semester != null){
      filter.addAll({'semester': semester.id});
    }
    if (tahunAjaran != null){
      filter.addAll({'tahun': tahunAjaran});
    }
    if (idPerizinan != null){
      filter.addAll({'nomor': idPerizinan});
    }

    assert(filter.isNotEmpty);
    jsonBody.addAll({"filter" : filter});

    return post(
      Uri.parse("${dynamicAPIUrl}read"),
      headers: myPensHeader,
      body: jsonEncode(jsonBody),
    );
  }

  Future<Response> updatePerizinanAbsensi({
    required int idPerizinan,
    StatusPenerimaanPerizinan? newStatus
  }) async {
    final Map<String , dynamic> jsonBody = {
      "table": "perizinan_absensi",
      "conditions" : {
        "nomor" : idPerizinan,
      },
    };

    final Map<String , dynamic> data = {};
    if (newStatus != null){
      data.addAll({"status_penerimaan": newStatus.id});
    }

    assert(data.isNotEmpty);
    jsonBody.addAll({"data": data});

    return await post(
      Uri.parse("${dynamicAPIUrl}update"),
      headers: myPensHeader,
      body: jsonEncode(jsonBody)
    );
  }
}