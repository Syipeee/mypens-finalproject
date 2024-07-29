// import 'package:flutter/material.dart';
// import 'package:mypens/features/mahasiswa/pendaftaran_mbkm/model/kegiatan_model.dart';
// import 'package:mypens/features/mahasiswa/pendaftaran_mbkm/screens/daftar_kegiatan.dart';
//
// class DetailKegiatan extends StatelessWidget {
//   final Kegiatan kegiatan;
//   DetailKegiatan({Key? key, required this.kegiatan}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     const Color colorone = Color.fromRGBO(140, 138, 255, 1);
//     const Color colorfour = Colors.blueAccent;
//
//     return SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.blueAccent,
//             title: Text("Deskripsi"),
//             centerTitle: true,
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 //Container Kotak Atas
//                 Container(
//                   height: MediaQuery.of(context).size.height *29/80,
//                   decoration: BoxDecoration(
//                       color: Colors.white
//                   ),
//                   child: Stack(
//                     children: [
//                       // Kotak Cengkung Atas
//                       Container (
//                         constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height *3/16),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             bottomRight: Radius.circular(40),
//                             bottomLeft: Radius.circular(40),
//                           ),
//                           color: Colors.blueAccent,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: Offset(0, 3), // changes the position of the shadow
//                             ),
//                           ],
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Column(
//                           children: [
//                             Container(
//                               constraints: BoxConstraints.expand(
//                                 height: MediaQuery.of(context).size.width * 5 / 9,
//                                 width: MediaQuery.of(context).size.width * 6 / 9,
//                               ),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(40),
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.5),
//                                     spreadRadius: 2,
//                                     blurRadius: 5,
//                                     offset: Offset(0, 3), // changes the position of the shadow
//                                   ),
//                                 ],
//                               ),
//                               // child: FractionallySizedBox(
//                               //   heightFactor: 0.7, // Set the height factor to 0.5 (50% of available height)
//                               //   child: Image.asset(
//                               //     kegiatan.gambar,
//                               //     fit: BoxFit.fitHeight,
//                               //   ),
//                               // ),
//                             ),
//                             SizedBox(height: 10),
//                             Expanded(
//                               child: Text(
//                                 kegiatan.namaKegiatan,
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 2,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         ),
//
//                       )
//                     ],
//                   ),
//                 ),
//                 //Container Deskripsi
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white
//                   ),
//                   child: Column(
//                     children: [
//                       Container(
//                           width: double.infinity,
//                           margin: EdgeInsets.only(
//                             left: MediaQuery.of(context).size.width *5/80,
//                             right: MediaQuery.of(context).size.width *5/80,
//                           ),
//                           padding: EdgeInsets.only(
//                               top: MediaQuery.of(context).size.height *2/80,
//                               bottom: MediaQuery.of(context).size.height *2/80,
//                               left: 0,
//                               right: 0
//                           ),
//                           decoration: BoxDecoration(
//                               color: Colors.white
//                           ),
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.only(right: 15),
//                                       height: 20.0,
//                                       width: 20.0,
//                                       decoration: new BoxDecoration(
//                                         color: colorfour ,
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     Text("Keterangan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
//                                   ],
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 25),
//                                     Expanded(
//                                       child: Text(
//                                         kegiatan.keterangan,
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 4,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )
//                       ),
//                       Container(
//                           width: double.infinity,
//                           margin: EdgeInsets.only(
//                             left: MediaQuery.of(context).size.width *5/80,
//                             right: MediaQuery.of(context).size.width *5/80,
//                           ),
//                           padding: EdgeInsets.only(
//                               top: MediaQuery.of(context).size.height *2/80,
//                               bottom: MediaQuery.of(context).size.height *2/80,
//                               left: 0,
//                               right: 0
//                           ),
//                           decoration: BoxDecoration(
//                               color: Colors.white
//                           ),
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.only(right: 15),
//                                       height: 20.0,
//                                       width: 20.0,
//                                       decoration: new BoxDecoration(
//                                         color: colorfour ,
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text("Tanggal mulai", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
//                                   ],
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 25,),
//                                     Expanded(
//                                       child: Text(
//                                         '${kegiatan.tanggalAwalPendaftaran} s/d ${kegiatan.tanggalAkhirPendaftaran}',
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 4,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )
//                       ),
//                       Container(
//                           width: double.infinity,
//                           margin: EdgeInsets.only(
//                             left: MediaQuery.of(context).size.width *5/80,
//                             right: MediaQuery.of(context).size.width *5/80,
//                           ),
//                           padding: EdgeInsets.only(
//                               top: MediaQuery.of(context).size.height *2/80,
//                               bottom: MediaQuery.of(context).size.height *2/80,
//                               left: 0,
//                               right: 0
//                           ),
//                           decoration: BoxDecoration(
//                               color: Colors.white
//                           ),
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.only(right: 15),
//                                       height: 20.0,
//                                       width: 20.0,
//                                       decoration: new BoxDecoration(
//                                         color: colorfour ,
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text("Tanggal Pelaksanaan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
//                                   ],
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 25,),
//                                     Expanded(
//                                       child: Text(
//                                         '${kegiatan.tanggalAwalPelaksanaan} s/d ${kegiatan.tanggalAkhirPelaksanaan}',
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 4,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )
//                       ),
//                       Container(
//                           width: double.infinity,
//                           margin: EdgeInsets.only(
//                             left: MediaQuery.of(context).size.width *5/80,
//                             right: MediaQuery.of(context).size.width *5/80,
//                           ),
//                           padding: EdgeInsets.only(
//                               top: MediaQuery.of(context).size.height *2/80,
//                               bottom: MediaQuery.of(context).size.height *2/80,
//                               left: 0,
//                               right: 0
//                           ),
//                           decoration: BoxDecoration(
//                               color: Colors.white
//                           ),
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.only(right: 15),
//                                       height: 20.0,
//                                       width: 20.0,
//                                       decoration: new BoxDecoration(
//                                         color: colorfour ,
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text("Kuota", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
//                                   ],
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 25,),
//                                     Expanded(
//                                       child: Text(
//                                         kegiatan.kuota,
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 4,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )
//                       ),
//                       Container(
//                           width: double.infinity,
//                           margin: EdgeInsets.only(
//                             left: MediaQuery.of(context).size.width *5/80,
//                             right: MediaQuery.of(context).size.width *5/80,
//                           ),
//                           padding: EdgeInsets.only(
//                               top: MediaQuery.of(context).size.height *2/80,
//                               bottom: MediaQuery.of(context).size.height *2/80,
//                               left: 0,
//                               right: 0
//                           ),
//                           decoration: BoxDecoration(
//                               color: Colors.white
//                           ),
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.only(right: 15),
//                                       height: 20.0,
//                                       width: 20.0,
//                                       decoration: new BoxDecoration(
//                                         color: colorfour ,
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text("Keterangan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
//                                   ],
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 25,),
//                                     Expanded(
//                                       child: Text(
//                                         kegiatan.keterangan,
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 4,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           floatingActionButton: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => FormDaftar()),
//                 );
//               },
//               child: Text('Daftar',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(colorfour),
//               ),
//             ),
//           ),
//         )
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/kegiatan_model.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/screens/daftar_kegiatan.dart';

class DetailKegiatan extends StatelessWidget {
  final Kegiatan kegiatan;
  DetailKegiatan({Key? key, required this.kegiatan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.blue;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Deskripsi Kegiatan"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kegiatan.namaKegiatan,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: primaryColor),
                    ),
                    SizedBox(height: 10),
                    Text(
                      kegiatan.keterangan,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Tanggal Pendaftaran: ${kegiatan.tanggalAwalPendaftaran} s/d ${kegiatan.tanggalAkhirPendaftaran}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Tanggal Pelaksanaan: ${kegiatan.tanggalAwalPelaksanaan} s/d ${kegiatan.tanggalAkhirPelaksanaan}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Kuota: ${kegiatan.kuota}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormDaftar()),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
              child: Text('Daftar Sekarang', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
