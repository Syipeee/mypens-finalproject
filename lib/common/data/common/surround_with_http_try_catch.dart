
import 'package:http/http.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';

Future<ApiResponse<T>> surroundWithHttpTryCatch<T>(
  Future<ApiResponse<T>> Function() body,
) async {
  try {
    return await body();
  } on ClientException {
    return ApiResponseFailed(exception: ClientException('Gagal tersambung ke server'));
  } catch (e) {
    return ApiResponseFailed(exception: Exception(e.toString()));
  }
}