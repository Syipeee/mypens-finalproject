import 'package:flutter/material.dart';
import 'package:mypens/constants/colors.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/list_vkegiatan_response.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/vpendaftar_response.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/penilaian_mbkm/mahasiswa_mbkm.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/vpendaftar_providers.dart';
import 'package:provider/provider.dart' as provider;

class ProgramMahasiswa extends StatefulWidget {
  const ProgramMahasiswa({Key? key}) : super(key: key);

  @override
  State<ProgramMahasiswa> createState() => _ProgramMahasiswaState();
}

class _ProgramMahasiswaState extends State<ProgramMahasiswa> {
  late List<bool> isTileExpandedList;
  TextEditingController searchController = TextEditingController();
  bool isSearchActive = false;
  late List<Vpendaftar> vPendaftar = [];
  List<Vpendaftar> filteredVKegiatanList = [];
  bool _refreshing = false; // Tambahkan atribut refreshing
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<
      RefreshIndicatorState>(); // Tambahkan key untuk RefreshIndicator

  @override
  void initState() {
    super.initState();
    _refreshData(); // Panggil metode _refreshData saat inisialisasi
    provider.Provider.of<VpendaftarProviders>(context, listen: false)
        .getVpendaftarData()
        .then((_) {
      setState(() {
        vPendaftar =
            provider.Provider.of<VpendaftarProviders>(context, listen: false)
                .vpendaftars!;
        isTileExpandedList =
            List<bool>.generate(vPendaftar.length, (index) => false);
        // Inisialisasi filteredVKegiatanList dengan vPendaftar awal
        filteredVKegiatanList = List.from(vPendaftar);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: RefreshIndicator(
        backgroundColor: yellowPens,
        key: _refreshIndicatorKey, // Set key untuk RefreshIndicator
        onRefresh: _refreshData,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.06,
                vertical: screenWidth * 0.12,
              ),
              child: Row(
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
                  if (isSearchActive)
                    SizedBox(
                      width: 230,
                      height: 40,
                      child: Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: searchController,
                          onChanged: (value) {
                            setState(() {
                              filteredVKegiatanList = vPendaftar
                                  .where((vPendaftar) => vPendaftar
                                      .namaKegiatan!
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                                  .toList();
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (!isSearchActive)
                    const Text(
                      'Program MBKM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSearchActive) {
                          searchController.clear();
                          filteredVKegiatanList = List.from(vPendaftar);
                        }
                        isSearchActive = !isSearchActive;
                      });
                    },
                    child: Container(
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
                        child: Icon(
                          isSearchActive ? Icons.clear : Icons.search,
                          size: 24,
                          color: Colors.blue,
                        ),
                      ),
                    ),
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06,
                    ),
                    child: buildProgramMahasiswa(screenWidth),
                  ),
                  Positioned(
                    top: screenWidth * 0.25,
                    bottom: screenWidth * 0.08,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.06,
                            ),
                            child: ListView.builder(
                              itemCount: filteredVKegiatanList.length,
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                final vPendaftar = filteredVKegiatanList[index];
                                return buildContentProgramMahasiswa(
                                    screenWidth, vPendaftar, index);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshData() async {
    setState(() {
      _refreshing = true; // Atur refreshing menjadi true saat sedang merefresh
    });

    // Lakukan proses refresh data di sini, misalnya panggil metode untuk mendapatkan data dari server
    await provider.Provider.of<VpendaftarProviders>(
      context,
      listen: false,
    ).getVpendaftarData();

    setState(() {
      _refreshing = false;
    });
  }

  Widget buildProgramMahasiswa(double screenWidth) {
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
                top: 20.0,
                left: 24.0,
                right: 24.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${vPendaftar.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.005),
                        const Text(
                          'PROGRAM MBKM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'PENS JOSS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
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

  Widget buildContentProgramMahasiswa(
      double screenWidth, Vpendaftar vPendaftar, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MahasiswaMBKM(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
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
            child: buildListTile(screenWidth, vPendaftar, index),
          ),
        ),
      ),
    );
  }

  Widget buildListTile(double screenWidth, Vpendaftar vPendaftar, int index) {
    String _truncateText(String text) {
      const maxLength = 25; // Maximum length of displayed text
      if (text.length <= maxLength) {
        return text; // Return original text if it's shorter than maxLength
      } else {
        return text.substring(0, maxLength - 1) +
            '..'; // Truncate text and add ellipsis
      }
    }

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _truncateText(vPendaftar.namaKegiatan ?? ''),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    vPendaftar.posisi ?? '',
                  ),
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
        if (isTileExpandedList[index])
          buildExpandedContent(screenWidth, vPendaftar),
      ],
    );
  }

  Widget buildExpandedContent(double screenWidth, Vpendaftar vPendaftar) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Di Buka Tanggal'),
              Text(
                vPendaftar.nama ?? '',
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Di Tutup Tanggal'),
              Text(vPendaftar.nama ?? ''),
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
                          screenWidth * 0.02,
                          8.0,
                          screenWidth * 0.03,
                          8.0,
                        ),
                        child: Text(
                          vPendaftar.nama ?? '',
                          style: const TextStyle(
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
