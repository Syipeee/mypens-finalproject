import 'package:mypens/common/domain/common/model/semester.dart';

class GetListTahunAndSemesterUseCase {
  (List<int> listTahun , Semester currentSemester) call(){
    final now = DateTime.now();
    late Semester semester;
    if (now.month >= 8 || now.month == 1) {
      semester = Semester.ganjil;
    } else {
      semester = Semester.genap;
    }

    final listTahun = List.generate(5, (index) =>
      now.year - index
    );

    return (listTahun, semester);
  }
}