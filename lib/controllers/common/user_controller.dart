import 'package:flutter/material.dart';
import 'package:mypens/common/domain/authentication/model/my_pens_user.dart';
import 'package:mypens/common/domain/authentication/model/staff.dart';
import 'package:mypens/common/domain/authentication/use_case/general_login_use_case.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/domain/authentication/model/dosen.dart';
import 'package:mypens/common/domain/authentication/model/mahasiswa.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/data/authentication/auth_repository.dart';
import 'package:mypens/common/domain/authentication/i_auth_repository.dart';
import 'package:mypens/common/domain/authentication/model/user_type_enum.dart';

class UserController extends ChangeNotifier {

  final IAuthRepository _authRepository;
  final GeneralLoginUseCase _generalLogin;

  UserController({
    IAuthRepository? authRepository,
  }) : _authRepository = AuthRepository(),
        _generalLogin = GeneralLoginUseCase(authRepository: AuthRepository());

  // Untuk semua user
  String userNama = '';
  UserType userType = UserType.unknown;
  String userEmail = '';
  int userNomor = 0;
  List<int> yearList = [];
  Semester maxSemester = Semester.ganjil;
  
  // Khusus untuk mahasiswa
  int nrpMahasiswa = 0;

  // Khusus untuk dosen dan staff
  String nipDosenOrStaff = '';

  Future<ApiResponse<MyPensUser>> loginForGeneralUser({
    required String email,
    required String password,
  }) async {
    final response = await _generalLogin(email: email, password: password);
    if (response is ApiResponseSucceed<MyPensUser>){
      setCurrentSessionUser(response.data!);
    }
    return response;
  }

  Future<ApiResponse<MyPensUser>> fetchDataDosenOrStaffByNip({
    required String nip,
    required String email,
  }) async {
    final result = await _authRepository
      .fetchDataDosenOrStaffFromNip(
        userType: UserType.dosen,
        nip: nip,
        email: email
      );

    if (result is ApiResponseSucceed<MyPensUser>){
      final staff = result.data!;
      setCurrentSessionUser(staff);
    }
    return result;
  }
  
  void setCurrentSessionUser(MyPensUser? user){
    if (user == null) { return; }
    userEmail = user.email;
    userNama = user.namaUser;
    yearList = user.listYearActive;
    maxSemester = user.currentSemester;
    userNomor = user.nomorUser;
    userType = user.tipeUser;

    if (user is Dosen){
      nipDosenOrStaff = user.nip;
    } else if (user is Staff) {
      nipDosenOrStaff = user.nip;
    } else if (user is Mahasiswa) {
      nrpMahasiswa = user.nrp;
    }
  }

  ApiResponse<dynamic>? _logoutResponse;
  ApiResponse<dynamic>? get logoutResponse => _logoutResponse;
  Future<void> onLogout() async {
    if (_logoutResponse is ApiResponseLoading){
      return;
    }

    _logoutResponse = ApiResponseLoading();
    notifyListeners();
    
    _logoutResponse = await _authRepository.logout();
    notifyListeners();
  }
  void onDoneShowLogoutErrorMessage(){
    _logoutResponse = null;
  }
  void onSucceedLogout(){
    _logoutResponse = null;
  }
}
