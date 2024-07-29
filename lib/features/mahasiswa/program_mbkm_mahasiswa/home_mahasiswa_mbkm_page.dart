import 'package:flutter/material.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/screens/week_list_logbook_mbkm.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/screens/menu_daftar.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/penilaian_mahasiswa/mahasiswa_upload_nilai_mbkm.dart';

class HomeMahasiswaMbkmPage extends StatefulWidget {
  const HomeMahasiswaMbkmPage({super.key});

  @override
  State<HomeMahasiswaMbkmPage> createState() => _HomeMahasiswaMbkmPageState();
}

class _HomeMahasiswaMbkmPageState extends State<HomeMahasiswaMbkmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 24,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              'Program MBKM',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenuDaftar(),
                      ),
                    );
                  },
                  child: Text(
                    'Pendaftar',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeekListLogbookMbkm(),
                      ),
                    );
                  },
                  child: Text(
                    'Monitoring',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MahasiswaUploadNilaiMBKM(),
                      ),
                    );
                  },
                  child: Text(
                    'Penilaian',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
