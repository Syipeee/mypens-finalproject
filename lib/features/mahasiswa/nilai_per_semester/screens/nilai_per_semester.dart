import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/mahasiswa/nilai_per_semester.dart';
import '../../../../constants/colors.dart';

class NilaiPerSemester extends StatefulWidget {
  const NilaiPerSemester({Key? key}) : super(key: key);

  @override
  _NilaiPerSemesterState createState() => _NilaiPerSemesterState();
}

class _NilaiPerSemesterState extends State<NilaiPerSemester> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var nilai =
          Provider.of<NilaiPerSemesterController>(context, listen: false);
      nilai.generateYearList();
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
                children: [const Text('Mata Kuliah'), Text(element.matakuliah)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('Kode MK'), Text(element.kode)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('Nilai'), Text(element.nh)],
              )
            ],
          )));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    NilaiPerSemesterController nilai =
        Provider.of<NilaiPerSemesterController>(context);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: bluePens,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
            ),
            title: const Text('Nilai Per Semester'),
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
                              nilai.selectedYear != ''
                                  ? DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.5),
                                                blurRadius: 1,
                                                blurStyle: BlurStyle.outer)
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 20),
                                        child: Consumer<
                                                NilaiPerSemesterController>(
                                            builder: (BuildContext context,
                                                NilaiPerSemesterController
                                                    nilai,
                                                Widget? child) {
                                          return DropdownButton<String>(
                                            underline: Container(),
                                            dropdownColor: whiteColor,
                                            items: nilai.yearList
                                                .map((String value) {
                                              return DropdownMenuItem(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              nilai.setSelectedYear(
                                                  newValue as String);
                                              nilai.getDaftarNilai();
                                              nilai.isLoading = true;
                                            },
                                            value: nilai.selectedYear,
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
                            nilai.selectedSemester != ''
                                ? DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: const [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5),
                                              blurRadius: 1,
                                              blurStyle: BlurStyle.outer)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 20),
                                      child: Consumer<
                                              NilaiPerSemesterController>(
                                          builder: (BuildContext context,
                                              NilaiPerSemesterController nilai,
                                              Widget? child) {
                                        return DropdownButton<String>(
                                          underline: Container(),
                                          dropdownColor: whiteColor,
                                          items: nilai.semesterList
                                              .map((String value) {
                                            return DropdownMenuItem(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (newValue) {
                                            nilai.setSelectedSemester(
                                                newValue as String);
                                            nilai.getDaftarNilai();
                                            nilai.isLoading = true;
                                          },
                                          value: nilai.selectedSemester,
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
                        children: nilai.daftarNilai != null
                            ? renderNilai(nilai.daftarNilai, nilai.isLoading,
                                nilai.hasError)
                            : renderLoader(nilai.hasError)),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
