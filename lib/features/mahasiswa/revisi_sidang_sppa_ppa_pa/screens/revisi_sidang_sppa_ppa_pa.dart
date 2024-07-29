import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/services.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/mahasiswa/revisi_sidang_sppa_ppa_pa.dart';

class RevisiSppaPpaPa extends StatefulWidget {
  const RevisiSppaPpaPa({Key? key}) : super(key: key);

  @override
  State<RevisiSppaPpaPa> createState() => _RevisiSppaPpaPaState();
}

class _RevisiSppaPpaPaState extends State<RevisiSppaPpaPa> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var revisi =
          Provider.of<RevisiSppaPpaPaController>(context, listen: false);
      revisi.getRevisiData();
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
        child: const CircularProgressIndicator(
          backgroundColor: yellowPens,
          valueColor: AlwaysStoppedAnimation(bluePens),
        ),
      )
    ];
  }

  renderRevisi(obj, isLoading, hasError) {
    if (isLoading) {
      return [
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: const CircularProgressIndicator(
            backgroundColor: yellowPens,
            valueColor: AlwaysStoppedAnimation(bluePens),
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
            children: const [Text('Tidak ada data.')],
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SelectableText("""${element.pegawai}"""),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: yellowPens,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      """${element.ketJenis}""",
                                      style: const TextStyle(
                                          color: bluePens,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Revisi',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // SelectableText("""${element.catatan}"""),
                              HtmlWidget(element.catatan),
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
    RevisiSppaPpaPaController revisi =
        Provider.of<RevisiSppaPpaPaController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Revisi SPPA, PPA, PA'),
        scrolledUnderElevation: 0.0,
      ),
      backgroundColor: const Color(0xfff3f3f3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Jenis',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        revisi.selectedUjianId != ''
                            ? DecoratedBox(
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.5),
                                          blurRadius: 1,
                                          blurStyle: BlurStyle.outer)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 20),
                                  child: Consumer<RevisiSppaPpaPaController>(
                                      builder: (BuildContext context,
                                          RevisiSppaPpaPaController revisi,
                                          Widget? child) {
                                    return DropdownButton<String>(
                                      underline: Container(),
                                      dropdownColor: whiteColor,
                                      items: revisi.ujianId.map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        revisi.setSelectedUjianId(
                                            newValue as String);
                                        revisi.getRevisiData();
                                        revisi.isLoading = true;
                                      },
                                      value: revisi.selectedUjianId,
                                    );
                                  }),
                                ),
                              )
                            : const Text('wait')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: revisi.revisiData != null
                  ? renderRevisi(
                      revisi.revisiData, revisi.isLoading, revisi.hasError)
                  : renderLoader(revisi.hasError),
            )
          ],
        ),
      ),
    ));
  }
}
