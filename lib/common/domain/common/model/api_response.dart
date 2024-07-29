sealed class ApiResponse<T>{}

class ApiResponseSucceed<T> extends ApiResponse<T> {
  final T? data;

  // Untuk keperluan pagination, apakah data setelahnya ada
  final bool isNextDataExists;

  ApiResponseSucceed({
    this.data,
    this.isNextDataExists = false,
  }) : super();
}

class ApiResponseFailed<T> extends ApiResponse<T>{
  final Exception? exception;
  final Map<String , List<String>>? errors;
  ApiResponseFailed({this.exception , this.errors}) : super();
}

class ApiResponseLoading<T> extends ApiResponse<T>{
  final String? progress;
  ApiResponseLoading({this.progress}) : super();
}