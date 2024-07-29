import 'dart:convert';


class MyPensApiDataWrapper<T> {
  final String? status;
  final List<T>? data;
  final String? message;
  final String? desc;
  MyPensApiDataWrapper({
    required this.status,
    required this.data,
    required this.message,
    required this.desc,
  });

  static MyPensApiDataWrapper<T> _fromJson<T>(
    Map<String , dynamic> json, {
    required T Function(Map<String, dynamic> json)? dataMapper,
  }) {
    dynamic mappedData;
    if (json['data'] is List<dynamic>?) {
      final rawListData = json['data'] as List<dynamic>?;
      if (dataMapper != null){
        mappedData = rawListData?.map((json) => dataMapper(json)).toList();
      }
    }

    return MyPensApiDataWrapper(
      status: json['status'] as String?,
      data: mappedData,
      message: json['message'] as String?,
      desc: json['desc'] as String?,
    );
  }
  factory MyPensApiDataWrapper.fromJsonString(
    String json, {
    required T Function(Map<String, dynamic> json)? dataMapper,
  }) =>
    MyPensApiDataWrapper._fromJson(jsonDecode(json), dataMapper: dataMapper);
}