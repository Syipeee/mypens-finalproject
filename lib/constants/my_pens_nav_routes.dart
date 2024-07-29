abstract class MyPensNavRoutes {
  static const String login = '/login';
  static const String splashScreen = '/splash';

  static const String revisiSidangKp = '/mahasiswa/revisi_sidang_kp';
  static const String revisiSidangSppaPpaPa = '/mahasiswa/revisi_sidang_sppa_ppa_pa';
  static const String revisiSidangTesis = '/mahasiswa/revisi_sidang_tesis';
  static const String pengajuanTempatKp = '/mahasiswa/pengajuan_tempat_kp';
  static const String pengajuanJudulTa = '/mahasiswa/pengajuan_judul_ta';
  static const String mahasiswaListAbsensiAlpha = '/mahasiswa/urus-absensi-alpha';
  static const String mahasiswaInputPengajuanAbsensi = '$mahasiswaListAbsensiAlpha/input-pengajuan';
  static const String mahasiswaBeranda = '/mahasiswa/beranda';
  static const String mahasiswaUploadNilaiMBKM = '/mahasiswa/upload-nilai-mbkm';
  static const String menuDaftar = '/mahasiswa/pendaftaran_mbkm';
  static const programMahasiswa = '$dosenBeranda/program-mahasiswa';
  static const String programMbkmMahasiswa =
      '/mahasiswa/mahasiswa-program-mbkm';

  static const dosenBeranda = '/dosen/beranda';
  static const dosenListPerizinanAbsensi = '$dosenBeranda/perizinan-absensi';
  static const dosenDetailPerizinanAbsensi = '$dosenListPerizinanAbsensi/detail';

  static const staffBeranda = '/staff/beranda';

  static const debugChooseLoginMethod = '/choose_login_method';
  static const debugLoginDosenByNip = '/login_dosen_by_nip';
}