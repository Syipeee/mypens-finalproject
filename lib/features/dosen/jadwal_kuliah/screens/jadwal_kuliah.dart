import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../../../controllers/dosen/jadwal_kuliah.dart';
import '../../../../constants/colors.dart';

class DosenJadwalKuliah extends StatefulWidget {
  const DosenJadwalKuliah({Key? key}) : super(key: key);

  @override
  State<DosenJadwalKuliah> createState() => _JadwalKuliahState();
}

class _JadwalKuliahState extends State<DosenJadwalKuliah> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var jadwalKuliah =
          Provider.of<DosenJadwalKuliahController>(context, listen: false);
      jadwalKuliah.generateYearList();
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

  outerTitleConstruct(title) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Center(
        child: Text(title),
      ),
    );
  }

  contentConstruct(widget) {
    List<Widget> data = widget;
    var content = Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: data,
            )
          ],
        ));
    return content;
  }

  renderJadwalKuliah(obj, isLoading, hasError) {
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

    // holding final list
    List<Widget> result = [];

    // cleaning data by hari
    List<Widget> senin = [];
    int seninTrigger = 0; // 0=tidak ada, 1=ada
    List<Widget> selasa = [];
    int selasaTrigger = 0;
    List<Widget> rabu = [];
    int rabuTrigger = 0;
    List<Widget> kamis = [];
    int kamisTrigger = 0;
    List<Widget> jumat = [];
    int jumatTrigger = 0;

    double jadwalSpacing = 10;

    for (var element in obj) {
      switch (element.hari) {
        case 'Senin':
          // onoff-ing trigger, to anounce there is data there
          if (seninTrigger == 0) {
            seninTrigger = 1;
          } else {
            senin.add(SizedBox(
              height: jadwalSpacing,
            ));
          }

          // collecting object
          if (senin.isNotEmpty) {
            senin.add(SizedBox(
              height: jadwalSpacing,
            ));
          }
          senin.add(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(element.mataKuliah),
              Text(element.namaDosen),
              Text(element.jam),
              Text(element.ruang)
            ],
          ));

          if (element.hari2 != 'Kosong') {
            switch (element.hari2) {
              case 'Senin':
                if (senin.isNotEmpty) {
                  senin.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                senin.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Selasa':
                if (selasa.isNotEmpty) {
                  selasa.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                selasa.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Rabu':
                if (rabu.isNotEmpty) {
                  rabu.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                rabu.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Kamis':
                if (kamis.isNotEmpty) {
                  kamis.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                kamis.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Jum\'at':
                if (jumat.isNotEmpty) {
                  jumat.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                jumat.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
            }
          }

          if (element.hari2Kp != 'Kosong') {
            switch (element.hari2Kp) {
              case 'Senin':
                if (senin.isNotEmpty) {
                  senin.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                senin.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Selasa':
                if (selasa.isNotEmpty) {
                  selasa.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                selasa.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Rabu':
                if (rabu.isNotEmpty) {
                  rabu.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                rabu.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Kamis':
                if (kamis.isNotEmpty) {
                  kamis.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                kamis.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Jum\'at':
                if (jumat.isNotEmpty) {
                  jumat.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                jumat.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
            }
          }
          break;
        case 'Selasa':
          // onoff-ing trigger, to anounce there is data there
          if (selasaTrigger == 0) {
            selasaTrigger = 1;
          } else {
            selasa.add(SizedBox(
              height: jadwalSpacing,
            ));
          }

          // collecting object
          if (selasa.isNotEmpty) {
            selasa.add(SizedBox(
              height: jadwalSpacing,
            ));
          }
          selasa.add(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(element.mataKuliah),
              Text(element.namaDosen),
              Text(element.jam),
              Text(element.ruang)
            ],
          ));

          if (element.hari2 != 'Kosong') {
            switch (element.hari2) {
              case 'Senin':
                if (senin.isNotEmpty) {
                  senin.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                senin.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Selasa':
                if (selasa.isNotEmpty) {
                  selasa.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                selasa.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Rabu':
                if (rabu.isNotEmpty) {
                  rabu.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                rabu.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Kamis':
                if (kamis.isNotEmpty) {
                  kamis.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                kamis.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Jum\'at':
                if (jumat.isNotEmpty) {
                  jumat.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                jumat.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
            }
          }

          if (element.hari2Kp != 'Kosong') {
            switch (element.hari2Kp) {
              case 'Senin':
                if (senin.isNotEmpty) {
                  senin.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                senin.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Selasa':
                if (selasa.isNotEmpty) {
                  selasa.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                selasa.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Rabu':
                if (rabu.isNotEmpty) {
                  rabu.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                rabu.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Kamis':
                if (kamis.isNotEmpty) {
                  kamis.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                kamis.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Jum\'at':
                if (jumat.isNotEmpty) {
                  jumat.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                jumat.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
            }
          }
          break;
        case 'Rabu':
          // onoff-ing trigger, to anounce there is data there
          if (rabuTrigger == 0) {
            rabuTrigger = 1;
          } else {
            rabu.add(SizedBox(
              height: jadwalSpacing,
            ));
          }

          // collecting object
          if (rabu.isNotEmpty) {
            rabu.add(SizedBox(
              height: jadwalSpacing,
            ));
          }
          rabu.add(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(element.mataKuliah),
              Text(element.namaDosen),
              Text(element.jam),
              Text(element.ruang)
            ],
          ));

          if (element.hari2 != 'Kosong') {
            switch (element.hari2) {
              case 'Senin':
                if (senin.isNotEmpty) {
                  senin.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                senin.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Selasa':
                if (selasa.isNotEmpty) {
                  selasa.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                selasa.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Rabu':
                if (rabu.isNotEmpty) {
                  rabu.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                rabu.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Kamis':
                if (kamis.isNotEmpty) {
                  kamis.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                kamis.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Jum\'at':
                if (jumat.isNotEmpty) {
                  jumat.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                jumat.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
            }
          }

          if (element.hari2Kp != 'Kosong') {
            switch (element.hari2Kp) {
              case 'Senin':
                if (senin.isNotEmpty) {
                  senin.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                senin.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Selasa':
                if (selasa.isNotEmpty) {
                  selasa.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                selasa.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Rabu':
                if (rabu.isNotEmpty) {
                  rabu.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                rabu.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Kamis':
                if (kamis.isNotEmpty) {
                  kamis.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                kamis.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Jum\'at':
                if (jumat.isNotEmpty) {
                  jumat.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                jumat.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
            }
          }
          break;
        case 'Kamis':
          // onoff-ing trigger, to anounce there is data there
          if (kamisTrigger == 0) {
            kamisTrigger = 1;
          } else {
            kamis.add(SizedBox(
              height: jadwalSpacing,
            ));
          }

          // collecting object
          if (kamis.isNotEmpty) {
            kamis.add(SizedBox(
              height: jadwalSpacing,
            ));
          }
          kamis.add(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(element.mataKuliah),
              Text(element.namaDosen),
              Text(element.jam),
              Text(element.ruang)
            ],
          ));

          if (element.hari2 != 'Kosong') {
            switch (element.hari2) {
              case 'Senin':
                if (senin.isNotEmpty) {
                  senin.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                senin.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Selasa':
                if (selasa.isNotEmpty) {
                  selasa.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                selasa.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Rabu':
                if (rabu.isNotEmpty) {
                  rabu.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                rabu.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Kamis':
                if (kamis.isNotEmpty) {
                  kamis.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                kamis.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Jum\'at':
                if (jumat.isNotEmpty) {
                  jumat.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                jumat.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
            }
          }

          if (element.hari2Kp != 'Kosong') {
            switch (element.hari2Kp) {
              case 'Senin':
                if (senin.isNotEmpty) {
                  senin.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                senin.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Selasa':
                if (selasa.isNotEmpty) {
                  selasa.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                selasa.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Rabu':
                if (rabu.isNotEmpty) {
                  rabu.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                rabu.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Kamis':
                if (kamis.isNotEmpty) {
                  kamis.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                kamis.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Jum\'at':
                if (jumat.isNotEmpty) {
                  jumat.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                jumat.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
            }
          }
          break;
        case 'Jum\'at':
          // onoff-ing trigger, to anounce there is data there
          if (jumatTrigger == 0) {
            jumatTrigger = 1;
          } else {
            jumat.add(SizedBox(
              height: jadwalSpacing,
            ));
          }

          // collecting object
          if (jumat.isNotEmpty) {
            jumat.add(SizedBox(
              height: jadwalSpacing,
            ));
          }
          jumat.add(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(element.mataKuliah),
              Text(element.namaDosen),
              Text(element.jam),
              Text(element.ruang)
            ],
          ));

          if (element.hari2 != 'Kosong') {
            switch (element.hari2) {
              case 'Senin':
                if (senin.isNotEmpty) {
                  senin.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                senin.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Selasa':
                if (selasa.isNotEmpty) {
                  selasa.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                selasa.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Rabu':
                if (rabu.isNotEmpty) {
                  rabu.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                rabu.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Kamis':
                if (kamis.isNotEmpty) {
                  kamis.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                kamis.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
              case 'Jum\'at':
                if (jumat.isNotEmpty) {
                  jumat.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                jumat.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2),
                    Text(element.ruang2)
                  ],
                ));
                break;
            }
          }

          if (element.hari2Kp != 'Kosong') {
            switch (element.hari2Kp) {
              case 'Senin':
                if (senin.isNotEmpty) {
                  senin.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                senin.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Selasa':
                if (selasa.isNotEmpty) {
                  selasa.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                selasa.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Rabu':
                if (rabu.isNotEmpty) {
                  rabu.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                rabu.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Kamis':
                if (kamis.isNotEmpty) {
                  kamis.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                kamis.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
              case 'Jum\'at':
                if (jumat.isNotEmpty) {
                  jumat.add(SizedBox(
                    height: jadwalSpacing,
                  ));
                }
                jumat.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element.mataKuliah),
                    Text(element.namaDosen),
                    Text(element.jam2Kp),
                    Text(element.ruang2Kp)
                  ],
                ));
                break;
            }
          }
          break;
        default:
      }
    }

    // building widget
    if (seninTrigger == 1) {
      // construct outer title and push to final list
      result.add(outerTitleConstruct('Senin'));
      result.add(contentConstruct(senin));
    }
    if (selasaTrigger == 1) {
      result.add(outerTitleConstruct('Selasa'));
      result.add(contentConstruct(selasa));
    }
    if (rabuTrigger == 1) {
      result.add(outerTitleConstruct('Rabu'));
      result.add(contentConstruct(rabu));
    }
    if (kamisTrigger == 1) {
      result.add(outerTitleConstruct('Kamis'));
      result.add(contentConstruct(kamis));
    }
    if (jumatTrigger == 1) {
      result.add(outerTitleConstruct('Jum\'at'));
      result.add(contentConstruct(jumat));
    }

    // returning final widget
    return result;
  }

  @override
  Widget build(BuildContext context) {
    DosenJadwalKuliahController jadwalKuliah =
        Provider.of<DosenJadwalKuliahController>(context);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: bluePens,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
            ),
            title: const Text('Jadwal Kuliah'),
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
                              jadwalKuliah.selectedYear != ''
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
                                                DosenJadwalKuliahController>(
                                            builder: (BuildContext context,
                                                DosenJadwalKuliahController
                                                    nilai,
                                                Widget? child) {
                                          return DropdownButton<String>(
                                            underline: Container(),
                                            dropdownColor: whiteColor,
                                            items: jadwalKuliah.yearList
                                                .map((String value) {
                                              return DropdownMenuItem(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              jadwalKuliah.setSelectedYear(
                                                  newValue as String);
                                              jadwalKuliah.getJadwalKuliah();
                                              jadwalKuliah.isLoading = true;
                                            },
                                            value: jadwalKuliah.selectedYear,
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
                            jadwalKuliah.selectedSemester != ''
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
                                              DosenJadwalKuliahController>(
                                          builder: (BuildContext context,
                                              DosenJadwalKuliahController nilai,
                                              Widget? child) {
                                        return DropdownButton<String>(
                                          underline: Container(),
                                          dropdownColor: whiteColor,
                                          items: jadwalKuliah.semesterList
                                              .map((String value) {
                                            return DropdownMenuItem(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (newValue) {
                                            jadwalKuliah.setSelectedSemester(
                                                newValue as String);
                                            jadwalKuliah.getJadwalKuliah();
                                            jadwalKuliah.isLoading = true;
                                          },
                                          value: jadwalKuliah.selectedSemester,
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
                        children: jadwalKuliah.jadwalKuliah != null
                            ? renderJadwalKuliah(jadwalKuliah.jadwalKuliah,
                                jadwalKuliah.isLoading, jadwalKuliah.hasError)
                            : renderLoader(jadwalKuliah.hasError),
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
