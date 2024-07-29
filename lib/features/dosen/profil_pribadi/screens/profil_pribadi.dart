import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/staff/profil_pribadi.dart';

class ProfilPribadi extends StatefulWidget {
  const ProfilPribadi({super.key});

  @override
  State<ProfilPribadi> createState() => _ProfilPribadiState();
}

class _ProfilPribadiState extends State<ProfilPribadi> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProfilPribadiController>(context, listen: false);
      data.getDetail();
    });
  }

  renderProfilPribadi(profil, hasError) {
    if (hasError != "") {
      return [
        Center(
            child: SelectableText(
          hasError,
          textAlign: TextAlign.center,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ))
      ];
    }

    return [
      const Text(
        'NIP',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (profil.detail != null) ...[
        if (profil.detail.data.length == 1)
          SelectableText("""${profil.detail.data.first.nip}"""),
        if (profil.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'NIDN',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (profil.detail != null) ...[
        if (profil.detail.data.length == 1)
          SelectableText("""${profil.detail.data.first.nidn}"""),
        if (profil.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Nama',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (profil.detail != null) ...[
        if (profil.detail.data.length == 1)
          SelectableText("""${profil.detail.data.first.nama}"""),
        if (profil.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Gelar Depan',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (profil.detail != null) ...[
        if (profil.detail.data.length == 1)
          SelectableText("""${profil.detail.data.first.gelarDpn}"""),
        if (profil.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Gelar Belakang',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (profil.detail != null) ...[
        if (profil.detail.data.length == 1)
          SelectableText("""${profil.detail.data.first.gelarBlk}"""),
        if (profil.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Golongan Akhir',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (profil.detail != null) ...[
        if (profil.detail.data.length == 1)
          SelectableText("""${profil.detail.data.first.golakhir}"""),
        if (profil.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Jabatan Fungsional',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (profil.detail != null) ...[
        if (profil.detail.data.length == 1)
          SelectableText("""${profil.detail.data.first.jabatanFungsional}"""),
        if (profil.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Status',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (profil.detail != null) ...[
        if (profil.detail.data.length == 1)
          SelectableText("""${profil.detail.data.first.staff}"""),
        if (profil.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Alamat',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (profil.detail != null) ...[
        if (profil.detail.data.length == 1)
          SelectableText("""${profil.detail.data.first.alamat}"""),
        if (profil.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Telp',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (profil.detail != null) ...[
        if (profil.detail.data.length == 1)
          SelectableText("""${profil.detail.data.first.telp}"""),
        if (profil.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    ProfilPribadiController profilPribadi =
        Provider.of<ProfilPribadiController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Profil Pribadi'),
        scrolledUnderElevation: 0.0,
      ),
      backgroundColor: const Color(0xfff3f3f3),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: renderProfilPribadi(
                            profilPribadi, profilPribadi.hasError),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
