import 'package:flutter/material.dart';

///  Ini untuk ngedisplay item fitur yang bentuknya kotak-kotak dan warna-warni
///  (Coba lihat di halaman beranda, di bawah pas tulisan 'Akademik')
class KotakFiturWarnaWarni extends StatelessWidget {
  final String _judulFitur;
  final Color _warnaKotak;
  final void Function() _onClick;

  const KotakFiturWarnaWarni({
    required String judulFitur,
    required Color warnaKotak,
    required void Function() onClick,
    super.key,
  }) : _onClick = onClick,
        _warnaKotak = warnaKotak,
        _judulFitur = judulFitur;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onClick,
      child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _warnaKotak,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Text(
                _judulFitur,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )),
    );
  }
}

class KotakFiturWarnaWarniModel1 {
  final String judul;
  final Color warnaKotak;
  final String nextRoute;
  KotakFiturWarnaWarniModel1({
    required this.judul,
    required this.warnaKotak,
    required this.nextRoute,
  });
}