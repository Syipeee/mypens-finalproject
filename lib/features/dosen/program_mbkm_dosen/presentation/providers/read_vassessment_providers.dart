import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_vassessment.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/read_vassessment_response.dart';

import 'package:provider/provider.dart' as provider;

class VReadAssessmentProviders extends ChangeNotifier {
  final GetVReadAssessment getVReadAssessment;
  List<VReadAssessmentData>? _ReadVAssessments;

  VReadAssessmentProviders({required this.getVReadAssessment});

  List<VReadAssessmentData>? get ReadVAssessments => _ReadVAssessments;

  Future<void> getVReadAssessmentData() async {
    try {
      final result = await getVReadAssessment.execute();
      _ReadVAssessments = result;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  static VReadAssessmentProviders of(BuildContext context,
      {required bool listen}) {
    return provider.Provider.of<VReadAssessmentProviders>(context,
        listen: listen);
  }
}
