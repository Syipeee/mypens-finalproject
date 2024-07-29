class DeleteAssessmentResponse {
  String status;
  int code;
  // final String nomor;

  DeleteAssessmentResponse({
    required this.status,
    required this.code,
    // required this.nomor,
  });

  factory DeleteAssessmentResponse.fromJson(Map<String, dynamic> json) {
    //  print(json['status'].toString());
    // print(json['code'].toString());
    // print(json['data']['NOMOR'].toString());
    return DeleteAssessmentResponse(
      status: json['status'],
      code: json['code'],
      // nomor: json['data']['NOMOR'],
    );
  }
}
