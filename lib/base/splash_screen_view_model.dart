import 'package:mypens/base/domain/fetch_user_data_from_user_preference_use_case.dart';
import 'package:mypens/common/data/authentication/auth_repository.dart';
import 'package:mypens/common/domain/authentication/model/my_pens_user.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';

class SplashScreenViewModel {
  final _fetchUserDataFromUserPreference =
    FetchUserDataFromUserPreferenceUseCase(authRepository: AuthRepository());

  Future<MyPensUser?> initializeAppResource() async {
    // check user preference, dan langsung by pass kalo berhasil
    while (true){
      final response = await _fetchUserDataFromUserPreference();
      if (response is ApiResponseSucceed<MyPensUser>){
        return response.data;
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }
}