// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mypens/common/user_interface/kotak_fitur_warna_warni.dart';
import 'package:mypens/features/mahasiswa/home/screens/home.dart';
import 'package:mypens/features/mahasiswa/list_akademik/view_model/list_akademik_view_model.dart';
import '../../../../constants/colors.dart';

class ListAkademik extends StatefulWidget {
  const ListAkademik({Key? key}) : super(key: key);

  @override
  _ListAkademikState createState() => _ListAkademikState();
}

class _ListAkademikState extends State<ListAkademik> {

  final _viewModel = ListAkademikViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: Text('Menu Akademik'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MahasiswaHome()),
            );
          },
        ),
      ),
      backgroundColor: Color(0xfff3f3f3),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: GridView.count(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 4,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  for (final model in _viewModel.listAkademikItems)
                    KotakFiturWarnaWarni(
                      judulFitur: model.judul,
                      warnaKotak: model.warnaKotak,
                      onClick: (){
                        Navigator.of(context)
                          .pushNamed(model.nextRoute);
                      },
                    )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
