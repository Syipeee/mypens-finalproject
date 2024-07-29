import 'package:mypens/common/domain/authentication/model/my_pens_user.dart';

class Dosen extends MyPensUser {
  /// Nomor induk pegawai
  final String nip;
  Dosen({
    required this.nip,
    required super.email,
    required super.namaUser,
    required super.nomorUser,
    required super.tipeUser,
    required super.listYearActive,
    required super.currentSemester,
  });
}