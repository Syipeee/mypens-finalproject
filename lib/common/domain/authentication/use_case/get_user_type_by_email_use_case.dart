import 'package:mypens/common/domain/authentication/model/user_type_enum.dart';

class GetUserTypeByEmailUseCase {
  UserType call(String email) {
    if (email.contains('student')) {
      return UserType.mahasiswa;
    } else if (email.contains('staff')) {
      return UserType.staff;
    } else if (email.contains('@pens.ac.id')) {
      return UserType.dosen;
    } else {
      return UserType.unknown;
    }
  }

}