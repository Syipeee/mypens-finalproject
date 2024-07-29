import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/pendaftaran_mbkm/home_pendaftaran_dosen.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:mypens/constants/colors.dart';

import 'package:mypens/controllers/common/user_controller.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/pendaftaran_mbkm/data/api_service.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/pendaftaran_mbkm/model/pendaftar_dosen_model.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/pendaftaran_mbkm/provider/pendaftar_provider_dosen.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/pendaftaran_mbkm/model/mahasiswa_dosen_model.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/pendaftaran_mbkm/provider/mahasiswa_dosen_provider.dart';

// class ProgramTerdaftar extends StatelessWidget {
//   TextEditingController controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     int idMahasiswa = Provider.of<UserController>(context, listen: false).userNomor;
//     Provider.of<PendaftarProvider>(context, listen: false).fetchPendaftar(idMahasiswa);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Kegiatan Terdaftar'),
//         backgroundColor: Colors.blue,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuDaftar())),
//         ),
//       ),
//       body: Consumer<PendaftarProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (provider.pendaftars.isEmpty) {
//             return Center(child: Text('Anda belum mendaftar program', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)));
//           }
//           return ListView.builder(
//             itemCount: provider.pendaftars.length,
//             itemBuilder: (context, index) {
//               Pendaftar pendaftar = provider.pendaftars[index];
//               return Card(
//                 margin: EdgeInsets.all(8),
//                 child: ListTile(
//                   title: Text('Kegiatan: ${pendaftar.kegiatan}'),
//                   subtitle: buildPendaftarDetails(context, pendaftar),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Widget buildPendaftarDetails(BuildContext context, Pendaftar pendaftar) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Tanggal Daftar: ${pendaftar.tanggalDaftar}'),
//         Text('Mitra: ${pendaftar.vmitra}'),
//         Text('Posisi: ${pendaftar.kegiatanPosisi}'),
//         Text('Status Aktif: ${pendaftar.statusDiterima == "1" ? "Sudah Disetujui" : "Belum Disetujui"}',
//             style: TextStyle(color: pendaftar.statusDiterima == "1" ? Colors.green : Colors.red)),
//         Text('Status Approval: ${getApprovalStatus(pendaftar.statusApproval)}',
//             style: TextStyle(color: getApprovalColor(pendaftar.statusApproval))),
//         SizedBox(height: 10),
//         ElevatedButton(
//           onPressed: () => handleButtonAction(context, pendaftar),
//           style: ElevatedButton.styleFrom(backgroundColor: getButtonColor(pendaftar.statusApproval)),
//           child: Text(getButtonText(pendaftar.statusApproval)
//           ,style: TextStyle(color: Colors.white)),
//         ),
//       ],
//     );
//   }
//
//   String getApprovalStatus(String? status) {
//     switch (status) {
//       case "1": return "Disetujui Dosen Wali";
//       case "2": return "Disetujui oleh Kaprodi";
//       default: return "Pending";
//     }
//   }
//
//   Color getApprovalColor(String? status) {
//     return (status == "1" || status == "2") ? Colors.green : Colors.orange;
//   }
//
//   void handleButtonAction(BuildContext context, Pendaftar pendaftar) {
//     if (pendaftar.statusApproval == "1" || pendaftar.statusApproval == "2") {
//       // Logic to upload proof
//     } else {
//       // Cancel registration logic
//       showCancelConfirmation(context, pendaftar);
//     }
//   }
//
//   String getButtonText(String? status) {
//     return (status == "1" || status == "2") ? "Unggah Form Bukti Diterima" : "Batalkan Pendaftaran";
//   }
//
//   Color getButtonColor(String? status) {
//     return (status == "1" || status == "2") ? Colors.blue : Colors.red;
//   }
//
//   void showCancelConfirmation(BuildContext context, Pendaftar pendaftar) {
//     Alert(
//       context: context,
//       type: AlertType.warning,
//       title: "Konfirmasi",
//       desc: "Apakah Anda yakin ingin membatalkan pendaftaran?",
//       buttons: [
//         DialogButton(
//           child: Text("TIDAK", style: TextStyle(color: Colors.white, fontSize: 20)),
//           onPressed: () => Navigator.pop(context),
//           color: Colors.grey,
//         ),
//         DialogButton(
//           child: Text("YA", style: TextStyle(color: Colors.white, fontSize: 20)),
//           onPressed: () async {
//             Navigator.pop(context);  // Close the alert dialog
//             try {
//               var response = await PendaftarApiClient().deletePendaftar(pendaftar.nomor);
//               if (response.statusCode == 200) {
//                 // Optionally, remove the pendaftar from the list if successful
//                 Provider.of<PendaftarProvider>(context, listen: false).fetchPendaftar(idMahasiswa);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text("Pendaftaran berhasil dibatalkan"))
//                 );
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text("Gagal membatalkan pendaftaran"))
//                 );
//               }
//             } catch (e) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("Error: $e"))
//               );
//             }
//           },
//           color: Colors.red,
//         ),
//       ],
//     ).show();
//   }
// }

class PendaftarPage extends StatelessWidget {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Fetch pendaftars on init
    int idMahasiswa = Provider.of<UserController>(context, listen: false).userNomor;
    Provider.of<PendaftarDosenProvider>(context, listen: false).fetchPendaftar();

    return Scaffold(
      appBar: AppBar(
        title: Text('Kegiatan Terdaftar'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Custom back button icon
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePendaftaranDosen()),
            );
          },
        ),
        // actions: [
        //   IconButton(
        //     padding: EdgeInsets.only(right: 20.0),
        //     icon: Image.asset('assets/img/white.png'),
        //     onPressed: (){
        //       Navigator.pop(context);
        //     },
        //   ),
        // ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 7.0, left: 16.0, right: 16.0), // Menambahkan padding kanan kiri
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: SizedBox(
                width: 400,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: 'Cari Kegiatan',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                        // onChanged: onSearchTextChanged,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.5),
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search, color: Colors.white)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Consumer2<PendaftarDosenProvider, MahasiswaByIdDosenProvider>(
        builder: (context, pendaftarProvider, mahasiswaProvider, child) {
          if (pendaftarProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (pendaftarProvider.pendaftars.isEmpty) {
            return Center(
              child: Text(
                'Anda belum mendaftar program',
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: pendaftarProvider.pendaftars.length,
              itemBuilder: (context, index) {
                PendaftarDosen pendaftar = pendaftarProvider.pendaftars[index];

                // Cek apakah nomor mahasiswa ada dalam list nomor mahasiswa dari mahasiswaByIdDosen
                bool isMahasiswaExists = mahasiswaProvider.mahasiswas.any((mahasiswa) => mahasiswa.nomor == pendaftar.mahasiswa);

                // Peroleh data nama mahasiswa dari provider MahasiswaByIdDosenProvider
                String namaMahasiswa = '';
                String nrp = '';
                if (isMahasiswaExists) {
                  MahasiswaByIdDosen mahasiswa = mahasiswaProvider.mahasiswas.firstWhere((mahasiswa) => mahasiswa.nomor == pendaftar.mahasiswa);
                  namaMahasiswa = mahasiswa.nama;
                  nrp = mahasiswa.nrp;
                }

                // Jika nomor mahasiswa ada, tampilkan pendaftar
                if (isMahasiswaExists) {
                  // return Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Card(
                  //     child: ListTile(
                  //       title: Text('Kegiatan Terdaftar: ${pendaftar.kegiatan}'),
                  //       subtitle: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text('Nama Mahasiswa: $namaMahasiswa'),
                  //           Text('NRP: $nrp'),
                  //           Text('Tanggal Daftar: ${pendaftar.tanggalDaftar}'),
                  //           Text('')
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // );
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8,
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 16.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(namaMahasiswa,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(nrp,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6.0,
                                    vertical: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: bluePens,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    pendaftar.kegiatan,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                ClipRRect(
                                  child: Slidable(
                                    key: ValueKey('ini read pendaftar'),
                                    endActionPane: ActionPane(
                                      extentRatio: 0.25,
                                      motion: const StretchMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {
                                            // _showEditDialog(
                                            //   context,
                                            //   readAssessment.nomor,
                                            //   readAssessment.nilai,
                                            //   readAssessment.tanggal,
                                            // );
                                          },
                                          backgroundColor: yellowPens,
                                          foregroundColor: Colors.white,
                                          icon: Icons.edit,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0,
                                          ),
                                        ),
                                        SlidableAction(
                                          onPressed: (context) {
                                            // _showDeleteDialog(
                                            //   context,
                                            //   readAssessment.nomor,
                                            // );
                                          },
                                          backgroundColor:
                                          const Color(0xFFFE4A49),
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey[300]!,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          const Row(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Text(
                                                  'Kategori Assessment',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  'Nilai',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Text(
                                                  'Belum Tersedia',
                                                  // readAssessment
                                                  //     .kategoriAssessment,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text('80',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container(); // Atau Widget kosong lainnya
                }
              },
            );
          }
        },
      ),
    );
  }
}