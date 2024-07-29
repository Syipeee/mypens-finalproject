import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mypens/controllers/common/user_controller.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/providers/logbook_pendaftar_provider.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/services/apiservices.dart';
import 'package:provider/provider.dart';

import '../providers/pendaftar_logbook_provider.dart';

class FormLogbookMbkm extends StatefulWidget {
  const FormLogbookMbkm({
    Key? key,
    required this.selectedDay,
    required this.selectedDate,
  }) : super(key: key);
  final String selectedDay;
  final String selectedDate;

  @override
  _FormLogbookMbkmState createState() => _FormLogbookMbkmState();
}

class _FormLogbookMbkmState extends State<FormLogbookMbkm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namakegiatanController = TextEditingController();
  TextEditingController urlDokumenController = TextEditingController();
  TextEditingController urlDokumentasiController = TextEditingController();
  TextEditingController noLogbookController = TextEditingController();
  final TextEditingController _nomorController = TextEditingController();
  late String selectedDate;

  LogbookPendaftarService logbookPendaftarService = LogbookPendaftarService();
  LogbookPendaftarDokumenService logbookPendaftarDokumenService =
      LogbookPendaftarDokumenService();
  LogbookPendaftarDokumentasiService logbookPendaftarDokumentasiService =
      LogbookPendaftarDokumentasiService();

  @override
  void dispose() {
    namakegiatanController.dispose();
    urlDokumenController.dispose();
    urlDokumentasiController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider =
          Provider.of<PendaftarLogbookProvider>(context, listen: false);
      int idMahasiswa =
          Provider.of<UserController>(context, listen: false).userNomor;
      provider.fetchPendaftarLogbook(idMahasiswa, (startDate, endDate) {
        _nomorController.text = provider.lastFetchedNomor?.toString() ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logbook MBKM'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      controller: TextEditingController(text: selectedDate),
                      decoration: InputDecoration(
                        labelText: 'Tanggal',
                        labelStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.date_range_rounded,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: namakegiatanController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Kegiatan/Materi',
                  labelStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.menu_book_sharp,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kegiatan/Materi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: urlDokumenController,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: 'URL Dokumen Logbook',
                  labelStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.menu_book_sharp,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'URL Dokumen Logbook tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: urlDokumentasiController,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: 'URL Dokumentasi Logbook',
                  labelStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.menu_book_sharp,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'URL Dokumentasi Logbook tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high,
                    );
                    final latitude = position.latitude;
                    final longitude = position.longitude;
                    try {
                      final response =
                          await logbookPendaftarService.insertLogbookPendaftar(
                              _nomorController.text,
                              namakegiatanController.text,
                              latitude.toString(),
                              longitude.toString());

                      if (response.statusCode == 200) {
                        final idMahasiswa =
                            Provider.of<UserController>(context, listen: false)
                                .userNomor;
                        await Provider.of<LogbookPendaftarProvider>(context,
                                listen: false)
                            .fetchLatestLogbook(idMahasiswa);
                        noLogbookController.text =
                            Provider.of<LogbookPendaftarProvider>(context,
                                        listen: false)
                                    .latestLogbook
                                    ?.nomor ??
                                '';
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data berhasil dikirim'),
                        ),
                      );
                    } catch (e) {
                      print('Gagal mengirim data: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Gagal mengirim data'),
                        ),
                      );
                    }
                    try {
                      final response = await logbookPendaftarDokumenService
                          .insertLogbookPendaftarDokumen(
                              noLogbookController.text,
                              urlDokumenController.text);
                      print(response.statusCode);
                      print(response.body);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data berhasil dikirim'),
                        ),
                      );
                    } catch (e) {
                      print('Gagal mengirim data: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Gagal mengirim data'),
                        ),
                      );
                    }
                    try {
                      final response = await logbookPendaftarDokumentasiService
                          .insertLogbookPendaftarDokumentasi(
                              noLogbookController.text,
                              urlDokumentasiController.text);
                      print(response.statusCode);
                      print(response.body);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data berhasil dikirim'),
                        ),
                      );
                    } catch (e) {
                      print('Gagal mengirim data: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Gagal mengirim data'),
                        ),
                      );
                    }
                    if (context.mounted)
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        Navigator.pop(context, widget.selectedDay);
                      });
                    print('Tanggal: $selectedDate');
                    print('Latitude: $latitude');
                    print('Kegiatan/Materi: ${namakegiatanController.text}');
                    print('Longitude: $longitude');
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  backgroundColor: const Color(0xFF0F75BC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const SizedBox(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 17.0,
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
    );
  }
}
