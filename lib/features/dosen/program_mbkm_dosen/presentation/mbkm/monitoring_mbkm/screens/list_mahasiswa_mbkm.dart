import 'package:flutter/material.dart';
import 'package:mypens/controllers/common/user_controller.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/providers/read_vpendaftar_provider.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/screens/list_mingguan_logbook.dart';
import 'package:mypens/constants/colors.dart';
import 'package:provider/provider.dart' as provider;

class ListMahasiswaLogbookMbkm extends StatefulWidget {
  const ListMahasiswaLogbookMbkm({Key? key}) : super(key: key);

  @override
  State<ListMahasiswaLogbookMbkm> createState() =>
      _ListMahasiswaLogbookMbkmState();
}

class _ListMahasiswaLogbookMbkmState extends State<ListMahasiswaLogbookMbkm> {
  Map<String, bool> _isLoadingMap =
      {}; // Map untuk menyimpan status loading setiap card

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int idPembimbing =
          provider.Provider.of<UserController>(context, listen: false)
              .userNomor;
      provider.Provider.of<VPendaftarLogbookProvider>(context, listen: false)
          .fetchVPendaftarLogbook(idPembimbing);
    });
  }

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
              'Mahasiswa MBKM',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: provider.Consumer<VPendaftarLogbookProvider>(
          builder: (context, provider, _) {
            return ListView.builder(
              itemCount: provider.vpendaftar.length,
              itemBuilder: (context, index) {
                final vPendaftar = provider.vpendaftar[index];
                String noPendaftar = vPendaftar.nomor;
                bool isLoading = _isLoadingMap.containsKey(noPendaftar)
                    ? _isLoadingMap[noPendaftar]!
                    : false;

                return InkWell(
                  onTap: () {
                    setState(() {
                      _isLoadingMap[noPendaftar] =
                          true; // Set status loading card yang ditekan menjadi true
                    });
                    print('Navigating to Logbook: ${vPendaftar.nama}');
                    print('Start Date: ${vPendaftar.tanggalMulai}');
                    print('End Date: ${vPendaftar.tanggalBerakhir}');
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListMingguanLogbook(
                            noPendaftar: vPendaftar,
                            startDate: vPendaftar.tanggalMulai,
                            endDate: vPendaftar.tanggalBerakhir,
                          ),
                        ),
                      ).then((value) {
                        setState(() {
                          _isLoadingMap[noPendaftar] =
                              false; // Set status loading card yang ditekan menjadi false setelah proses selesai
                        });
                      });
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vPendaftar.nama,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: SizedBox(
                                    width: 90,
                                    height: 20,
                                    child: Center(
                                      child: Text(vPendaftar.nrp),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: SizedBox(
                                    width: 185,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        vPendaftar.namaKegiatan,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              vPendaftar.namaVmitra,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            isLoading // Menampilkan loading hanya jika status loading untuk card ini adalah true
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: yellowPens,
                                      valueColor:
                                          AlwaysStoppedAnimation(bluePens),
                                    ),
                                  )
                                : Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: bluePens,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          'Lihat Logbook',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
