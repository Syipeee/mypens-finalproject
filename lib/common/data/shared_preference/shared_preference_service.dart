import 'package:mypens/common/domain/authentication/model/user_type_enum.dart';
import 'package:mypens/common/domain/authentication/model/user_preference.dart';
import 'package:mypens/common/data/shared_preference/shared_preference_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  SharedPreferences? _preferences;

  Future<void> storeUserPreference({
    required UserType userType,
    required String nipOrNrp,
    required String email,
  }) async {
    _preferences ??= await SharedPreferences.getInstance();
    final model = UserPreference(
      userType: userType,
      nipOrNrp: nipOrNrp,
      email: email,
    );
    await _preferences!.setString(
      SharedPreferenceNames.userPreference,
      model.toJsonString(),
    );
  }

  Future<UserPreference?> getCurrentUserPreference() async {
    _preferences ??= await SharedPreferences.getInstance();
    final stringModel = _preferences!.getString(
      SharedPreferenceNames.userPreference
    );
    if (stringModel == null){
      return null;
    }
    return UserPreference.fromJsonString(stringModel);
  }

  Future<void> deleteCurrentUserPreference() async {
    _preferences ??= await SharedPreferences.getInstance();
    await _preferences!.remove(SharedPreferenceNames.userPreference);
  }
}