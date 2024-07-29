
import 'package:flutter/material.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:mypens/common/user_interface/kotak_fitur_warna_warni.dart';

class ListAkademikViewModel {
  final listAkademikItems = [
    KotakFiturWarnaWarniModel1(
      judul: "Revisi Sidang KP",
      warnaKotak: const Color(0xff1b7742),
      nextRoute: MyPensNavRoutes.revisiSidangKp,
    ),
    KotakFiturWarnaWarniModel1(
      judul: 'Revisi Sidang SPPA, PPA, PA',
      warnaKotak: const Color(0xff006060),
      nextRoute: MyPensNavRoutes.revisiSidangSppaPpaPa,
    ),
    KotakFiturWarnaWarniModel1(
      judul: 'Revisi Sidang Tesis',
      warnaKotak: const Color(0xff123622),
      nextRoute: MyPensNavRoutes.revisiSidangTesis,
    ),
    KotakFiturWarnaWarniModel1(
      judul: 'Pengajuan Tempat Kerja Praktik',
      warnaKotak: const Color(0xff8a6700),
      nextRoute: MyPensNavRoutes.pengajuanTempatKp,
    ),
    KotakFiturWarnaWarniModel1(
      judul: 'Pengajuan Judul Tugas Akhir',
      warnaKotak: const Color(0xff8a1c00),
      nextRoute: MyPensNavRoutes.pengajuanJudulTa,
    ),
    KotakFiturWarnaWarniModel1(
      judul: 'Urus Absensi Alpha',
      warnaKotak: const Color(0xff585372),
      nextRoute: MyPensNavRoutes.mahasiswaListAbsensiAlpha,
    ),
    KotakFiturWarnaWarniModel1(
      judul: 'Program MBKM',
      warnaKotak: const Color(0xff1b7742),
      nextRoute: MyPensNavRoutes.programMbkmMahasiswa,
    ),
  ];
}