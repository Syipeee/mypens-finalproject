import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/domain/authentication/model/user_type_enum.dart';

abstract class MyPensUser {
  final String email;
  /// Primary key dari user
  final int nomorUser;
  final String namaUser;
  final UserType tipeUser;
  final List<int> listYearActive;
  final Semester currentSemester;

  MyPensUser({
    required this.listYearActive,
    required this.currentSemester,
    required this.email,
    required this.nomorUser,
    required this.namaUser,
    required this.tipeUser,
  });
}