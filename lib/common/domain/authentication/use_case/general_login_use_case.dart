import 'package:mypens/common/domain/authentication/i_auth_repository.dart';
import 'package:mypens/common/domain/authentication/model/my_pens_user.dart';
import 'package:mypens/common/domain/authentication/model/user_type_enum.dart';
import 'package:mypens/common/domain/authentication/use_case/get_user_type_by_email_use_case.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';

class GeneralLoginUseCase {
  final IAuthRepository _authRepository;
  final _getUserTypeByEmail = GetUserTypeByEmailUseCase();

  GeneralLoginUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<ApiResponse<MyPensUser>> call({
    required String email,
    required String password,
  }){
    final userType = _getUserTypeByEmail(email);
    switch(userType){
      case UserType.mahasiswa:
        return _authRepository.loginMahasiswa(email: email, password: password);
      case UserType.dosen:
        return _authRepository.loginDosenOrStaff(
          email: email,
          password: password,
          userType: userType,
        );
      case UserType.staff:
        return _authRepository.loginDosenOrStaff(
          email: email,
          password: password,
          userType: userType,
        );
      case UserType.unknown:
        throw Exception('Data tidak masuk akal!');
    }
  }
}