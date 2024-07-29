import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../../../constants/colors.dart';
import '../../../controllers/mahasiswa/profile.dart';

class Cicilan extends StatefulWidget {
  const Cicilan({Key? key}) : super(key: key);

  @override
  _CicilanState createState() => _CicilanState();
}

class _CicilanState extends State<Cicilan> {
  cleanWhitespace(str) {
    return str.replaceAll(" ", "");
  }

  renderCicilan(obj) {
    List<Widget> result = [];
    for (var element in obj.data) {
      result.add(Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tahun',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText("""${element.tahun}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Semester',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText("""${element.semester}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const SelectableText(
                              'Keterangan',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText("""${element.keterangan}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const SelectableText(
                              'Cicilan Ke',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText("""${element.cicilanKe}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const SelectableText(
                              'Nominal Tagihan',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText(
                                """${cleanWhitespace(element.nominalTagihan)}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const SelectableText(
                              'Tanggal Pembayaran',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText(
                                """${element.tanggalTagihanAwal} s/d ${element.tanggalTagihanAkhir}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const SelectableText(
                              'Status Pembayaran',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText("""${element.statusPembayaran}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const SelectableText(
                              'Nominal Bayar',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText(
                                """${cleanWhitespace(element.nominalBayar)}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const SelectableText(
                              'Tanggal Bayar',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText("""${element.tanggalBayar}"""),
                          ],
                        )),
                  ]))));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    ProfileController cicilan = Provider.of<ProfileController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Riwayat Cicilan'),
        scrolledUnderElevation: 0.0,
      ),
      backgroundColor: const Color(0xfff3f3f3),
      body: SingleChildScrollView(
        child: Column(
          children: cicilan.profile != null
              ? renderCicilan(cicilan.profile)
              : [const Text('Loading')],
        ),
      ),
    ));
  }
}
