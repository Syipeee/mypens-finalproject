import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/dosen/rekap_absensi.dart';

class DosenRekapAbsensi extends StatefulWidget {
  const DosenRekapAbsensi({super.key});

  @override
  State<DosenRekapAbsensi> createState() => _RekapAbsensiState();
}

class _RekapAbsensiState extends State<DosenRekapAbsensi> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var rekap =
          Provider.of<DosenRekapAbsensiController>(context, listen: false);
      rekap.generateYearList();
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
      const CircularProgressIndicator(
        backgroundColor: yellowPens,
        valueColor: AlwaysStoppedAnimation(bluePens),
      )
    ];
  }

  renderNilai(obj, isLoading, hasError) {
    if (isLoading) {
      return [
        const CircularProgressIndicator(
          backgroundColor: yellowPens,
          valueColor: AlwaysStoppedAnimation(bluePens),
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

    if (obj.length == 0) {
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
    for (var element in obj) {
      result.add(Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 15),
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('Tanggal'), Text(element.tanggal)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('Jam Masuk'), Text(element.masuk)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('Jam Pulang'), Text(element.pulang)],
              )
            ],
          )));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    DosenRekapAbsensiController rekap =
        Provider.of<DosenRekapAbsensiController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Rekap Absensi'),
        scrolledUnderElevation: 0.0,
      ),
      backgroundColor: const Color(0xfff3f3f3),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
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
                            'Tahun',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          rekap.selectedYear != ''
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
                                    child: Consumer<
                                            DosenRekapAbsensiController>(
                                        builder: (BuildContext context,
                                            DosenRekapAbsensiController rekap,
                                            Widget? child) {
                                      return DropdownButton<String>(
                                        underline: Container(),
                                        dropdownColor: whiteColor,
                                        items:
                                            rekap.yearList.map((String value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          rekap.setSelectedYear(
                                              newValue as String);
                                          rekap.getRekapAbsensi();
                                          rekap.isLoading = true;
                                        },
                                        value: rekap.selectedYear,
                                      );
                                    }),
                                  ))
                              : const Text('wait')
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Bulan',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        rekap.selectedMonth != ''
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
                                  child: Consumer<DosenRekapAbsensiController>(
                                      builder: (BuildContext context,
                                          DosenRekapAbsensiController rekap,
                                          Widget? child) {
                                    return DropdownButton<String>(
                                      underline: Container(),
                                      dropdownColor: whiteColor,
                                      items:
                                          rekap.monthList.map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        rekap.setSelectedMonth(
                                            newValue as String);
                                        rekap.getRekapAbsensi();
                                        rekap.isLoading = true;
                                      },
                                      value: rekap.selectedMonth,
                                    );
                                  }),
                                ))
                            : const Text('wait')
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                    children: rekap.rekapAbsensi != null
                        ? renderNilai(
                            rekap.rekapAbsensi, rekap.isLoading, rekap.hasError)
                        : renderLoader(rekap.hasError)),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
