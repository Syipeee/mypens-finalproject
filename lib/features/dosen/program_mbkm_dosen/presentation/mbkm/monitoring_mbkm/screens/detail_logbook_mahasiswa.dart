import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/models/read_logbook_pendaftar_dokumen_model.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/models/read_logbook_pendaftar_model.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/models/read_vpendaftar_model.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/providers/read_logbook_pendaftar_dokumen_provider.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/providers/read_logbook_pendaftar_provider.dart';
import 'package:provider/provider.dart';

class DetailLogbookMahasiswa extends StatefulWidget {
  final String date;
  final VPendaftarLogbook pendaftar;

  const DetailLogbookMahasiswa(
      {Key? key, required this.date, required this.pendaftar})
      : super(key: key);

  @override
  State<DetailLogbookMahasiswa> createState() => _DetailLogbookMahasiswaState();
}

class _DetailLogbookMahasiswaState extends State<DetailLogbookMahasiswa> {
  LogbookPendaftar? _logbook;
  List<LogbookPendaftarDokumen>? _logbookDokumen;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    await _fetchLogbook();
    if (_logbook != null) {
      await _fetchLogbookDokumen(_logbook!.nomor); // Gunakan NOMOR dari logbook
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _fetchLogbook() async {
    try {
      final provider =
          Provider.of<LogbookPendaftarDosbimProvider>(context, listen: false);
      await provider.fetchLogbookPendaftar(int.parse(widget.pendaftar.nomor));
      setState(() {
        _logbook =
            provider.getLogbookByDate(widget.date, widget.pendaftar.nomor);
      });
    } catch (e) {
      print('Error fetching logbook: $e');
    }
  }

  Future<void> _fetchLogbookDokumen(String logbookPendaftarNomor) async {
    try {
      final provider = Provider.of<LogbookPendaftarDokumenDosbimProvider>(
          context,
          listen: false);
      await provider.fetchLogbookPendaftarDokumen(logbookPendaftarNomor);
      setState(() {
        _logbookDokumen =
            provider.getLogbookDokumenByNomor(logbookPendaftarNomor);
      });
      print('Logbook Dokumen: $_logbookDokumen'); // Debug statement
    } catch (e) {
      print('Error fetching logbook document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        'Building DetailLogbookMahasiswa with logbookDokumen: $_logbookDokumen'); // Debug statement

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
              'Detail Logbook Mahasiswa',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nama Mahasiswa',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller:
                        TextEditingController(text: widget.pendaftar.nama),
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12.0),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'NRP',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller:
                        TextEditingController(text: widget.pendaftar.nrp),
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12.0),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Kegiatan MBKM',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: TextEditingController(
                        text: widget.pendaftar.namaKegiatan),
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12.0),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tanggal Logbook',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: TextEditingController(text: widget.date),
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12.0),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Kegiatan / Materi',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: TextEditingController(
                        text: _logbook?.namaKegiatan.isEmpty ?? true
                            ? 'Logbook Tidak / Belum di Input'
                            : _logbook?.namaKegiatan),
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12.0),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Latitude',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: TextEditingController(
                                  text: _logbook?.latitude.isEmpty ?? true
                                      ? 'Logbook Tidak / Belum di Input'
                                      : _logbook?.latitude),
                              readOnly: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(12.0),
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Longitude',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: TextEditingController(
                                  text: _logbook?.longitude.isEmpty ?? true
                                      ? 'Logbook Tidak / Belum di Input'
                                      : _logbook?.longitude),
                              readOnly: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(12.0),
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'URL',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _logbookDokumen != null && _logbookDokumen!.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: _logbookDokumen!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                TextField(
                                  controller: TextEditingController(
                                      text: _logbookDokumen![index].url),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(12.0),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                              ],
                            );
                          },
                        )
                      : TextField(
                          controller:
                              TextEditingController(text: 'URL Tidak Tersedia'),
                          readOnly: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12.0),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                ],
              ),
      ),
    );
  }
}
