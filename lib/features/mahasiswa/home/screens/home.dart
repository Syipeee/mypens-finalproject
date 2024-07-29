import 'package:flutter/material.dart';
import 'package:mypens/common/user_interface/kotak_fitur_warna_warni.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../common/user_interface/bottom_navigation.dart';
import '../../../../constants/colors.dart';

import '../../../../controllers/common/user_controller.dart';
import '../../../../controllers/common/news.dart';
import '../../../../controllers/mahasiswa/presensi.dart';

class MahasiswaHome extends StatefulWidget {
  const MahasiswaHome({Key? key}) : super(key: key);

  @override
  State<MahasiswaHome> createState() => _HomeState();
}

class _HomeState extends State<MahasiswaHome> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var pengumuman =
          Provider.of<PengumumanController>(context, listen: false);
      pengumuman.getPengumuman();
      var presensi = Provider.of<PresensiController>(context, listen: false);

      getLocation() async {
        LocationPermission permission;
        permission = await Geolocator.requestPermission();
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        presensi.setLocation(position.latitude, position.longitude);
      }

      getLocation();
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
        margin: const EdgeInsets.only(top: 20, bottom: 30),
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
          margin: const EdgeInsets.only(top: 20, bottom: 30),
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

  presensiMessage(presensi) {
    if (presensi.errorCode == '000') {
      return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xfff146c43)),
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xfffd1e7dd),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  'Berhasil melakukan presensi 🎉️',
                  style: TextStyle(fontSize: 21, color: Color(0xfff146c43)),
                ),
              ],
            ),
          ));
    }
    if (presensi.errorCode != '000' && presensi.errorMessage != '') {
      return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xfffdc3545)),
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffff8d7da),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  'Ooops! gagal melakukan presensi 😵‍💫️',
                  style: TextStyle(fontSize: 21, color: Color(0xfffdc3545)),
                ),
              ],
            ),
          ));
    }
    return const SizedBox();
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

    UserController user = Provider.of<UserController>(context);
    PengumumanController news = Provider.of<PengumumanController>(context);
    PresensiController presensi = Provider.of<PresensiController>(context);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: bluePens,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));

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
                  presensiMessage(presensi),

                  greetings(user.nrpMahasiswa.toString(), user.userNama),

                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Akademik',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 25),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/mahasiswa/list_akademik');
                        },
                        child: const Icon(Icons.arrow_forward_sharp),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KotakFiturWarnaWarni(
                          judulFitur: "Nilai Per Semester",
                          warnaKotak: const Color.fromARGB(255, 22, 149, 158),
                          onClick: () => Navigator.pushNamed(
                              context, '/mahasiswa/nilai_per_semester'
                          ),
                        ),

                        KotakFiturWarnaWarni(
                          judulFitur: 'Rekap Absensi',
                          warnaKotak: const Color.fromARGB(255, 209, 49, 182),
                          onClick: () {
                            Navigator.pushNamed(
                                context, '/mahasiswa/rekap_absensi');
                          }
                        ),

                        KotakFiturWarnaWarni(
                          judulFitur: 'Jadwal Kuliah',
                          warnaKotak: const Color.fromARGB(255, 55, 129, 98),
                          onClick: () {
                            Navigator.pushNamed(
                                context, '/mahasiswa/jadwal_kuliah');
                          }
                        ),

                        KotakFiturWarnaWarni(
                          judulFitur: 'PENS Attendance',
                          warnaKotak: const Color.fromARGB(255, 114, 59, 165),
                          onClick: () {
                            Navigator.pushNamed(
                                context, '/mahasiswa/pens_attendance');
                          }
                        ),
                        
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daftar Ulang dan Pembayaran',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 25),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/mahasiswa/daftar_ulang');
                          },
                          child: Container(
                              width: 75,
                              height: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 58, 109, 143),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Center(
                                  child: Text(
                                    'Daftar Ulang',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Berita Terbaru',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 25),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/berita');
                        },
                        child: const Icon(Icons.arrow_forward_sharp),
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
                                padding: const EdgeInsets.only(
                                    top: 20, right: 20, left: 20),
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
