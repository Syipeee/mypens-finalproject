import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/pendaftaran_mbkm/data_mahasiswa_pendaftar.dart';
import 'package:mypens/features/mahasiswa/list_akademik/screens/list_akademik.dart';
import 'package:provider/provider.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/screens/data_kegiatan.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/screens/program_terdaftar.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/appstate.dart';

// class MenuDaftar extends StatefulWidget {
//   @override
//   _MenuDaftarState createState() => _MenuDaftarState();
// }
//
// class _MenuDaftarState extends State<MenuDaftar> {
//   @override
//   Widget build(BuildContext context) {
//     const Color primaryColor = Colors.blueAccent;
//
//     return Scaffold(
//       backgroundColor: primaryColor,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text('Program MBKM'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => ListAkademik()),
//             );
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 16),
//                     Text(
//                       'Pendaftaran Kegiatan MBKM',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: primaryColor,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     sectionCard(context, 'Status Pendaftaran Kegiatan', 'Kegiatan Tersedia', DataKegiatan()),
//                     SizedBox(height: 20),
//                     sectionCard(context, 'Kegiatan yang telah Terdaftar', 'Kegiatan yang sudah terdaftar', ProgramTerdaftar()),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget sectionCard(BuildContext context, String title, String subtitle, Widget destination) {
//     return Card(
//       elevation: 4,
//       shadowColor: Colors.blueGrey[50],
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.blueAccent,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               subtitle,
//               style: TextStyle(fontSize: 16, color: Colors.black87),
//             ),
//             SizedBox(height: 16),
//             Align(
//               alignment: Alignment.centerRight,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => destination),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 child: Text('Lihat Detail'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mypens/constants/colors.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/penilaian_mbkm/mahasiswa_mbkm.dart';
import 'package:mypens/controllers/common/user_controller.dart';

class HomePendaftaranDosen extends StatefulWidget {
  const HomePendaftaranDosen({Key? key}) : super(key: key);

  @override
  _HomePendaftaranDosenState createState() => _HomePendaftaranDosenState();
}

class _HomePendaftaranDosenState extends State<HomePendaftaranDosen> {
  List<bool> isTileExpandedList = List.generate(6, (index) => false);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06,
              vertical: screenWidth * 0.12,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.1,
                      padding: EdgeInsets.zero,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 24,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'APPROVAL MBKM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.1,
                      padding: EdgeInsets.zero,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.search,
                            size: 24,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Transform.translate(
                  offset: const Offset(0.0, 50.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenWidth * 0.3,
                  bottom: screenWidth * 0.08,
                  left: 0,
                  right: 0,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                        vertical: screenWidth * 0.02,
                      ),
                      child: buildContentProgramMahasiswa(screenWidth),
                    ),
                  ),
                ),
                Positioned(
                  top: screenWidth * 0.6,
                  bottom: screenWidth * 0.08,
                  left: 0,
                  right: 0,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                        vertical: screenWidth * 0.02,
                      ),
                      child: buildContentProgramMahasiswa2(screenWidth),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06,
                  ),
                  child: buildProgramMahasiswa(screenWidth),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProgramMahasiswa(double screenWidth) {
    int idMahasiswa = Provider.of<UserController>(context, listen: false).userNomor;
    String namaDosen = Provider.of<UserController>(context, listen: false).userNama;
    String nipDosen = Provider.of<UserController>(context, listen: false).nipDosenOrStaff;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                'assets/images/card_program.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40.0,
                left: 24.0,
                right: 24.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Nama : $namaDosen',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.005),
                      ],
                    ),
                    Text(
                      'NIP: $nipDosen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildContentProgramMahasiswa(double screenWidth) {
    int idDosenWali = Provider.of<UserController>(context, listen: false).userNomor;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PendaftarPage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: buildListTile(0, screenWidth),
          ),
        ),
      ),
    );
  }

  Widget buildContentProgramMahasiswa2(double screenWidth) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProgramTerdaftar(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: buildListTile2(0, screenWidth),
          ),
        ),
      ),
    );
  }

  Widget buildListTile2(int index, double screenWidth) {
    return Column(
      children: [
        ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.14,
                height: screenWidth * 0.14,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Image.asset(
                  'assets/images/logo-kampus-mengajar.png',
                  width: screenWidth * 0.14,
                  height: screenWidth * 0.14,
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Program Terdaftar'),
                  Text('200 Mahasiswa'),
                ],
              ),
              const Spacer(),
            ],
          ),
          trailing: GestureDetector(
            onTap: () {
              // setState(() {
              //   isTileExpandedList[index] = !isTileExpandedList[index];
              // });
            },
            child: Container(
              width: screenWidth * 0.08,
              height: screenWidth * 0.08,
              decoration: const ShapeDecoration(
                color: Colors.blue,
                shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Center(
                child: Icon(
                  isTileExpandedList[index]
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: screenWidth * 0.07,
                ),
              ),
            ),
          ),
        ),
        // if (isTileExpandedList[index]) buildExpandedContent(screenWidth),
      ],
    );
  }

  Widget buildListTile(int index, double screenWidth) {
    return Column(
      children: [
        ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.14,
                height: screenWidth * 0.14,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Image.asset(
                  'assets/images/logo-kampus-mengajar.png',
                  width: screenWidth * 0.14,
                  height: screenWidth * 0.14,
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kegiatan yang tersedia'),
                  Text('200 Mahasiswa'),
                ],
              ),
              const Spacer(),
            ],
          ),
          trailing: GestureDetector(
            onTap: () {
              setState(() {
                isTileExpandedList[index] = !isTileExpandedList[index];
              });
            },
            child: Container(
              width: screenWidth * 0.08,
              height: screenWidth * 0.08,
              decoration: const ShapeDecoration(
                color: Colors.blue,
                shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Center(
                child: Icon(
                  isTileExpandedList[index]
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: screenWidth * 0.07,
                ),
              ),
            ),
          ),
        ),
        if (isTileExpandedList[index]) buildExpandedContent(screenWidth),
      ],
    );
  }

  Widget buildExpandedContent(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.06,
        vertical: screenWidth * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 1.0,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.001,
            ),
          ),
          const SizedBox(height: 8.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Di Buka Tanggal'),
              Text('12-12-2021'),
            ],
          ),
          const SizedBox(height: 8.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Di Tutup Tanggal'),
              Text('12-12-2021'),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Total Mahasiswa:'),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: bluePens,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.02, 8.0, screenWidth * 0.03, 8.0),
                        child: const Text(
                          '20 Mahasiswa',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

