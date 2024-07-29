import 'package:mypens/common/domain/authentication/model/my_pens_user.dart';

class Staff extends MyPensUser {
  final String nip;
  Staff({
    required this.nip,
    required super.email,
    required super.namaUser,
    required super.nomorUser,
    required super.tipeUser,
    required super.listYearActive,
    required super.currentSemester,
  });
}