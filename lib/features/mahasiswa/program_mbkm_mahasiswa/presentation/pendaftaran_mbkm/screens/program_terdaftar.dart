import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/appstate.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/screens/menu_daftar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:mypens/controllers/common/user_controller.dart';
import '../data/api/api_service.dart';
import '../model/pendaftar_model.dart';
import '../provider/pendaftar_provider.dart';

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

class ProgramTerdaftar extends StatelessWidget {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Fetch pendaftars on init
    int idMahasiswa = Provider.of<UserController>(context, listen: false).userNomor;
    Provider.of<PendaftarProvider>(context, listen: false).fetchPendaftar(idMahasiswa);

    return Scaffold(
      appBar: AppBar(
        title: Text('Kegiatan Terdaftar'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Custom back button icon
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MenuDaftar()),
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
      body: Consumer<PendaftarProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (provider.pendaftars.isEmpty) {
            return Center(
              child: Text(
                'Anda belum mendaftar program',
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.pendaftars.length,
              itemBuilder: (context, index) {
                Pendaftar pendaftar = provider.pendaftars[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Text('Kegiatan Terdaftar: ${pendaftar.kegiatan}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tanggal Daftar: ${pendaftar.tanggalDaftar}'),
                          Text('Mitra: ${pendaftar.vmitra}'),
                          Text('Posisi: ${pendaftar.kegiatanPosisi}'),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(text: 'Status Aktif: '),
                                TextSpan(
                                    text: pendaftar.statusDiterima == "1" ? "Sudah Disetujui" : "Belum Disetujui",
                                    style: TextStyle(color: pendaftar.statusDiterima == "1" ? Colors.green : Colors.orange)
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(text: 'Status Approval: '),
                                TextSpan(
                                    text: pendaftar.statusApproval == "1" ? "Disetujui Dosen Wali" : pendaftar.statusApproval == "2" ? "Disetujui oleh Kaprodi" : "Pending",
                                    style: TextStyle(color: pendaftar.statusApproval == "1" || pendaftar.statusApproval == "2" ? Colors.green : Colors.orange)
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Alert(
                                context: context,
                                type: AlertType.warning,
                                title: "Konfirmasi",
                                desc: "Apakah Anda yakin ingin membatalkan pendaftaran?",
                                buttons: [
                                  DialogButton(
                                    child: Text("TIDAK", style: TextStyle(color: Colors.white, fontSize: 20)),
                                    onPressed: () => Navigator.pop(context),
                                    color: Colors.grey,
                                  ),
                                  DialogButton(
                                    child: Text("YA", style: TextStyle(color: Colors.white, fontSize: 20)),
                                    onPressed: () async {
                                      Navigator.pop(context);  // Close the alert dialog
                                      try {
                                        var response = await PendaftarApiClient().deletePendaftar(pendaftar.nomor);
                                        if (response.statusCode == 200) {
                                          // Optionally, remove the pendaftar from the list if successful
                                          Provider.of<PendaftarProvider>(context, listen: false).fetchPendaftar(idMahasiswa);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text("Pendaftaran berhasil dibatalkan"))
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text("Gagal membatalkan pendaftaran"))
                                          );
                                        }
                                      } catch (e) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Error: $e"))
                                        );
                                      }
                                    },
                                    color: Colors.red,
                                  ),
                                ],
                              ).show();
                            },
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            child: Text('Batalkan Pendaftaran', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}