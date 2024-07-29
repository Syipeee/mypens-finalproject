import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/user_interface/bottom_navigation.dart';
import '../../../../controllers/common/news.dart';
import '../../../../constants/colors.dart';
import 'package:flutter/services.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
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
      const Center(
        child: CircularProgressIndicator(
          backgroundColor: yellowPens,
          valueColor: AlwaysStoppedAnimation(bluePens),
        ),
      )
    ];
  }

  renderNews(obj, isLoading, hasError) {
    if (isLoading) {
      return [
        const Center(
          child: CircularProgressIndicator(
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

    List<Widget> data = [];
    for (var element in obj.data) {
      data.add(Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: SelectableText("""${element.judul}

Kategori: ${element.kategori}
Oleh: ${element.author}
Tanggal: ${element.tanggalDibuat}

${element.uraian}""",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left))
            ])),
      ));
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    PengumumanController news = Provider.of<PengumumanController>(context);

    return SafeArea(
        child: Scaffold(
      backgroundColor: mainBackground,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        scrolledUnderElevation: 0.0,
        title: const Text('News'),
      ),
      bottomNavigationBar: const BottomNavigation(1),
      body: SingleChildScrollView(
        child: Column(
          children: news.pengumuman != null
              ? renderNews(news.pengumuman, news.isLoading, news.hasError)
              : renderLoader(news.hasError),
        ),
      ),
    ));
  }
}
