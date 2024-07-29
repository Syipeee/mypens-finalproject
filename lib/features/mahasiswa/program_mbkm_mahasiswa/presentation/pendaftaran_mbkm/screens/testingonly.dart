import 'package:flutter/material.dart';
// import 'package:mypens/features/mahasiswa/pendaftaran_mbkm/model/data_kegiatan.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/screens/detail_data_kegiatan.dart';

import '../provider/kegiatan_provider.dart';
import '../model/kegiatan_model.dart';
import 'menu_daftar.dart';
import 'package:provider/provider.dart';

// class DataKegiatan extends StatefulWidget {
//   const DataKegiatan({Key? key}) : super(key: key);
//   @override
//   _DataKegiatanState createState() => _DataKegiatanState();
// }
//
// class _DataKegiatanState extends State<DataKegiatan> {
//   TextEditingController controller = new TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Kegiatan Terdaftar'),
//         backgroundColor: Colors.blue,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black), // Custom back button icon
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => MenuDaftar()),
//             );
//           },
//         ),
//         // actions: [
//         //   IconButton(
//         //     padding: EdgeInsets.only(right: 20.0),
//         //     icon: Image.asset('assets/img/white.png'),
//         //     onPressed: (){
//         //       Navigator.pop(context);
//         //     },
//         //   ),
//         // ],
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(50.0),
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 7.0, left: 16.0, right: 16.0), // Menambahkan padding kanan kiri
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               child: SizedBox(
//                 width: 400,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: controller,
//                         decoration: InputDecoration(
//                           hintText: 'Cari Kegiatan',
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                         ),
//                         // onChanged: onSearchTextChanged,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 4.5),
//                       child: CircleAvatar(
//                         backgroundColor: Colors.blue,
//                         child: IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.search, color: Colors.white)
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           final Kegiatan kegiatan = kegiatanList[index];
//           return InkWell(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return DetailKegiatan(place: kegiatan);
//               }));
//             },
//             child: _buildListItem(context, kegiatan),
//           );
//         },
//         itemCount: kegiatanList.length,
//       ),
//     );
//   }
//
//   Widget _buildListItem(BuildContext context, Kegiatan kegiatan) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(width: 10),
//               Expanded(
//                 flex: 2,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       kegiatan.nama_kegiatan,
//                       style: TextStyle(fontSize: 25.0),
//                     ),
//                     SizedBox(height: 15),
//                     Text(kegiatan.keterangan),
//                     SizedBox(height: 15),
//                     Text('Tanggal Kegiatan: ${kegiatan.tanggal_awal_mulai} s/d ${kegiatan.tanggal_akhir_mulai}'),
//                     Text('Tanggal Pendaftaran: ${kegiatan.tanggal_awal_daftar} s/d ${kegiatan.tanggal_akhir_daftar}'),
//                     SizedBox(height: 15),
//                     Text('20 Hari Lagi',
//                       style: TextStyle(
//                         color: Colors.red,
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) =>
//                               DetailKegiatan(place: kegiatan)),
//                         );
//                       },
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             Colors.blue),
//                       ),
//                       child: Text('Daftar',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


class DataKegiatan extends StatefulWidget {
  const DataKegiatan({Key? key}) : super(key: key);
  @override
  _DataKegiatanState createState() => _DataKegiatanState();
}

class _DataKegiatanState extends State<DataKegiatan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kegiatans'),
      ),
      body: Consumer<KegiatanProvider>(
        builder: (context, kegiatanProvider, _) {
          if (kegiatanProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (kegiatanProvider.kegiatans.isEmpty) {
            return Center(child: Text('No kegiatans available'));
          } else {
            return ListView.builder(
              itemCount: kegiatanProvider.kegiatans.length,
              itemBuilder: (context, index) {
                Kegiatan kegiatan = kegiatanProvider.kegiatans[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  kegiatan.namaKegiatan,
                                  style: TextStyle(fontSize: 25.0),
                                ),
                                SizedBox(height: 15),
                                Text(kegiatan.keterangan),
                                SizedBox(height: 15),
                                Text('Tanggal Kegiatan: ${kegiatan.tanggalAwalPelaksanaan} s/d ${kegiatan.tanggalAkhirPelaksanaan}'),
                                Text('Tanggal Pendaftaran: ${kegiatan.tanggalAwalPendaftaran} s/d ${kegiatan.tanggalAkhirPendaftaran}'),
                                SizedBox(height: 15),
                                Text('20 Hari Lagi',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(height: 15),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) =>
                                    //       DetailKegiatan(place: kegiatan)),
                                    // );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                  ),
                                  child: Text('Daftar',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<KegiatanProvider>(context, listen: false)
              .fetchKegiatans();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}