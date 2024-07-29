import 'package:mypens/controllers/staff/profil_pegawai.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../constants/colors.dart';

class ProfilPegawai extends StatefulWidget {
  const ProfilPegawai({Key? key}) : super(key: key);

  @override
  State<ProfilPegawai> createState() => _ProfilDosenState();
}

class _ProfilDosenState extends State<ProfilPegawai> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var pegawai =
          Provider.of<ProfilPegawaiController>(context, listen: false);
      pegawai.getListProfilPegawai();
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

    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: yellowPens,
        valueColor: AlwaysStoppedAnimation(bluePens),
      ),
    );
  }

  renderProfilPegawai(obj, isLoading, hasError) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: yellowPens,
          valueColor: AlwaysStoppedAnimation(bluePens),
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
            itemCount: obj.searched.length,
            itemBuilder: (context, index) {
              final listDosen = obj.searched[index];

              return Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nama :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SelectableText(listDosen.nama),
                      const Text(
                        'NIP :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SelectableText(listDosen.nip),
                      const Text(
                        'NIDN :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SelectableText(listDosen.nidn),
                      const Text(
                        'Gol. Akhir :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SelectableText(listDosen.golakhir),
                      const Text(
                        'Jabatan Fungsional :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SelectableText(listDosen.jabatanFungsional),
                      const Text(
                        'Status :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SelectableText(listDosen.staff),
                      const Text(
                        'Alamat :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SelectableText(listDosen.alamat),
                      const Text(
                        'Telp :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SelectableText(listDosen.telp),
                    ],
                  ));
            }));
  }

  @override
  Widget build(BuildContext context) {
    ProfilPegawaiController profilPegawai =
        Provider.of<ProfilPegawaiController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Profil Pegawai'),
        scrolledUnderElevation: 0.0,
      ),
      backgroundColor: const Color(0xfff3f3f3),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Tulis Nama Pegawai...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.blue))),
            onChanged: profilPegawai.onSearch,
          ),
          const SizedBox(
            height: 10,
          ),
          profilPegawai.profilDosenList.isNotEmpty
              ? renderProfilPegawai(profilPegawai, profilPegawai.isLoading,
                  profilPegawai.hasError)
              : renderLoader(profilPegawai.hasError)
        ]),
      ),
    ));
  }
}
