import 'package:mypens/controllers/mahasiswa/profil_dosen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../constants/colors.dart';
import './profil_dosen_detail.dart';

class ProfilDosen extends StatefulWidget {
  const ProfilDosen({Key? key}) : super(key: key);

  @override
  State<ProfilDosen> createState() => _ProfilDosenState();
}

class _ProfilDosenState extends State<ProfilDosen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var profilDosen =
          Provider.of<ProfilDosenController>(context, listen: false);
      profilDosen.getListProfilDosen();
    });
  }

  renderLoader(hasError) {
    if (hasError != "") {
      return Container(
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
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 30),
      child: const Center(
        child: CircularProgressIndicator(
          backgroundColor: yellowPens,
          valueColor: AlwaysStoppedAnimation(bluePens),
        ),
      ),
    );
  }

  renderNews(obj, isLoading, hasError) {
    if (isLoading) {
      return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 30),
        child: const Center(
          child: CircularProgressIndicator(
            backgroundColor: yellowPens,
            valueColor: AlwaysStoppedAnimation(bluePens),
          ),
        ),
      );
    }

    if (hasError != "") {
      return Container(
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
      );
    }

    return Expanded(
        child: ListView.builder(
            itemCount: obj.length,
            itemBuilder: (context, index) {
              final listDosen = obj[index];

              return Container(
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),
                child: ListTile(
                  style: ListTileStyle.drawer,
                  title: listDosen.nip == 'Kosong'
                      ? Text("${listDosen.nama}\n-")
                      : Text("${listDosen.nama}\n${listDosen.nip}"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ProfilDosenDetail(
                                nip: listDosen.nip,
                                nidn: listDosen.nidn,
                                nama: listDosen.nama,
                                golakhir: listDosen.golakhir,
                                jabatanFungsional: listDosen.jabatanFungsional,
                                jenis: listDosen.jenis,
                                telp: listDosen.telp))));
                  },
                ),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    ProfilDosenController profilDosen =
        Provider.of<ProfilDosenController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Profil Dosen'),
        scrolledUnderElevation: 0.0,
      ),
      backgroundColor: const Color(0xfff3f3f3),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Pencarian Nama Dosen',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blue))),
              onChanged: profilDosen.onSearch,
            ),
            const SizedBox(
              height: 10,
            ),
            profilDosen.searched.isNotEmpty
                ? renderNews(profilDosen.searched, profilDosen.isLoading,
                    profilDosen.hasError)
                : renderLoader(profilDosen.hasError),
          ],
        ),
      ),
    ));
  }
}
