import 'package:flutter/material.dart';
import 'package:mypens/features/mahasiswa/program_mbkm_mahasiswa/presentation/monitoring_mahasiswa/screens/form_logbook_mbkm.dart';
import '../services/logbook.dart';
import 'package:intl/intl.dart';

class DayListLogbookMbkm extends StatefulWidget {
  final DateTime selectedDate;
  final List<String> statusHari; // Terima status hari sebagai parameter
  const DayListLogbookMbkm(
      {Key? key, required this.selectedDate, required this.statusHari})
      : super(key: key);

  @override
  State<DayListLogbookMbkm> createState() => _DayListLogbookMbkmState();
}

class _DayListLogbookMbkmState extends State<DayListLogbookMbkm> {
  List<String> dateMounthYearOfWeek = [];
  late DateTime today;
  late List<String>
      statusHari; // Deklarasikan status hari sebagai variabel state

  @override
  void initState() {
    super.initState();
    dateMounthYearOfWeek = _generateDayInformation(widget.selectedDate);
    today = DateTime.now();
    statusHari = widget.statusHari; // Inisialisasi status hari dari parameter
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logbook Harian MBKM'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < LogbookConstants.daysOfWeek.length; i++)
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
                          child: _buildStatusIcon(statusHari[
                              i]), // Gunakan status dari list statusHari
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        LogbookConstants.daysOfWeek[i].substring(0, 1),
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < LogbookConstants.daysOfWeek.length; i++)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LogbookConstants.daysOfWeek[i],
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              dateMounthYearOfWeek[i],
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: DateTime(
                                      today.year, today.month, today.day) ==
                                  DateTime(
                                          widget.selectedDate.year,
                                          widget.selectedDate.month,
                                          widget.selectedDate.day)
                                      .add(Duration(days: i))
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FormLogbookMbkm(
                                        selectedDay:
                                            LogbookConstants.daysOfWeek[i],
                                        selectedDate: dateMounthYearOfWeek[i],
                                      ),
                                    ),
                                  ).then((selectedDay) {
                                    if (selectedDay != null) {
                                      updateDayStatus(selectedDay);
                                      Navigator.pop(context, statusHari);
                                    }
                                  });
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            backgroundColor: const Color(0xFF0F75BC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child:
                                DateTime(today.year, today.month, today.day) ==
                                        DateTime(
                                                widget.selectedDate.year,
                                                widget.selectedDate.month,
                                                widget.selectedDate.day)
                                            .add(Duration(days: i))
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
                      ],
                    ),
                  ),
              ],
            ),
          ],
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

  void updateDayStatus(String selectedDay) {
    setState(() {
      for (int i = 0; i < LogbookConstants.daysOfWeek.length; i++) {
        if (LogbookConstants.daysOfWeek[i] == selectedDay) {
          statusHari[i] = 'check';
        }
      }
    });
  }
}

List<String> _generateDayInformation(DateTime selectedDate) {
  List<String> dayInformation = [];
  for (int i = 0; i < 5; i++) {
    DateTime day = selectedDate.add(Duration(days: i));
    String formattedDate = DateFormat('dd MMM yyyy').format(day);
    dayInformation.add(formattedDate);
  }
  return dayInformation;
}
