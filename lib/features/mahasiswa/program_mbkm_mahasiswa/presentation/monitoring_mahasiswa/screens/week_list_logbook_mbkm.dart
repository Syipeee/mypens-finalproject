import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mypens/controllers/common/user_controller.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/providers/logbook_monitoring_provider.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/providers/pendaftar_logbook_provider.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/screens/day_list_logbook_mbkm.dart';
import 'package:provider/provider.dart';
import '../services/logbook.dart';

class WeekListLogbookMbkm extends StatefulWidget {
  const WeekListLogbookMbkm({Key? key}) : super(key: key);

  @override
  State<WeekListLogbookMbkm> createState() => _WeekListLogbookMbkmState();
}

class _WeekListLogbookMbkmState extends State<WeekListLogbookMbkm> {
  List<DateRange>? weeks;
  late DateTime today;
  Map<DateRange, List<String>> logbookStatus =
      {}; // Menyimpan status logbook untuk setiap minggu
  final TextEditingController _nomorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    final provider =
        Provider.of<PendaftarLogbookProvider>(context, listen: false);
    int idMahasiswa =
        Provider.of<UserController>(context, listen: false).userNomor;
    provider.fetchPendaftarLogbook(idMahasiswa, (startDate, endDate) {
      _nomorController.text = provider.lastFetchedNomor?.toString() ?? '';
      setState(() {
        weeks = _generateWeeks(startDate, endDate);
        // Inisialisasi status logbook untuk setiap minggu
        for (var week in weeks!) {
          logbookStatus[week] = List.filled(5, 'empty');
        }
      });
    });
  }

  String _formatDateTimeToString(String date) {
    try {
      DateTime parsedDate = DateFormat('d/M/yyyy').parse(date);
      return DateFormat('dd-MMM-yy').format(parsedDate).toUpperCase();
    } catch (e) {
      print('Error formatting date: $e');
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logbook Mingguan MBKM'),
      ),
      body: weeks == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (int i = 0; i < weeks!.length; i++)
                      Builder(
                        builder: (context) {
                          final String formattedStartDate =
                              _formatDate(weeks![i].startDate);
                          final String formattedEndDate =
                              _formatDate(weeks![i].endDate);
                          final String formatStartDate =
                              _formatDateTimeToString(formattedStartDate);
                          final String formatEndDate =
                              _formatDateTimeToString(formattedEndDate);
                          print(formatStartDate);
                          print(formatEndDate);
                          return Container(
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${_formatDate(weeks![i].startDate)} -',
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${_formatDate(weeks![i].endDate)}',
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Minggu Ke - ${i + 1}',
                                      style: const TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          for (int j = 0;
                                              j <
                                                  LogbookConstants
                                                      .statusHari.length;
                                              j++)
                                            Column(
                                              children: [
                                                Container(
                                                  width: 24.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.grey[350],
                                                  ),
                                                  child: Center(
                                                    child: _buildStatusIcon(
                                                        logbookStatus[
                                                                weeks![i]]![
                                                            j]), // Gunakan status dari map
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 4.0,
                                                ),
                                                Text(
                                                  LogbookConstants.daysOfWeek[j]
                                                      .substring(0, 1),
                                                  style: const TextStyle(
                                                      fontSize: 12.0),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 80.0,
                                            child: ElevatedButton(
                                              onPressed: today.isAfter(weeks![i]
                                                          .startDate
                                                          .subtract(
                                                              const Duration(
                                                                  days: 1))) &&
                                                      today.isBefore(weeks![i]
                                                          .endDate
                                                          .add(const Duration(
                                                              days: 1)))
                                                  ? () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              DayListLogbookMbkm(
                                                                  selectedDate:
                                                                      weeks![i]
                                                                          .startDate,
                                                                  statusHari:
                                                                      logbookStatus[
                                                                          weeks![
                                                                              i]]!), // Kirim status minggu yang sesuai
                                                        ),
                                                      ).then((result) {
                                                        if (result != null) {
                                                          setState(() {
                                                            logbookStatus[
                                                                    weeks![i]] =
                                                                result; // Perbarui status hari berdasarkan hasil dari halaman DayList
                                                          });
                                                        }
                                                      });
                                                    }
                                                  : null,
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 8,
                                                ),
                                                backgroundColor:
                                                    const Color(0xFF0F75BC),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                              ),
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: today.isAfter(weeks![i]
                                                            .startDate
                                                            .subtract(
                                                                const Duration(
                                                                    days:
                                                                        1))) &&
                                                        today.isBefore(weeks![i]
                                                            .endDate
                                                            .add(const Duration(
                                                                days: 1)))
                                                    ? const Text(
                                                        'Lengkapi',
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.white,
                                                        ),
                                                      )
                                                    : const Icon(
                                                        Icons.lock,
                                                        size: 24.0,
                                                        color: Colors.white,
                                                      ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 16.0),
                                          SizedBox(
                                            width: 80.0,
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                String noPendaftar =
                                                    _nomorController.text;
                                                print(noPendaftar);
                                                try {
                                                  await Provider.of<
                                                      LogbookMonitoringProvider>(
                                                    context,
                                                    listen: false,
                                                  ).fetchLogbookMonitoring(
                                                      formatStartDate,
                                                      formatEndDate,
                                                      noPendaftar);
                                                } catch (e) {
                                                  print(
                                                      'Error fetching data: $e');
                                                }
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder:
                                                      (BuildContext builder) {
                                                    return Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              )),
                                                      height: 430,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Text(
                                                                      'Pembimbing',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            14.0,
                                                                        color: Colors
                                                                            .black,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            8.0),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(6.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              const Color(0xFF0F75BC),
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                      child: Consumer<
                                                                          LogbookMonitoringProvider>(
                                                                        builder: (context,
                                                                            provider,
                                                                            _) {
                                                                          return ElevatedButton(
                                                                            onPressed:
                                                                                () {},
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              backgroundColor: Colors.white,
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                                                              padding: const EdgeInsets.symmetric(
                                                                                vertical: 14,
                                                                                horizontal: 36,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              provider.getPembimbingApprovalText(),
                                                                              textAlign: TextAlign.center,
                                                                              style: const TextStyle(
                                                                                color: Color(0xFF0F75BC),
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    width:
                                                                        16.0),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Text(
                                                                      'Mitra',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            14.0,
                                                                        color: Colors
                                                                            .black,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            8.0),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(6.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              const Color(0xFF0F75BC),
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                      child: Consumer<
                                                                          LogbookMonitoringProvider>(
                                                                        builder: (context,
                                                                            provider,
                                                                            _) {
                                                                          return ElevatedButton(
                                                                            onPressed:
                                                                                () {},
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              backgroundColor: Colors.white,
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                                                              padding: const EdgeInsets.symmetric(
                                                                                vertical: 14,
                                                                                horizontal: 36,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              provider.getMitraApprovalText(),
                                                                              textAlign: TextAlign.center,
                                                                              style: const TextStyle(
                                                                                color: Color(0xFF0F75BC),
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 12),
                                                            Container(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: const Text(
                                                                'Catatan Tambahan Pembimbing',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 8.0),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 8.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Consumer<
                                                                  LogbookMonitoringProvider>(
                                                                builder:
                                                                    (context,
                                                                        provider,
                                                                        _) {
                                                                  return TextField(
                                                                    controller:
                                                                        TextEditingController(
                                                                            text:
                                                                                provider.getPembimbingCatatan()),
                                                                    enabled:
                                                                        false,
                                                                    maxLines: 3,
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 8.0),
                                                            Container(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: const Text(
                                                                'Catatan Tambahan Mitra',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 8.0),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 8.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Consumer<
                                                                  LogbookMonitoringProvider>(
                                                                builder:
                                                                    (context,
                                                                        provider,
                                                                        _) {
                                                                  return TextField(
                                                                    controller:
                                                                        TextEditingController(
                                                                            text:
                                                                                provider.getMitraCatatan()),
                                                                    enabled:
                                                                        false,
                                                                    maxLines: 3,
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 8,
                                                ),
                                                backgroundColor:
                                                    const Color(0xFF0F75BC),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                              ),
                                              child: const FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  'Status',
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildStatusIcon(String status) {
    switch (status) {
      case 'check':
        return const Icon(
          Icons.check,
          color: Colors.black,
          size: 16.0,
        );
      case 'cross':
        return const Icon(
          Icons.close,
          color: Colors.black,
          size: 16.0,
        );
      case 'empty':
      default:
        return const SizedBox();
    }
  }

  List<DateRange> _generateWeeks(DateTime startDate, DateTime endDate) {
    List<DateRange> weeks = [];
    DateTime tempStart =
        DateTime(startDate.year, startDate.month, startDate.day);
    while (tempStart.isBefore(endDate) || tempStart.isAtSameMomentAs(endDate)) {
      while (tempStart.weekday != DateTime.monday) {
        tempStart = tempStart.add(const Duration(days: 1));
      }
      if (tempStart.isAfter(endDate)) break;
      DateTime tempEnd = tempStart.add(const Duration(days: 4)); // Jumat
      if (tempEnd.isAfter(endDate)) tempEnd = endDate;
      weeks.add(DateRange(tempStart, tempEnd));
      tempStart = tempEnd.add(const Duration(days: 2)); // Minggu
    }
    return weeks;
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
