import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:mypens/debugging_only/choose_login_method_screen.dart';
import 'package:mypens/debugging_only/login_dosen_by_nip/login_dosen_by_nip.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/providers/read_logbook_pendaftar_dokumen_provider.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/providers/read_logbook_pendaftar_provider.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/providers/read_vpendaftar_provider.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/penilaian_mbkm/program_mahasiswa.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/delete_assessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/kategori_assessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/list_kegiatan_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/insert_assessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/list_vkegiatan_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/pendaftar_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/read_assessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/read_vassessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/update_assessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/vmitra_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/vpendaftar_providers.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/detail_perizinan_absensi/dosen_detail_perizinan_entry.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/list_preview_perizinan_absensi/dosen_list_perizinan_absensi_screen.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/home_mahasiswa_mbkm_page.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/providers/logbook_monitoring_provider.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/providers/logbook_pendaftar_provider.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/providers/pendaftar_logbook_provider.dart';
import 'package:mypens/features/mahasiswa/rekap_absen/presentation/rekap_absen_screen.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/history_pengajuan/history_pengajuan_screen.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/input_pengajuan/input_pengajuan_screen.dart';
import 'package:mypens/firebase_options.dart';
import 'package:mypens/firebase_options_deb.dart';
import 'package:provider/provider.dart';
import 'package:mypens/controllers/common/user_controller.dart';

import 'base/splash_screen.dart';
import 'features/auth/screens/login.dart';
import 'features/global/news/screens/news.dart';

import 'features/mahasiswa/home/screens/home.dart';
import 'features/mahasiswa/summary/screens/summary.dart';
import 'features/mahasiswa/profile/screens/profile.dart';
import 'features/mahasiswa/revisi_sidang_sppa_ppa_pa/screens/revisi_sidang_sppa_ppa_pa.dart';
import 'features/mahasiswa/revisi_sidang_tesis/screens/revisi_sidang_tesis.dart';
import 'features/mahasiswa/revisi_sidang_kp/screens/revisi_sidang_kp.dart';
import 'features/mahasiswa/pengajuan_judul_kp/screens/pengajuan_judul_kp.dart';
import 'features/mahasiswa/pengajuan_judul_ta/screens/pengajuan_judul_ta.dart';
import 'features/mahasiswa/nilai_per_semester/screens/nilai_per_semester.dart';
import 'features/mahasiswa/jadwal_kuliah/screens/jadwal_kuliah.dart';
import 'features/mahasiswa/presensi/screens/presensi.dart';
import 'features/mahasiswa/list_akademik/screens/list_akademik.dart';
import 'features/mahasiswa/daftar_ulang/screens/daftar_ulang.dart';

import 'features/mahasiswa/unggah_nilai_mbkm/presentation/mahsiswa_upload_nilai_mbkm.dart';
import 'features/staff/home/screens/home.dart';
import 'features/staff/rekap_absensi/screens/rekap_absensi.dart';
import 'features/staff/profil_pegawai/screens/profil_pegawai.dart';
import 'features/staff/daily_activity/screens/daily_activity.dart';
import 'features/staff/profile/screens/profile.dart';

import 'features/dosen/home/screens/home.dart';
import 'features/dosen/unggah_soal/screens/unggah_soal.dart';
import 'features/dosen/daily_activity/screens/daily_activity.dart';
import 'features/dosen/profile/screens/profile.dart';

import 'controllers/mahasiswa/nilai_per_semester.dart';
import 'controllers/mahasiswa/jadwal_kuliah.dart';
import 'controllers/common/news.dart';
import 'controllers/mahasiswa/presensi.dart';
import 'controllers/mahasiswa/rekap_absensi.dart';
import 'controllers/mahasiswa/revisi_sidang_kp.dart';
import 'controllers/mahasiswa/revisi_sidang_sppa_ppa_pa.dart';
import 'controllers/mahasiswa/revisi_sidang_tesis.dart';
import 'controllers/mahasiswa/daftar_ulang.dart';
import 'controllers/mahasiswa/pengajuan_judul_kp.dart';
import 'controllers/mahasiswa/pengajuan_judul_ta.dart';
import 'controllers/mahasiswa/profile.dart';
import 'controllers/mahasiswa/profil_dosen.dart';
import 'controllers/staff/rekap_absensi.dart';
import 'controllers/staff/profil_pegawai.dart';
import 'controllers/staff/profil_pribadi.dart';
import 'controllers/staff/daily_activity.dart';
import 'controllers/dosen/unggah_soal.dart';
import 'controllers/dosen/rekap_absensi.dart';
import 'controllers/dosen/jadwal_kuliah.dart';

import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/screens/menu_daftar.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/appstate.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/provider/kegiatan_provider.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/provider/kegiatan_posisi_provider.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/provider/pendaftar_provider.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/provider/mitra_provider.dart';
import 'injection.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  initInjection();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  // TODO: Ini gak butuh internet
  await Firebase.initializeApp(
    options: foundation.kDebugMode
        ? DebugFirebaseOptions.currentPlatform
        : DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<UserController>(
          create: (_) => UserController(),
        ),
        ListenableProxyProvider<UserController, NilaiPerSemesterController>(
            update: (_, user, __) =>
                NilaiPerSemesterController(user.userNomor)),
        ListenableProxyProvider<UserController, JadwalKuliahController>(
            update: (_, user, __) => JadwalKuliahController(user.userNomor)),
        ListenableProvider<PengumumanController>(
          create: (_) => PengumumanController(),
        ),
        ListenableProxyProvider<UserController, PresensiController>(
            update: (_, user, __) => PresensiController(user.nrpMahasiswa)),
        ListenableProxyProvider<UserController, RekapAbsensiController>(
            update: (_, user, __) => RekapAbsensiController(user.userNomor)),
        ListenableProxyProvider<UserController, RevisiSidangKPController>(
            update: (_, user, __) => RevisiSidangKPController(user.userNomor)),
        ListenableProxyProvider<UserController, RevisiSppaPpaPaController>(
            update: (_, user, __) => RevisiSppaPpaPaController(user.userNomor)),
        ListenableProxyProvider<UserController, RevisiSidangTesisController>(
            update: (_, user, __) =>
                RevisiSidangTesisController(user.userNomor)),
        ListenableProxyProvider<UserController, DaftarUlangController>(
            update: (_, user, __) => DaftarUlangController(user.nrpMahasiswa)),
        ListenableProxyProvider<UserController, PengajuanJudulKpController>(
            update: (_, user, __) =>
                PengajuanJudulKpController(user.nrpMahasiswa)),
        ListenableProxyProvider<UserController, PengajuanJudulTaController>(
            update: (_, user, __) =>
                PengajuanJudulTaController(user.nrpMahasiswa)),
        ListenableProxyProvider<UserController, ProfileController>(
            update: (_, user, __) => ProfileController(user.nrpMahasiswa)),
        ListenableProvider<ProfilDosenController>(
            create: (_) => ProfilDosenController()),
        // staff
        ListenableProxyProvider<UserController, StaffRekapAbsensiController>(
            update: (_, user, __) =>
                StaffRekapAbsensiController(user.userNomor)),
        ListenableProvider<ProfilPegawaiController>(
            create: (_) => ProfilPegawaiController()),
        ListenableProxyProvider<UserController, ProfilPribadiController>(
            update: (_, user, __) =>
                ProfilPribadiController(user.nipDosenOrStaff)),
        ListenableProxyProvider<UserController, DailyActivityController>(
            update: (_, user, __) =>
                DailyActivityController(user.nipDosenOrStaff)),
        // dosen
        ListenableProxyProvider<UserController, UnggahSoalController>(
            update: (_, user, __) =>
                UnggahSoalController(user.nipDosenOrStaff)),
        ListenableProxyProvider<UserController, DosenRekapAbsensiController>(
            update: (_, user, __) =>
                DosenRekapAbsensiController(user.userNomor)),
        ListenableProxyProvider<UserController, DosenJadwalKuliahController>(
            update: (_, user, __) =>
                DosenJadwalKuliahController(user.nipDosenOrStaff)),

        //penilaian
        ChangeNotifierProvider(
          create: (_) => KategoriAssessmentProviders(
            getKategoriAssessment: locator(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => InsertAssessmentProviders(
            postInsertNilaiAssessment: locator(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ListKegiatanProviders(
            getListKegiatanResponse: locator(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ListVKegiatanProviders(
            getListVKegiatanResponse: GetIt.I.get(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PendaftarProviders(
            getPendaftar: locator(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => VmitraProviders(
            getVmitra: locator(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ReadAssessmentProviders(
            getReadAssessment: locator(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => VReadAssessmentProviders(
            getVReadAssessment: locator(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => UpdateAssessmentProvider(
            updateAssessment: locator(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DeleteAssessmentProvider(
            deleteAssessment: locator(),
          ),
        ),

        //dosenmbkm
        ListenableProxyProvider<UserController, VpendaftarProviders>(
          update: (context, userController, prevPendaftarProvider) =>
              VpendaftarProviders(
            nomorDosen: userController.userNomor,
            getVpendaftar: locator(),
          ),
        ),

        //mhsmbkm
        ChangeNotifierProvider<AppState>(
          create: (_) => AppState(),
        ),
        ListenableProxyProvider<UserController, KegiatanProvider>(
          update: (context, userController, prevKegiatanProvider) =>
              KegiatanProvider(idMahasiswa: userController.userNomor),
        ),
        ListenableProxyProvider<UserController, VPendaftarLogbookProvider>(
          update: (context, userController, preVPendaftarProvider) =>
              VPendaftarLogbookProvider(idPembimbing: userController.userNomor),
        ),
        ListenableProxyProvider<UserController, PendaftarProvider>(
          update: (context, userController, prevPendaftarProvider) =>
              PendaftarProvider(idMahasiswa: userController.userNomor),
        ),
        ChangeNotifierProvider(create: (_) => MitraProvider()),
        ChangeNotifierProvider(create: (context) => KegiatanPosisiProvider()),

        //monitoring
        ChangeNotifierProvider(
          create: (context) => PendaftarLogbookProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LogbookMonitoringProvider(),
        ),
        ChangeNotifierProvider(create: (_) => LogbookPendaftarDosbimProvider()),
        ChangeNotifierProvider(create: (_) => LogbookPendaftarProvider()),
        ChangeNotifierProvider(
          create: (context) => LogbookPendaftarDokumenDosbimProvider(),
        ),
      ],
      child: const MyPens(),
    ),
  );
}

class MyPens extends StatelessWidget {
  const MyPens({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'MyPENS',
      initialRoute: MyPensNavRoutes.splashScreen,
      routes: {
        MyPensNavRoutes.splashScreen: (context) => const SplashScreen(),
        MyPensNavRoutes.login: (context) => const Login(),
        '/berita': (context) => const News(),
        MyPensNavRoutes.mahasiswaBeranda: (context) => const MahasiswaHome(),
        '/mahasiswa/pencapaian': (context) => const Summary(),
        '/mahasiswa/profil': (context) => const MahasiswaProfile(),
        '/mahasiswa/list_akademik': (context) => const ListAkademik(),
        '/mahasiswa/nilai_per_semester': (context) => const NilaiPerSemester(),
        '/mahasiswa/rekap_absensi': (context) => const RekapAbsenMahasiswa(),
        '/mahasiswa/jadwal_kuliah': (context) => const JadwalKuliah(),
        '/mahasiswa/pens_attendance': (context) => const Presensi(),
        MyPensNavRoutes.revisiSidangKp: (context) => const RevisiSidangKp(),
        MyPensNavRoutes.revisiSidangSppaPpaPa: (context) =>
            const RevisiSppaPpaPa(),
        MyPensNavRoutes.revisiSidangTesis: (context) =>
            const RevisiSidangTesis(),
        MyPensNavRoutes.pengajuanTempatKp: (context) =>
            const PengajuanJudulKp(),
        MyPensNavRoutes.pengajuanJudulTa: (context) =>
            const PengajuanJudulTaScreen(),
        MyPensNavRoutes.mahasiswaListAbsensiAlpha: (context) =>
            const HistoryPengajuanScreen(),
        MyPensNavRoutes.mahasiswaInputPengajuanAbsensi: (context) =>
            const InputPengajuanScreen(),
        MyPensNavRoutes.mahasiswaUploadNilaiMBKM: (context) =>
            const MahasiswaUploadNilaiMBKM(),
        '/mahasiswa/daftar_ulang': (context) => const DaftarUlang(),
        MyPensNavRoutes.staffBeranda: (context) => const StaffHome(),
        '/staff/rekap_absensi': (context) => const StaffRekapAbsensi(),
        '/staff/profil_pegawai': (context) => const ProfilPegawai(),
        '/staff/daily_activity': (context) => const StaffDailyActivity(),
        '/staff/profil': (context) => const StaffProfile(),
        MyPensNavRoutes.dosenBeranda: (context) => const DosenHome(),
        '/dosen/unggah_soal': (context) => const UnggahSoal(),
        '/dosen/daily_activity': (context) => const DosenDailyActivity(),
        '/dosen/profil': (context) => const DosenProfile(),
        MyPensNavRoutes.dosenListPerizinanAbsensi: (context) =>
            const DosenListPerizinanAbsensiScreen(),
        MyPensNavRoutes.dosenDetailPerizinanAbsensi: (context) =>
            DosenDetailAbsensiAlphaEntry(
                idPengajuan:
                    ModalRoute.of(context)?.settings.arguments as int? ?? -1),
        MyPensNavRoutes.debugLoginDosenByNip: (context) =>
            const LoginDosenByNip(),
        MyPensNavRoutes.debugChooseLoginMethod: (context) =>
            const ChooseLoginMethodScreen(),
        MyPensNavRoutes.programMahasiswa: (context) => const ProgramMahasiswa(),
        MyPensNavRoutes.programMbkmMahasiswa: (context) =>
            const HomeMahasiswaMbkmPage(),
        MyPensNavRoutes.menuDaftar: (context) => MenuDaftar(),
      },
    );
  }
}
