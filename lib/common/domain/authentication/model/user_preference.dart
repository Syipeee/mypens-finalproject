import 'dart:convert';

import 'package:mypens/common/domain/authentication/model/user_type_enum.dart';

class UserPreference {
  final UserType userType;
  final String email;
  final String nipOrNrp;

  UserPreference({
    required this.userType,
    required this.email,
    required this.nipOrNrp,
  });

  String toJsonString(){
    return jsonEncode({
      _userTypeField : userType.typeId,
      _nipOrNrpField : nipOrNrp,
      _emailField : email,
    });
    // return "${userType.typeId}:$nipOrNrp:$email";
  }

  factory UserPreference.fromJsonString(String jsonString){
    final json = jsonDecode(jsonString);
    return UserPreference(
      userType: UserType.fromId(json[_userTypeField]),
      nipOrNrp: json[_nipOrNrpField],
      email: json[_emailField],
    );
  }

  static const _nipOrNrpField = 'nip_or_nrp';
  static const _userTypeField = 'user_type';
  static const _emailField = 'email';
}