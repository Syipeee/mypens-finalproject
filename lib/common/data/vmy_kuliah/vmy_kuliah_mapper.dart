import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:mypens/common/data/vmy_kuliah/dto/vmy_kuliah_dto.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/mata_kuliah_preview.dart';

class VmyKuliahMapper {
  List<MataKuliahPreview> getListMataKuliahPreviewFromBody(String body){
    final jsonBody = jsonDecode(body);
    final listData = jsonBody['data'];

    return listData.map((item) =>
      MataKuliahPreview(
        idMatkul: item['NOMOR_KULIAH'],
        namaMatkul: item['MATAKULIAH'],
      ),
    ).cast<MataKuliahPreview>().toList();
  }

  (List<int> listTahun, Semester maxSemester) getListTahunAndMaxSemesterFromBody(
    List<VmyKuliahDto> listVmyKuliah
  ){
    var maxSemester = Semester.ganjil;
    var maxTahun = -1;
    final tahunSet = <int>{};

    for (final vmyKuliah in listVmyKuliah){
      final tahun = vmyKuliah.tahun!;
      final semesterId = vmyKuliah.semester!;
      final semester = Semester.fromId(semesterId);

      tahunSet.add(tahun);

      if (tahun > maxTahun){
        maxTahun = tahun;
        maxSemester = semester;
      } else if (
        tahun == maxTahun &&
        semester.comparisonValue > maxSemester.comparisonValue
      ) {
        maxSemester = semester;
      }
    }

    return (tahunSet.toList().sorted((a, b) => b.compareTo(a)) , maxSemester);
  }
}