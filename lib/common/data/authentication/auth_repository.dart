import 'package:mypens/common/data/push_notification_service/firebase_cloud_messaging_service.dart';
import 'package:mypens/common/data/shared_preference/shared_preference_service.dart';
import 'package:mypens/common/data/common/surround_with_http_try_catch.dart';
import 'package:mypens/common/data/data_mahasiswa/mahasiswa_data_source.dart';
import 'package:mypens/common/data/data_pegawai_dan_staff/staff_data_source.dart';
import 'package:mypens/common/data/vmy_kuliah/vmy_kuliah_data_source.dart';
import 'package:mypens/common/domain/authentication/model/staff.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/data/vmy_kuliah/vmy_kuliah_mapper.dart';
import 'package:mypens/common/domain/authentication/model/dosen.dart';
import 'package:mypens/common/domain/authentication/model/mahasiswa.dart';
import 'package:mypens/common/domain/authentication/model/my_pens_user.dart';
import 'package:mypens/common/domain/authentication/i_auth_repository.dart';
import 'package:mypens/common/domain/authentication/use_case/get_list_tahun_and_semester_use_case.dart';
import 'package:mypens/common/domain/authentication/model/user_type_enum.dart';
import 'package:mypens/common/domain/authentication/model/user_preference.dart';

class AuthRepository implements IAuthRepository {
  final _vmyKuliahDataSource = VmyKuliahDataSource();
  final _vmyKuliahMapper = VmyKuliahMapper();
  final _getListTahunAndSemester = GetListTahunAndSemesterUseCase();
  final _sharedPrefService = SharedPreferenceService();
  final _mahasiswaDataSource = MahasiswaDataSource();
  final _staffDataSource = StaffDataSource();
  final _fcmService = FirebaseCloudMessagingService();

  @override
  Future<MyPensUser> login({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<MyPensUser>> loginMahasiswa({
    required String email,
    required String password
  }) async {
    return surroundWithHttpTryCatch(() async {
      final nrp = await _mahasiswaDataSource
        .getNrpByEmailAndPassword(email: email, password: password);

      return fetchDataMahasiswaFromNrp(
        nrp: nrp, email: email,
      );
    });
  }

  @override
  Future<ApiResponse<MyPensUser>> fetchDataMahasiswaFromNrp({
    required int nrp,
    required String email,
  }){
    return surroundWithHttpTryCatch(() async {
      final detailMahasiswaDto = (await _mahasiswaDataSource
          .getListMahasiswa(nrp: nrp))
          .data!.single;

      final listVmyKuliah = await _vmyKuliahDataSource
          .getListVmyKuliahDto(
          nomorMahasiswa: detailMahasiswaDto.nomor!);
      final (listTahun , maxSemester) = _vmyKuliahMapper
          .getListTahunAndMaxSemesterFromBody(listVmyKuliah);

      await _sharedPrefService.storeUserPreference(
        userType: UserType.mahasiswa,
        nipOrNrp: nrp.toString(),
        email: email,
      );
      final mahasiswa = Mahasiswa(
        nrp: nrp,
        listYearActive: listTahun,
        currentSemester: maxSemester,
        email: email,
        namaUser: detailMahasiswaDto.nama!,
        nomorUser: detailMahasiswaDto.nomor!,
        tipeUser: UserType.mahasiswa,
      );

      return ApiResponseSucceed(data: mahasiswa);
    });
  }

  @override
  Future<ApiResponse<MyPensUser>> loginDosenOrStaff({
    required String email,
    required String password,
    required UserType userType
  }) async {
    assert(userType == UserType.dosen || userType == UserType.staff);
    return surroundWithHttpTryCatch(() async {
      final nip = await _staffDataSource.getNip(
        email: email,
        password: password,
        userType: userType,
      );

      return fetchDataDosenOrStaffFromNip(
        nip: nip,
        email: email,
        userType: userType
      );
    });
  }

  @override
  Future<ApiResponse<MyPensUser>> fetchDataDosenOrStaffFromNip({
    required String nip,
    required String email,
    required UserType userType,
  }) async {
    assert(userType == UserType.dosen || userType == UserType.staff);
    return surroundWithHttpTryCatch(()async {
      final detailDosenDto = (await _staffDataSource.getStaff(
          nip: nip)).data!.single;

      final (listTahun, maxSemester) = _getListTahunAndSemester();

      _fcmService.subscribeToDosenPerizinanAbsensiTopic(nip: nip);

      await _sharedPrefService.storeUserPreference(
        userType: userType,
        nipOrNrp: nip,
        email: email,
      );

      return ApiResponseSucceed(
        data: userType == UserType.dosen ? Dosen(
          nip: nip,
          email: email,
          namaUser: detailDosenDto.nama!,
          nomorUser: detailDosenDto.nomor!,
          tipeUser: UserType.dosen,
          listYearActive: listTahun,
          currentSemester: maxSemester,
        ) : Staff(
          nip: nip,
          email: email,
          namaUser: detailDosenDto.nama!,
          nomorUser: detailDosenDto.nomor!,
          tipeUser: UserType.dosen,
          listYearActive: listTahun,
          currentSemester: maxSemester,
        ),
      );
    });
  }

  @override
  Future<ApiResponse<dynamic>> logout() async {
    return surroundWithHttpTryCatch(() async {
      final userPref = await _sharedPrefService.getCurrentUserPreference();
      if (userPref!.userType == UserType.dosen) {
        await _fcmService.unsubscribeToDosenPerizinanAbsensiTopic(
            nip: userPref.nipOrNrp);
      }

      await _sharedPrefService.deleteCurrentUserPreference();
      return ApiResponseSucceed();
    });
  }

  @override
  Future<UserPreference?> getUserPreference() async {
    return _sharedPrefService.getCurrentUserPreference();
  }
}