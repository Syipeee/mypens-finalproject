import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_asssessment.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/read_assessment_response.dart';

import 'package:provider/provider.dart' as provider;

class ReadAssessmentProviders extends ChangeNotifier {
  final GetReadAssessment getReadAssessment;
  List<ReadAssessmentData>? _ReadAssessments;

  ReadAssessmentProviders({required this.getReadAssessment});

  List<ReadAssessmentData>? get ReadAssessments => _ReadAssessments;

  Future<void> getReadAssessmentData() async {
    try {
      final result = await getReadAssessment.execute();
      _ReadAssessments = result;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  static ReadAssessmentProviders of(BuildContext context,
      {required bool listen}) {
    return provider.Provider.of<ReadAssessmentProviders>(context,
        listen: listen);
  }
}
