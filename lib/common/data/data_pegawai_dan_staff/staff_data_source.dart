import 'package:mypens/common/data/common/dto/my_pens_api_data_wrapper.dart';
import 'package:mypens/common/data/data_pegawai_dan_staff/login_staff_api_client.dart';
import 'package:mypens/common/data/data_pegawai_dan_staff/staff_api_client.dart';
import 'package:mypens/common/data/data_pegawai_dan_staff/dto/detail_dosen_or_staff_dto.dart';
import 'package:mypens/common/domain/authentication/model/user_type_enum.dart';

class StaffDataSource {
  final _loginApiClient = LoginStaffApiClient();
  final _dataStaffApiClient = StaffApiClient();


  Future<String> getNip({
    required String email,
    required String password,
    required UserType userType,
  }) async {
    final response = await _loginApiClient.getNipFromEmailAndPassword(
      email: email,
      password: password,
      userType: userType
    );
    if (response.statusCode != 200){
      throw Exception('Password atau email anda salah!');
    }
    final nip = response.body.split(':')[1];
    return nip;
  }

  Future<MyPensApiDataWrapper<DetailDosenOrStaffDto>> getStaff({
    String? nip,
  }) async {
    final response = await _dataStaffApiClient.getDataDosenOrStaff(nip: nip);
    return MyPensApiDataWrapper.fromJsonString(
      response.body,
      dataMapper: DetailDosenOrStaffDto.fromJson
    );
  }
}