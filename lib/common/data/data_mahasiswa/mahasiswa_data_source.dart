import 'package:mypens/common/data/common/dto/my_pens_api_data_wrapper.dart';
import 'package:mypens/common/data/data_mahasiswa/login_mahasiswa_api_client.dart';
import 'package:mypens/common/data/data_mahasiswa/mahasiswa_api_client.dart';
import 'package:mypens/common/data/data_mahasiswa/dto/detail_mahasiswa_dto.dart';

class MahasiswaDataSource {
  final _loginApiClient = LoginMahasiswaApiClient();
  final _dataMahasiswaApiClient = MahasiswaApiClient();
  
  Future<int> getNrpByEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await _loginApiClient
      .loginMahasiswa(email: email, password: password);
    if (response.statusCode != 200){
      throw Exception('Password atau email anda salah!');
    }
    final nrp = response.body.split(':')[1];
    return int.parse(nrp);
  }

  Future<MyPensApiDataWrapper<DetailMahasiswaDto>> getListMahasiswa({
    int? nrp,
  }) async {
    final response = await _dataMahasiswaApiClient.getListMahasiswa(
      nrp: nrp
    );
    return MyPensApiDataWrapper.fromJsonString(
      response.body,
      dataMapper: DetailMahasiswaDto.fromJson
    );
  }
}