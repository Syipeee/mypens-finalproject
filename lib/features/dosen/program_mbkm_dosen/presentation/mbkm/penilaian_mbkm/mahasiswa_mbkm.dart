import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mypens/constants/colors.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/components/custom_appbar.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/penilaian_mbkm/insert_asssessment_page.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/penilaian_mbkm/read_assessement_page.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/vpendaftar_providers.dart';
import 'package:provider/provider.dart' as provider;

class MahasiswaMBKM extends StatefulWidget {
  const MahasiswaMBKM({Key? key});

  @override
  State<MahasiswaMBKM> createState() => _MahasiswaMBKMState();
}

class _MahasiswaMBKMState extends State<MahasiswaMBKM> {
  TextEditingController searchController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final vPendaftarProvider = provider.Provider.of<VpendaftarProviders>(
        context,
        listen: false,
      ).getVpendaftarData();
      print('Respon Pendaftar: ${jsonEncode(vPendaftarProvider)}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Mahasiswa MSIM",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            // Widget pencarian
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Cari',
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  suffixIconConstraints: const BoxConstraints(
                    minWidth: 45,
                    minHeight: 40,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.blue,
                      ),
                      child: const Icon(
                        Icons.filter_list_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: provider.Consumer<VpendaftarProviders>(
                  builder: (context, provider, child) {
                    final vpendaftar = provider.vpendaftars;
                    print('Response Belly: ${jsonEncode(vpendaftar)}');

                    if (vpendaftar == null) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: yellowPens,
                          valueColor: AlwaysStoppedAnimation(bluePens),
                        ),
                      );
                    }

                    final filteredVpendaftar = vpendaftar.where((vpendaftar) {
                      return (vpendaftar.nama ?? '').toLowerCase().contains(
                            searchController.text.toLowerCase(),
                          );
                    }).toList();

                    // ListView untuk menampilkan data
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredVpendaftar.length,
                      itemBuilder: (context, index) {
                        final vPendaftar = filteredVpendaftar[index];
                        // Widget untuk menampilkan data
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const InsertAssessmentPage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.grey[300]!,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 16,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          vPendaftar.nama ?? '',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.blue[100],
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Text(
                                                vPendaftar.posisi ?? '',
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Text(
                                                vPendaftar.nrp ?? '',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          vPendaftar.namaPembimbing != null &&
                                                  vPendaftar.namaPembimbing!
                                                      .isNotEmpty
                                              ? vPendaftar.namaPembimbing!
                                              : 'Belum Tersedia',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            color: vPendaftar.namaPembimbing !=
                                                        null &&
                                                    vPendaftar.namaPembimbing!
                                                        .isNotEmpty
                                                ? Colors.black
                                                : Colors.amber,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          vPendaftar.namaVmitra != null
                                              ? vPendaftar.namaVmitra!
                                              : 'Belum Tersedia',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              _isLoading = true;
                                            });
                                            // Simulate network delay for 2 seconds
                                            Future.delayed(
                                                const Duration(seconds: 1), () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const VReadAssessmentPage(),
                                                ),
                                              ).then((value) {
                                                setState(() {
                                                  _isLoading = false;
                                                });
                                              });
                                            });
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: bluePens,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Text(
                                                  'Lihat Nilai',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
