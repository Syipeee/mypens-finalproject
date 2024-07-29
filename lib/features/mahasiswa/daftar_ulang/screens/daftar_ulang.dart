import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/mahasiswa/daftar_ulang.dart';

class DaftarUlang extends StatefulWidget {
  const DaftarUlang({Key? key}) : super(key: key);

  @override
  _DaftarUlangState createState() => _DaftarUlangState();
}

class _DaftarUlangState extends State<DaftarUlang> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var daftarUlang =
          Provider.of<DaftarUlangController>(context, listen: false);
      daftarUlang.generateYearList();
    });
  }

  renderDaftarUlang(daftarUlang, hasError) {
    if (hasError != "") {
      return [
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Center(
              child: SelectableText(
            hasError,
            textAlign: TextAlign.center,
            style:
                const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          )),
        )
      ];
    }

    return [
      Container(
          padding: const EdgeInsets.only(top: 30, bottom: 15),
          child: const Text(
            "UKT/SPP",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          )),
      Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Keterangan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (daftarUlang.uktSpp != null) ...[
                      if (daftarUlang.uktSpp.data.length == 1)
                        SelectableText(
                            """${daftarUlang.uktSpp.data.first.ketBayar} - ${daftarUlang.uktSpp.data.first.ketBayar2}"""),
                      if (daftarUlang.uktSpp.data.length == 0) const Text("-"),
                    ] else ...[
                      const Text('Loading...')
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Tanggal Bayar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (daftarUlang.uktSpp != null) ...[
                      if (daftarUlang.uktSpp.data.length == 1)
                        SelectableText(
                            """${daftarUlang.uktSpp.data.first.tanggalBayar}"""),
                      if (daftarUlang.uktSpp.data.length == 0) const Text("-"),
                    ] else ...[
                      const Text('Loading...')
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Kode Bayar Mandiri',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (daftarUlang.uktSpp != null) ...[
                      if (daftarUlang.uktSpp.data.length == 1)
                        SelectableText(
                            """${daftarUlang.uktSpp.data.first.kodeBayarMandiri}"""),
                      if (daftarUlang.uktSpp.data.length == 0) const Text("-"),
                    ] else ...[
                      const Text('Loading...')
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Kode Bayar BSI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (daftarUlang.uktSpp != null) ...[
                      if (daftarUlang.uktSpp.data.length == 1)
                        SelectableText(
                            """${daftarUlang.uktSpp.data.first.kodeBayarBsi}"""),
                      if (daftarUlang.uktSpp.data.length == 0) const Text("-"),
                    ] else ...[
                      const Text('Loading...')
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Kode Bayar BNI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (daftarUlang.uktSpp != null) ...[
                      if (daftarUlang.uktSpp.data.length == 1)
                        SelectableText(
                            """${daftarUlang.uktSpp.data.first.kodeBayarBni}"""),
                      if (daftarUlang.uktSpp.data.length == 0) const Text("-"),
                    ] else ...[
                      const Text('Loading...')
                    ]
                  ],
                )),
          ])),
      Container(
          padding: const EdgeInsets.only(top: 30, bottom: 15),
          child: const Text(
            "IKOMA",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          )),
      Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Keterangan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (daftarUlang.ikoma != null) ...[
                      if (daftarUlang.ikoma.data.length == 1)
                        SelectableText(
                            """${daftarUlang.ikoma.data.first.ketBayar} - ${daftarUlang.ikoma.data.first.ketBayar2}"""),
                      if (daftarUlang.ikoma.data.length == 0) const Text("-"),
                    ] else ...[
                      const Text('Loading...')
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Tanggal Bayar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (daftarUlang.ikoma != null) ...[
                      if (daftarUlang.ikoma.data.length == 1)
                        SelectableText(
                            """${daftarUlang.ikoma.data.first.tanggalBayar}"""),
                      if (daftarUlang.ikoma.data.length == 0) const Text("-"),
                    ] else ...[
                      const Text('Loading...')
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Kode Bayar Mandiri',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (daftarUlang.ikoma != null) ...[
                      if (daftarUlang.ikoma.data.length == 1)
                        SelectableText(
                            """${daftarUlang.ikoma.data.first.kodeBayarMandiri}"""),
                      if (daftarUlang.ikoma.data.length == 0) const Text("-"),
                    ] else ...[
                      const Text('Loading...')
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Kode Bayar BSI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (daftarUlang.ikoma != null) ...[
                      if (daftarUlang.ikoma.data.length == 1)
                        SelectableText(
                            """${daftarUlang.ikoma.data.first.kodeBayarBsi}"""),
                      if (daftarUlang.ikoma.data.length == 0) const Text("-"),
                    ] else ...[
                      const Text('Loading...')
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Kode Bayar BNI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (daftarUlang.ikoma != null) ...[
                      if (daftarUlang.ikoma.data.length == 1)
                        SelectableText(
                            """${daftarUlang.ikoma.data.first.kodeBayarBni}"""),
                      if (daftarUlang.ikoma.data.length == 0) const Text("-"),
                    ] else ...[
                      const Text('Loading...')
                    ]
                  ],
                )),
          ])),
      Container(
          padding: const EdgeInsets.only(top: 30, bottom: 15),
          child: const Text(
            "Status Daftar Ulang",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          )),
      Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (daftarUlang.statusDaftarUlang != null) ...[
                      if (daftarUlang.statusDaftarUlang) ...[
                        const SelectableText("""Sudah Daftar Ulang""",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ] else ...[
                        const SelectableText("""Belum Daftar Ulang""",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ]
                    ] else ...[
                      const Text('Loading...')
                    ],
                  ],
                )),
          ]))
    ];
  }

  @override
  Widget build(BuildContext context) {
    DaftarUlangController daftarUlang =
        Provider.of<DaftarUlangController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Daftar Ulang'),
        scrolledUnderElevation: 0.0,
      ),
      backgroundColor: const Color(0xfff3f3f3),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          daftarUlang.selectedYear != ''
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
                                    child: Consumer<DaftarUlangController>(
                                        builder: (BuildContext context,
                                            DaftarUlangController nilai,
                                            Widget? child) {
                                      return DropdownButton<String>(
                                        underline: Container(),
                                        dropdownColor: whiteColor,
                                        items: daftarUlang.yearList
                                            .map((String value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          daftarUlang.setSelectedYear(
                                              newValue as String);
                                          daftarUlang.getSpp();
                                          daftarUlang.getIkoma();
                                          daftarUlang.getStatusDaftarUlang();
                                        },
                                        value: daftarUlang.selectedYear,
                                      );
                                    }),
                                  ),
                                )
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
                        daftarUlang.selectedSemester != ''
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
                                  child: Consumer<DaftarUlangController>(
                                      builder: (BuildContext context,
                                          DaftarUlangController nilai,
                                          Widget? child) {
                                    return DropdownButton<String>(
                                      underline: Container(),
                                      dropdownColor: whiteColor,
                                      items: daftarUlang.semesterList
                                          .map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        daftarUlang.setSelectedSemester(
                                            newValue as String);
                                        daftarUlang.getSpp();
                                        daftarUlang.getIkoma();
                                        daftarUlang.getStatusDaftarUlang();
                                      },
                                      value: daftarUlang.selectedSemester,
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
              Column(
                children: renderDaftarUlang(daftarUlang, daftarUlang.hasError),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
