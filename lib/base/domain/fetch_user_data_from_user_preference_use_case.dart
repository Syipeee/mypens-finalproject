import 'package:mypens/common/domain/authentication/i_auth_repository.dart';
import 'package:mypens/common/domain/authentication/model/my_pens_user.dart';
import 'package:mypens/common/domain/authentication/model/user_type_enum.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';

class FetchUserDataFromUserPreferenceUseCase {
  final IAuthRepository _authRepository;
  FetchUserDataFromUserPreferenceUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<ApiResponse<MyPensUser>> call() async {
    final userPreference = await _authRepository.getUserPreference();

    MyPensUser? user;
    if (userPreference == null){
      return ApiResponseSucceed();
    }

    assert(userPreference.userType != UserType.unknown);
    if (userPreference.userType == UserType.mahasiswa){
      final fetchMahasiswaResponse = await _authRepository.fetchDataMahasiswaFromNrp(
        nrp: int.parse(userPreference.nipOrNrp),
        email: userPreference.email
      );
      if (fetchMahasiswaResponse is ApiResponseFailed){
        return ApiResponseFailed(
          exception: (fetchMahasiswaResponse as ApiResponseFailed).exception
        );
      }
      user = (fetchMahasiswaResponse as ApiResponseSucceed).data!;
    }
    else {
      final fetchResponse = await _authRepository.fetchDataDosenOrStaffFromNip(
        userType: userPreference.userType,
        nip: userPreference.nipOrNrp,
        email: userPreference.email,
      );
      if (fetchResponse is ApiResponseFailed){
        return ApiResponseFailed(
          exception: (fetchResponse as ApiResponseFailed).exception
        );
      }
      user = (fetchResponse as ApiResponseSucceed).data!;
    }
    return ApiResponseSucceed(data: user);
  }
}