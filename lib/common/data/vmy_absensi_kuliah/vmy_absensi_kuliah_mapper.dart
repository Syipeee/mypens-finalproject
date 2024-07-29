import 'package:mypens/common/data/vmy_absensi_kuliah/dto/vmy_absensi_kuliah_dto.dart';
import 'package:mypens/common/domain/vmy_absensi_kuliah/rekap_absensi_mahasiswa_model.dart';

class VmyAbsensiKuliahMapper {
  Future<RekapAbsensiMahasiswa> fromListDtoToRekapAbsensiMahasiswa(
    List<VmyAbsensiKuliahDto> listDto
  ) async {
    // nyimpen mata kuliah dan rekap mingguan mata kuliah tersebut
    final Map<String , List<MingguRekapAbsensi>> mappedData = {};

    for (final dto in listDto){
      if (mappedData[dto.namaMataKuliah!] == null){
        mappedData[dto.namaMataKuliah!] = List.generate(
          17,
          (index) => MingguRekapAbsensi(listKehadiranMingguIni: [])
        );
      }
      mappedData[dto.namaMataKuliah!]!
        [dto.mingguKe!]
        .listKehadiranMingguIni.add(dto.status!,);
    }

    final listMatkulRekapAbsensi = <MatkulRekapAbsensi>[];
    mappedData.forEach((namaMatkul, rekapMingguan) {
      listMatkulRekapAbsensi.add(MatkulRekapAbsensi(
        namaMatkul: namaMatkul,
        listMingguRekapAbsensi: rekapMingguan,
      ));
    });

    return RekapAbsensiMahasiswa(
      listMatkulRekapAbsensi: listMatkulRekapAbsensi
    );
  }
}