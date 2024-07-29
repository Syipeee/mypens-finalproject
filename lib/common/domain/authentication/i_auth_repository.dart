import 'package:mypens/common/domain/authentication/model/user_type_enum.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/domain/authentication/model/my_pens_user.dart';
import 'package:mypens/common/domain/authentication/model/user_preference.dart';

abstract class IAuthRepository {
  Future<MyPensUser> login({
    required String email,
    required String password,
  });

  Future<ApiResponse<MyPensUser>> loginMahasiswa({
    required String email,
    required String password,
  });

  Future<ApiResponse<MyPensUser>> fetchDataMahasiswaFromNrp({
    required int nrp,
    required String email,
  });

  Future<ApiResponse<MyPensUser>> loginDosenOrStaff({
    required String email,
    required String password,
    required UserType userType,
  });

  Future<ApiResponse<MyPensUser>> fetchDataDosenOrStaffFromNip({
    required UserType userType,
    required String nip,
    required String email,
  });
  
  Future<ApiResponse<dynamic>> logout();

  Future<UserPreference?> getUserPreference();
}