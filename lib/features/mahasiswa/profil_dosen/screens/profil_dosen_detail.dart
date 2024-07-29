import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../constants/colors.dart';

class ProfilDosenDetail extends StatelessWidget {
  final String nip;
  final String nidn;
  final String nama;
  final String golakhir;
  final String jabatanFungsional;
  final String jenis;
  final String telp;

  const ProfilDosenDetail({
    super.key,
    required this.nip,
    required this.nidn,
    required this.nama,
    required this.golakhir,
    required this.jabatanFungsional,
    required this.jenis,
    required this.telp,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Detail Profil Dosen'),
        scrolledUnderElevation: 0.0,
      ),
      backgroundColor: const Color(0xfff3f3f3),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'NIP',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            if (nip == 'Kosong') ...[
                              const Text('-')
                            ] else ...[
                              SelectableText(nip),
                            ],
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'NIDN',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            if (nidn == 'Kosong') ...[
                              const Text('-')
                            ] else ...[
                              SelectableText(nidn),
                            ],
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Nama',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText(nama),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Golongan Akhir',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            if (golakhir == 'Kosong') ...[
                              const Text('-')
                            ] else ...[
                              SelectableText(golakhir),
                            ],
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Jabatan Fungsional',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            if (jabatanFungsional == 'Kosong') ...[
                              const Text('-')
                            ] else ...[
                              SelectableText(jabatanFungsional),
                            ],
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Telp',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            if (telp == 'Kosong') ...[
                              const Text('-')
                            ] else ...[
                              SelectableText(telp),
                            ]
                          ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
