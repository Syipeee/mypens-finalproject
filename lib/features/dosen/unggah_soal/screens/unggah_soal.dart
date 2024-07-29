import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/dosen/unggah_soal.dart';

class UnggahSoal extends StatefulWidget {
  const UnggahSoal({super.key});

  @override
  State<UnggahSoal> createState() => _UnggahSoalState();
}

class _UnggahSoalState extends State<UnggahSoal> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var unggahSoal =
          Provider.of<UnggahSoalController>(context, listen: false);
      unggahSoal.generateYearList();
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

  renderUnggahSoal(obj, isLoading, hasError) {
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
                children: [const Text('Tahun'), Text(element.tahun)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('Semester'), Text(element.semester)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('Jenis'), Text(element.jenis)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('Mata Kuliah'), Text(element.matakuliah)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('Kelas'), Text(element.kelas)],
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Unggah Soal'),
                    if (element.statusUnggahSoal == 'Sudah Unggah Soal') ...[
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          """${element.statusUnggahSoal}""",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ] else ...[
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          """${element.statusUnggahSoal}""",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ]
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Validasi Soal'),
                    if (element.statusValidasiSoal == 'Sudah Validasi') ...[
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          """${element.statusValidasiSoal}""",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ] else ...[
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          """${element.statusValidasiSoal}""",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ]
                  ],
                ),
              )
            ],
          )));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    UnggahSoalController unggahSoal =
        Provider.of<UnggahSoalController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Status Unggah Soal'),
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
                            'Tahun Ajaran',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          unggahSoal.selectedYear != ''
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
                                    child: Consumer<UnggahSoalController>(
                                        builder: (BuildContext context,
                                            UnggahSoalController dataUnggahSoal,
                                            Widget? child) {
                                      return DropdownButton<String>(
                                        underline: Container(),
                                        dropdownColor: whiteColor,
                                        items: dataUnggahSoal.yearList
                                            .map((String value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          dataUnggahSoal.setSelectedYear(
                                              newValue as String);
                                          dataUnggahSoal.getUnggahSoal();
                                          dataUnggahSoal.isLoading = true;
                                        },
                                        value: dataUnggahSoal.selectedYear,
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
                          'Semester',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        unggahSoal.selectedSemester != ''
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
                                  child: Consumer<UnggahSoalController>(builder:
                                      (BuildContext context,
                                          UnggahSoalController dataUnggahSoal,
                                          Widget? child) {
                                    return DropdownButton<String>(
                                      underline: Container(),
                                      dropdownColor: whiteColor,
                                      items: dataUnggahSoal.semesterList
                                          .map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        dataUnggahSoal.setSelectedSemester(
                                            newValue as String);
                                        dataUnggahSoal.getUnggahSoal();
                                        dataUnggahSoal.isLoading = true;
                                      },
                                      value: dataUnggahSoal.selectedSemester,
                                    );
                                  }),
                                ),
                              )
                            : const Text('wait')
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                    children: unggahSoal.listUnggahSoal != null
                        ? renderUnggahSoal(unggahSoal.listUnggahSoal,
                            unggahSoal.isLoading, unggahSoal.hasError)
                        : renderLoader(unggahSoal.hasError)),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
