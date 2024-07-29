import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/mahasiswa/revisi_sidang_kp.dart';

class RevisiSidangKp extends StatefulWidget {
  const RevisiSidangKp({Key? key}) : super(key: key);

  @override
  _RevisiSidangKpState createState() => _RevisiSidangKpState();
}

class _RevisiSidangKpState extends State<RevisiSidangKp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var revisiSidangKP =
          Provider.of<RevisiSidangKPController>(context, listen: false);
      revisiSidangKP.getRevisiData();
    });
  }

  renderLoader(hasError) {
    if (hasError != "") {
      return [
        Container(
          padding: const EdgeInsets.only(top: 60),
          height: MediaQuery.of(context).size.height - 300,
          child: Column(
            children: [
              Center(
                  child: SelectableText(
                hasError,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ))
            ],
          ),
        )
      ];
    }

    return [
      Container(
        margin: const EdgeInsets.only(top: 30),
        child: const Center(
          child: CircularProgressIndicator(
            backgroundColor: yellowPens,
            valueColor: AlwaysStoppedAnimation(bluePens),
          ),
        ),
      )
    ];
  }

  renderRevisi(obj, isLoading, hasError) {
    if (isLoading) {
      return [
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: const Center(
            child: CircularProgressIndicator(
              backgroundColor: yellowPens,
              valueColor: AlwaysStoppedAnimation(bluePens),
            ),
          ),
        )
      ];
    }

    if (hasError != "") {
      return [
        Container(
          padding: const EdgeInsets.only(top: 60),
          height: MediaQuery.of(context).size.height - 300,
          child: Column(
            children: [
              Center(
                  child: SelectableText(
                hasError,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ))
            ],
          ),
        )
      ];
    }

    if (obj.data.length == 0) {
      return [
        SizedBox(
          height: MediaQuery.of(context).size.height - 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Center(child: Text('Tidak ada data.'))],
          ),
        )
      ];
    }

    List<Widget> result = [];
    for (var element in obj.data) {
      result.add(Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 30, left: 20, right: 20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                height: 50,
                left: 0,
                right: 0,
                bottom: -20,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        element.sudahRevisi == '1' ? Colors.green : Colors.red,
                  ),
                )),
            Container(
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
                                'Nama Dosen',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SelectableText("""${element.namapegawai}"""),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Revisi',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SelectableText("""${element.catatan}"""),
                              const SizedBox(
                                height: 10,
                              ),
                              const SelectableText(
                                'Status Revisi',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              if (element.sudahRevisi == '1')
                                const Text("Sudah Selesai")
                              else
                                const Text("Belum Selesai"),
                            ],
                          )),
                    ]))
          ],
        ),
      ));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    RevisiSidangKPController revisi =
        Provider.of<RevisiSidangKPController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Revisi Sidang Kerja Praktik'),
        scrolledUnderElevation: 0.0,
      ),
      backgroundColor: const Color(0xfff3f3f3),
      body: SingleChildScrollView(
        child: Column(
          children: revisi.revisiData != null
              ? renderRevisi(
                  revisi.revisiData, revisi.isLoading, revisi.hasError)
              : renderLoader(revisi.hasError),
        ),
      ),
    ));
  }
}
