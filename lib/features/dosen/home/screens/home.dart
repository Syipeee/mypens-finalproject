import 'package:flutter/material.dart';
import 'package:mypens/common/user_interface/kotak_fitur_warna_warni.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:provider/provider.dart';
import '../../../../common/user_interface/bottom_navigation.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/common/news.dart';
import '../../unggah_soal/screens/unggah_soal.dart';
import '../../daily_activity/screens/daily_activity.dart';
import '../../../../controllers/common/user_controller.dart';
import '../../rekap_absensi/screens/rekap_absensi.dart';
import '../../jadwal_kuliah/screens/jadwal_kuliah.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/home_mbkm.dart';

class DosenHome extends StatefulWidget {
  const DosenHome({Key? key}) : super(key: key);

  @override
  State<DosenHome> createState() => _HomeState();
}

class _HomeState extends State<DosenHome> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var pengumuman =
          Provider.of<PengumumanController>(context, listen: false);
      pengumuman.getPengumuman();
    });
  }

  String assetByTime() {
    var hour = DateTime.now().hour;
    String link = '';
    if (hour < 18) {
      link += 'assets/images/sun.png';
    } else {
      link += 'assets/images/moon.png';
    }

    return link;
  }

  renderLoader(hasError) {
    if (hasError != "") {
      return [
        Container(
          padding: const EdgeInsets.only(top: 60),
          height: MediaQuery.of(context).size.height - 300,
          child: Column(
            children: [
              Center(
                  child: SelectableText(
                hasError,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ))
            ],
          ),
        )
      ];
    }

    return [
      Container(
        margin: const EdgeInsets.only(top: 30),
        child: const Center(
          child: CircularProgressIndicator(
            backgroundColor: yellowPens,
            valueColor: AlwaysStoppedAnimation(bluePens),
          ),
        ),
      )
    ];
  }

  renderNews(obj, isLoading, hasError) {
    if (isLoading) {
      return [
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: const Center(
            child: CircularProgressIndicator(
              backgroundColor: yellowPens,
              valueColor: AlwaysStoppedAnimation(bluePens),
            ),
          ),
        )
      ];
    }

    if (hasError != "") {
      return [
        Container(
          padding: const EdgeInsets.only(top: 60),
          height: MediaQuery.of(context).size.height - 300,
          child: Column(
            children: [
              Center(
                  child: SelectableText(
                hasError,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ))
            ],
          ),
        )
      ];
    }

    return [
      SelectableText(
        """${obj.data.first.judul}

Kategori: ${obj.data.first.kategori}
Oleh: ${obj.data.first.author}
Tanggal: ${obj.data.first.tanggalDibuat}

${obj.data.first.uraian}""",
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
        textAlign: TextAlign.left,
      )
    ];
  }

  greetings(String nrp, String nama) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: mainContent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selamat Datang!',
                            style: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 30),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SelectableText(
                            nama,
                            style: const TextStyle(fontSize: 21),
                          ),
                          SelectableText(
                            nrp,
                            style: const TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ))),
            Positioned(
                top: -45,
                right: -45,
                child: Image.asset(
                  width: 220,
                  height: 220,
                  assetByTime(),
                ))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Keluar Aplikasi'),
              content: const Text('Yakinn kamu mau keluar? 🥺️🥺️😔️'),
              actions: [
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                    child: const Text('Ngga Jadi')),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Keluar'),
                ),
              ],
            ),
          ) ??
          false;
    }

    PengumumanController news = Provider.of<PengumumanController>(context);
    UserController user = Provider.of<UserController>(context);

    return WillPopScope(
      onWillPop: showExitPopup,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: mainBackground,
        bottomNavigationBar: const BottomNavigation(0),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  greetings(user.nipDosenOrStaff, user.userNama),
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Menu Utama',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 25),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        right: 16,
                      ),
                      children: [
                        KotakFiturWarnaWarni(
                          judulFitur: 'Unggah Soal',
                          warnaKotak: const Color.fromARGB(255, 48, 3, 56),
                          onClick: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UnggahSoal()));
                          }
                        ),

                        const SizedBox(width: 12,),

                        KotakFiturWarnaWarni(
                          judulFitur: 'Jadwal Kuliah',
                          warnaKotak: const Color.fromARGB(255, 62, 96, 46),
                          onClick: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const DosenJadwalKuliah()));
                          }
                        ),

                        const SizedBox(width: 12,),

                        KotakFiturWarnaWarni(
                          judulFitur: 'Perizinan Mahasiswa Alpha',
                          warnaKotak: const Color(0xffa17200),
                          onClick: (){
                            Navigator.of(context).pushNamed(
                              MyPensNavRoutes.dosenListPerizinanAbsensi
                            );
                          }
                        ),

                        const SizedBox(width: 12,),

                        KotakFiturWarnaWarni(
                          judulFitur: 'Daily Activity',
                          warnaKotak: const Color(0xff1a237e),
                          onClick: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const DosenDailyActivity()));
                          }
                        ),

                        const SizedBox(width: 12,),

                        KotakFiturWarnaWarni(
                          judulFitur: 'Presensi Pegawai',
                          warnaKotak: const Color(0xff037157),
                          onClick: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const DosenRekapAbsensi()));
                          }
                        ),

                        const SizedBox(width: 12),
                        KotakFiturWarnaWarni(
                            judulFitur: 'Program MBKM',
                            warnaKotak: bluePens,
                            onClick: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const HomeMbkmPage()));
                            }),

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Berita Terbaru',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 25),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/berita');
                        },
                        child: const Text(
                          'lihat semua',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 202, 202, 202)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: mainContent,
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: news.pengumuman != null
                                      ? renderNews(news.pengumuman,
                                          news.isLoading, news.hasError)
                                      : renderLoader(news.hasError),
                                ))),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
