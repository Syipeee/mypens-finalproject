import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/user_interface/bottom_navigation.dart';
import '../../../../constants/colors.dart';

import '../../../../controllers/common/user_controller.dart';
import '../../../../controllers/common/news.dart';

class StaffHome extends StatefulWidget {
  const StaffHome({super.key});

  @override
  State<StaffHome> createState() => _HomeState();
}

class _HomeState extends State<StaffHome> {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Menu Utama',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 25),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/staff/rekap_absensi');
                          },
                          child: Container(
                              width: 75,
                              height: 75,
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 48, 3, 56),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Center(
                                  child: Text(
                                    'Presensi Pegawai',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/staff/profil_pegawai');
                          },
                          child: Container(
                              width: 75,
                              height: 75,
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 62, 96, 46),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Center(
                                  child: Text(
                                    'Profil Pegawai',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/staff/daily_activity');
                          },
                          child: Container(
                              width: 75,
                              height: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xff1a237e),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Center(
                                  child: Text(
                                    'Daily Activity',
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
