// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:mypens/features/mahasiswa/pendaftaran_mbkm/provider/mitra_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:mypens/features/mahasiswa/pendaftaran_mbkm/model/model_form.dart';
// import 'package:mypens/features/mahasiswa/pendaftaran_mbkm/model/appstate.dart';
// import 'package:mypens/features/mahasiswa/pendaftaran_mbkm/screens/menu_daftar.dart';
// import 'package:mypens/features/mahasiswa/pendaftaran_mbkm/screens/program_terdaftar.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
//
// import 'package:mypens/features/mahasiswa/pendaftaran_mbkm/model/mitra_model.dart';
//
// class FormDaftar extends StatefulWidget {
//   @override
//   _FormDaftarState createState() => _FormDaftarState();
// }
//
// class _FormDaftarState extends State<FormDaftar> {
//   final _formKey = GlobalKey<FormState>();
//
//   Mitra? _selectedMitra;
//   String? _selectedPosisi;
//   String _urlInfoController = ''; // Use state management for URL
//
//   final List<String> _posisiOptions = ['FullStack', 'BackEnd', 'FrontEnd'];
//
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<MitraProvider>(context, listen: false).fetchMitra();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // final mitraProvider = Provider.of<MitraProvider>(context);
//     // final List<Mitra> mitras = mitraProvider.mitra;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daftar Kegiatan'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Center(
//               child: Column(
//                 children: [
//                   Text(
//                     'Pendaftaran Program MBKM',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(height: 30),
//                   Consumer<MitraProvider>(
//                     builder: (context, mitraProvider, child) {
//                       final List<Mitra> mitras = mitraProvider.mitra;
//                       return DropdownButtonFormField<Mitra>(
//                         value: _selectedMitra,
//                         decoration: InputDecoration(labelText: "Pilih Mitra"),
//                         items: mitras.map((Mitra mitra) {
//                           return DropdownMenuItem<Mitra>(
//                             value: mitra,
//                             child: Text(mitra.namaPerusahaan),
//                           );
//                         }).toList(),
//                         onChanged: (Mitra? newValue) {
//                           setState(() {
//                             _selectedMitra = newValue;
//                           });
//                         },
//                       );
//                     },
//                   ),
//
//                   SizedBox(height: 30),
//                   DropdownButtonFormField<String>(
//                     value: _selectedPosisi,
//                     decoration: InputDecoration(
//                       fillColor: Color(0xffF1F0F5),
//                       filled: true,
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide(),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide(),
//                       ),
//                       labelText: 'Pilih Posisi *',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Posisi harus dipilih';
//                       }
//                       return null;
//                     },
//                     items: _posisiOptions.map((posisi) => DropdownMenuItem<String>(
//                       value: posisi,
//                       child: Text(posisi),
//                     )).toList(),
//                     onChanged: (value) => setState(() => _selectedPosisi = value),
//                   ),
//                   SizedBox(height: 30),
//                   TextFormField(
//                     initialValue: _urlInfoController,
//                     decoration: InputDecoration(
//                       fillColor: Color(0xffF1F0F5),
//                       filled: true,
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide(),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide(),
//                       ),
//                       labelText: 'Url Info Kegiatan *',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'URL Info Kegiatan harus diisi';
//                       }
//                       return null;
//                     },
//                     onChanged: (value) => _urlInfoController = value!,
//                   ),
//                   SizedBox(height: 30),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             if (_selectedMitra != null) {
//                               final kegiatan = Kegiatan(
//                                 mitra: _selectedMitra!.namaPerusahaan,
//                                 // Use the selected values
//                                 posisi: _selectedPosisi!,
//                                 urlInfo: _urlInfoController,
//                               );
//
//
//                               final appState = Provider.of<AppState>(
//                                   context, listen: false);
//                               appState.addKegiatan(kegiatan);
//
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => ProgramTerdaftar()),
//                               );
//                             } else {
//
//                             }
//                             } else {
//                               Alert(
//                                 context: context,
//                                 type: AlertType.warning,
//                                 desc: "Semua field harus diisi.",
//                                 buttons: [
//                                   DialogButton(
//                                     child: Text(
//                                       "OK",
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 20),
//                                     ),
//                                     onPressed: () => Navigator.pop(context),
//                                     color: Color.fromRGBO(0, 179, 134, 1.0),
//                                   ),
//                                 ],
//                               ).show();
//                             }
//                           },
//                         child: Text('Submit'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/kegiatan_posisi_model.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/provider/kegiatan_posisi_provider.dart';
import 'package:provider/provider.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/provider/mitra_provider.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/model/mitra_model.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/screens/program_terdaftar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:mypens/controllers/common/user_controller.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/pendaftaran_mbkm/data/api/api_service.dart';

class FormDaftar extends StatefulWidget {
  @override
  _FormDaftarState createState() => _FormDaftarState();
}

class _FormDaftarState extends State<FormDaftar> {
  final _formKey = GlobalKey<FormState>();

  Mitra? _selectedMitra;
  KegiatanPosisi? _selectedPosisi;
  String _urlInfoController = '';

  // final List<String> _posisiOptions = ['FullStack', 'BackEnd', 'FrontEnd'];

  @override
  void initState() {
    super.initState();
    Provider.of<MitraProvider>(context, listen: false).fetchMitra();
    Provider.of<KegiatanPosisiProvider>(context, listen: false)
        .fetchKegiatanPosisi();
  }

  InputDecoration getInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.red, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kegiatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .stretch, // Make elements stretch to fill the column width
                children: [
                  Text(
                    'Pendaftaran Program MBKM',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 30),
                  Consumer<MitraProvider>(
                    builder: (context, mitraProvider, child) {
                      return Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<Mitra>(
                              isExpanded: true,
                              value: _selectedMitra,
                              decoration: InputDecoration(
                                labelText: "Pilih Mitra",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              items: mitraProvider.mitra.map((Mitra mitra) {
                                return DropdownMenuItem<Mitra>(
                                  value: mitra,
                                  child: Text(mitra.namaPerusahaan,
                                      overflow: TextOverflow.ellipsis),
                                );
                              }).toList(),
                              onChanged: (Mitra? newValue) {
                                setState(() {
                                  _selectedMitra = newValue;
                                });
                              },
                              validator: (value) =>
                                  value == null ? 'Mitra harus dipilih' : null,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  Consumer<KegiatanPosisiProvider>(
                    builder: (context, kegiatanPosisiProvider, child) {
                      return Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<KegiatanPosisi>(
                              isExpanded: true,
                              value: _selectedPosisi,
                              decoration: InputDecoration(
                                labelText: "Pilih Posisi",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              items: kegiatanPosisiProvider.kegiatanPosisi
                                  .map((KegiatanPosisi kegiatanPosisi) {
                                return DropdownMenuItem<KegiatanPosisi>(
                                  value: kegiatanPosisi,
                                  child: Text(kegiatanPosisi.posisi,
                                      overflow: TextOverflow.ellipsis),
                                );
                              }).toList(),
                              onChanged: (KegiatanPosisi? newValue) {
                                setState(() {
                                  _selectedPosisi = newValue;
                                });
                              },
                              validator: (value) =>
                                  value == null ? 'Posisi harus dipilih' : null,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "URL Kegiatan",
                            hintText: "Masukkan URL kegiatan",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onChanged: (value) {
                            _urlInfoController = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'URL kegiatan harus diisi';
                            }
                            // Regex untuk validasi URL
                            String pattern =
                                r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return 'Masukkan URL yang valid';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedMitra != null && _selectedPosisi != null) {
        try {
          String mahasiswaId =
              Provider.of<UserController>(context, listen: false)
                  .userNomor
                  .toString();
          String kegiatan = _selectedPosisi!.kegiatan;
          String vmitraId = _selectedMitra!.nomor;
          String kegiatanPosisiId = _selectedPosisi!.nomor;
          String urlInfo = _urlInfoController;

          var response = await PendaftarApiClient().insertPendaftar(
              mahasiswaId, kegiatan, vmitraId, kegiatanPosisiId, urlInfo);

          if (response.statusCode == 200) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProgramTerdaftar()),
            );
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Pendaftaran berhasil"),
              backgroundColor: Colors.green,
            ));
          } else {
            throw Exception('Failed to create pendaftar');
          }
        } catch (e) {
          Alert(
            context: context,
            type: AlertType.error,
            title: "Error",
            desc: "Gagal mengirim ke server",
            buttons: [
              DialogButton(
                child: Text("OK",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        }
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Error",
          desc: "All fields must be filled.",
          buttons: [
            DialogButton(
              child: Text("OK",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      }
    }
  }
}
