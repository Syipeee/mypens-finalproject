import 'package:equatable/equatable.dart';

class VmyKuliah extends Equatable {
  final String mataKuliah;
  final String namaDosen;
  final String jam;
  final String ruang;
  final String hari;
  final String jam2;
  final String ruang2;
  final String hari2;
  final String jam2Kp;
  final String ruang2Kp;
  final String hari2Kp;

  const VmyKuliah(
      {required this.mataKuliah,
      required this.namaDosen,
      required this.jam,
      required this.ruang,
      required this.hari,
      required this.jam2,
      required this.ruang2,
      required this.hari2,
      required this.jam2Kp,
      required this.ruang2Kp,
      required this.hari2Kp});

  @override
  List<Object?> get props => [
        mataKuliah,
        namaDosen,
        jam,
        ruang,
        hari,
        jam2,
        ruang2,
        hari2,
        jam2Kp,
        ruang2Kp,
        hari2Kp
      ];
}
