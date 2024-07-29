import 'package:flutter/material.dart';
import 'package:mypens/common/domain/vmy_absensi_kuliah/rekap_absensi_mahasiswa_model.dart';

class RekapAbsensiTable extends StatelessWidget {
  final RekapAbsensiMahasiswa rekapAbsensi;
  const RekapAbsensiTable({
    super.key,
    required this.rekapAbsensi,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Table(
              columnWidths: getTableColumnWidth(),
              border: TableBorder.all(),
              children: [
                TableRow(
                  children:[
                    const TableCell(
                      child: Text(
                        'Mata Kuliah',
                        textAlign: TextAlign.center,
                      )
                    ),

                    for (var i = 1 ; i <= 16 ; i++)
                      TableCell(
                        child: Text(
                          i == 7 ?
                              '7/UTS' :
                          i == 14 ?
                              '14/UAS' :
                              '$i',
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ]
                ),
              ],
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Table(
                border: TableBorder.all(),
                columnWidths: getTableColumnWidth(),
                children: [
                  for (final rekapAbsensiMatkul in rekapAbsensi.listMatkulRekapAbsensi)
                    TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                rekapAbsensiMatkul.namaMatkul
                              ),
                            ),
                          ),
                          for (var i = 1 ; i <= 16 ; i++)
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Text(
                                rekapAbsensiMatkul
                                    .listMingguRekapAbsensi[i]
                                    .listKehadiranMingguIni.join(''),
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ]
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Map<int, TableColumnWidth> getTableColumnWidth(){
    return Map.fromIterable(
      Iterable.generate(18, (index) => index),
      key: (index) => index,
      value: (index) {
        if (index == 0){
          return const FixedColumnWidth(175);
        }
        else if (index == 17){
          return const FixedColumnWidth(100);
        }
        else {
          return const FixedColumnWidth(60);
        }
      }
    );
  }
}
