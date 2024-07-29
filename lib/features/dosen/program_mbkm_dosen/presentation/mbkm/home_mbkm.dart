import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/screens/list_mahasiswa_mbkm.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/pendaftaran_mbkm/home_pendaftaran_dosen.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/penilaian_mbkm/program_mahasiswa.dart';

class HomeMbkmPage extends StatefulWidget {
  const HomeMbkmPage({super.key});

  @override
  State<HomeMbkmPage> createState() => _HomeMbkmPageState();
}

class _HomeMbkmPageState extends State<HomeMbkmPage> {
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
                        builder: (context) => const HomePendaftaranDosen(),
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
                        builder: (context) => const ListMahasiswaLogbookMbkm(),
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
                        builder: (context) => const ProgramMahasiswa(),
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
