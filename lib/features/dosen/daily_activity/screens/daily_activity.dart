import 'package:flutter/services.dart';
import 'package:mypens/controllers/staff/daily_activity.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class DosenDailyActivity extends StatefulWidget {
  const DosenDailyActivity({super.key});

  @override
  State<DosenDailyActivity> createState() => _DailyActivityState();
}

class _DailyActivityState extends State<DosenDailyActivity> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var activity =
          Provider.of<DailyActivityController>(context, listen: false);
      activity.renderInitDate();
      activity.getDetailToday();
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

  renderDailyActivity(obj, isLoading, hasError) {
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
          padding: const EdgeInsets.only(
            bottom: 30,
          ),
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
                              'Tanggal',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText("""${element.tanggal}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Tempat',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText("""${element.location}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Judul',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            if (element.title == null) ...[
                              const Text('-')
                            ] else ...[
                              SelectableText("""${element.title}"""),
                            ],
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Catatan',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText("""${element.notes}"""),
                          ],
                        )),
                  ]))));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    DailyActivityController dailyActivity =
        Provider.of<DailyActivityController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Daily Activity'),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Theme(
                                        data: ThemeData.light().copyWith(
                                            colorScheme:
                                                const ColorScheme.light(
                                                    primary: bluePens)),
                                        child: child!);
                                  },
                                  context: context,
                                  initialDate: dailyActivity.choosenDate,
                                  firstDate: DateTime(2019),
                                  lastDate: DateTime(2030));

                              if (newDate == null) {
                                return;
                              }

                              dailyActivity.setChoosenDate(newDate);
                              dailyActivity.isLoading = true;
                            },
                            child: const Text('Pilih Tanggal'))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: dailyActivity.detail != null
                      ? renderDailyActivity(dailyActivity.detail,
                          dailyActivity.isLoading, dailyActivity.hasError)
                      : renderLoader(dailyActivity.hasError),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
