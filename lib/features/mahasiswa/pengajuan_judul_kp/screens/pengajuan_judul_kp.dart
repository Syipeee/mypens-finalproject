import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/mahasiswa/pengajuan_judul_kp.dart';

class PengajuanJudulKp extends StatefulWidget {
  const PengajuanJudulKp({Key? key}) : super(key: key);

  @override
  _PengajuanJudulKpState createState() => _PengajuanJudulKpState();
}

class _PengajuanJudulKpState extends State<PengajuanJudulKp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var kp = Provider.of<PengajuanJudulKpController>(context, listen: false);
      kp.getDetail();
    });
  }

  renderPengajuan(kp, hasError) {
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
        'Waktu Pelaksanaan',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (kp.detail != null) ...[
        if (kp.detail.data.length == 1)
          SelectableText("""${kp.detail.data.first.waktuPelaksanaan}"""),
        if (kp.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Tempat',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (kp.detail != null) ...[
        if (kp.detail.data.length == 1)
          SelectableText("""${kp.detail.data.first.tempat}"""),
        if (kp.detail.data.length == 0) const Text("-"),
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
      if (kp.detail != null) ...[
        if (kp.detail.data.length == 1)
          SelectableText("""${kp.detail.data.first.alamat}"""),
        if (kp.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Kota',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (kp.detail != null) ...[
        if (kp.detail.data.length == 1)
          SelectableText("""${kp.detail.data.first.kota}"""),
        if (kp.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Waktu Pelaksanaan',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (kp.detail != null) ...[
        if (kp.detail.data.length == 1)
          SelectableText("""${kp.detail.data.first.waktuPelaksanaan}"""),
        if (kp.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Pembimbing',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (kp.detail != null) ...[
        if (kp.detail.data.length == 1)
          SelectableText("""${kp.detail.data.first.pembimbing}"""),
        if (kp.detail.data.length == 0) const Text("-"),
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
      if (kp.detail != null) ...[
        if (kp.detail.data.length == 1)
          SelectableText("""${kp.detail.data.first.statusPenerimaan}"""),
        if (kp.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ],
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Catatan',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      if (kp.detail != null) ...[
        if (kp.detail.data.length == 1)
          SelectableText("""${kp.detail.data.first.catatan}"""),
        if (kp.detail.data.length == 0) const Text("-"),
      ] else ...[
        const Text('Loading...')
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    PengajuanJudulKpController kp =
        Provider.of<PengajuanJudulKpController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Pengajuan Tempat Kerja Praktik'),
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
                              children: renderPengajuan(kp, kp.hasError),
                            )),
                      ])),
            ],
          ),
        ),
      ),
    ));
  }
}
