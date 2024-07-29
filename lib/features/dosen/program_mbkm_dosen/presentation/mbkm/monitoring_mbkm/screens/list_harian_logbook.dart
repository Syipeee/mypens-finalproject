import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mypens/constants/colors.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/models/read_vpendaftar_model.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/screens/detail_logbook_mahasiswa.dart';
import 'package:http/http.dart' as http;
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/monitoring_mbkm/services/apiservices.dart';

class ListHarianLogbook extends StatefulWidget {
  final String rangeDates;
  final VPendaftarLogbook noPendaftar;

  const ListHarianLogbook({
    Key? key,
    required this.rangeDates,
    required this.noPendaftar,
  }) : super(key: key);

  @override
  State<ListHarianLogbook> createState() => _ListHarianLogbookState();
}

class _ListHarianLogbookState extends State<ListHarianLogbook> {
  List<String> dailyEntries = [];
  List<bool> isLoadingList = [];
  final TextEditingController _catatanController = TextEditingController();
  bool _isInserting = false;

  @override
  void initState() {
    super.initState();
    parseRangeDates(widget.rangeDates);
  }

  void parseRangeDates(String rangeDates) {
    try {
      final dates = rangeDates.split(' - ');
      if (dates.length == 2) {
        DateTime startDate = DateFormat('dd MMM yyyy').parse(dates[0]);
        DateTime endDate = DateFormat('dd MMM yyyy').parse(dates[1]);

        while (!startDate.isAfter(endDate)) {
          dailyEntries.add(DateFormat('dd MMM yyyy').format(startDate));
          isLoadingList.add(false);
          startDate = startDate.add(Duration(days: 1));
        }
        setState(() {});
      }
    } catch (e) {
      print('Error parsing range dates: $e');
    }
  }

  String getDayName(String date) {
    DateTime dateTime = DateFormat('dd MMM yyyy').parse(date);
    List<String> days = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu'
    ];
    return days[dateTime.weekday - 1];
  }

  Future<void> _insertLogbook() async {
    setState(() {
      _isInserting = true;
    });

    LogbookMonitoringServices service = LogbookMonitoringServices();
    String catatan = _catatanController.text;
    String pendaftar = widget.noPendaftar.nomor;
    String tanggalAwal = DateFormat('dd-MMM-yy')
        .format(DateFormat('dd MMM yyyy').parse(dailyEntries.first));
    String tanggalAkhir = DateFormat('dd-MMM-yy')
        .format(DateFormat('dd MMM yyyy').parse(dailyEntries.last));
    String approval = '1';

    http.Response response = await service.insertLogbookMonitoring(
      pendaftar,
      tanggalAwal,
      tanggalAkhir,
      catatan,
      approval,
    );

    setState(() {
      _isInserting = false;
    });

    if (response.statusCode == 200) {
      Navigator.pop(context); // Menutup popup
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logbook berhasil di-approve')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal meng-approve logbook')),
      );
    }
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
              'Logbook Harian Mahasiswa',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext builder) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Catatan Tambahan Pembimbing',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                TextField(
                                  controller: _catatanController,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: _isInserting ? null : _insertLogbook,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                minimumSize: const Size.fromHeight(40),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 36,
                                ),
                                backgroundColor: bluePens,
                              ),
                              child: _isInserting
                                  ? const CircularProgressIndicator(
                                      backgroundColor: yellowPens,
                                      valueColor:
                                          AlwaysStoppedAnimation(bluePens),
                                    )
                                  : const Text(
                                      'Approve',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: bluePens,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: const Text(
              'Approve Logbook',
              style: TextStyle(color: whiteColor),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                itemCount: dailyEntries.length,
                itemBuilder: (context, index) {
                  final date = dailyEntries[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isLoadingList[index] = true;
                            });
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailLogbookMahasiswa(
                                    date: date,
                                    pendaftar: widget.noPendaftar,
                                  ),
                                ),
                              ).then((value) {
                                setState(() {
                                  isLoadingList[index] = false;
                                });
                              });
                            });
                          },
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
                                    date,
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
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: SizedBox(
                                          width: 60,
                                          height: 20,
                                          child: Center(
                                            child: Text(getDayName(date)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  isLoadingList[index]
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                            backgroundColor: yellowPens,
                                            valueColor: AlwaysStoppedAnimation(
                                                bluePens),
                                          ),
                                        )
                                      : Container(
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
                                                'Lihat',
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
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
