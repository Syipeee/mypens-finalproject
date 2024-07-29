import 'package:mypens/common/domain/authentication/model/my_pens_user.dart';

class Mahasiswa extends MyPensUser {
  final int nrp;

  Mahasiswa({
    required this.nrp,
    required super.email,
    required super.namaUser,
    required super.nomorUser,
    required super.tipeUser,
    required super.listYearActive,
    required super.currentSemester,
  });
}