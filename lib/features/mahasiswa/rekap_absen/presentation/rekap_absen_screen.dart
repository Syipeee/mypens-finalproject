import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/user_interface/api_response_loader.dart';
import 'package:mypens/common/user_interface/labeled_widget.dart';
import 'package:mypens/constants/colors.dart';
import 'package:mypens/controllers/common/user_controller.dart';
import 'package:mypens/features/mahasiswa/rekap_absen/presentation/rekap_absen_mahasiswa_view_model.dart';
import 'package:mypens/features/mahasiswa/rekap_absen/presentation/view_component/rekap_absensi_table.dart';
import 'package:provider/provider.dart';
// import 'package:pluto_grid/pluto_grid.dart';

class RekapAbsenMahasiswa extends StatefulWidget {
  const RekapAbsenMahasiswa({Key? key}) : super(key: key);

  @override
  RekapAbsenMahasiswaState createState() => RekapAbsenMahasiswaState();
}

class RekapAbsenMahasiswaState extends State<RekapAbsenMahasiswa> {
  @override
  Widget build(BuildContext context) {
    final userController = context.read<UserController>();
    final yearList = userController.yearList;
    final maxSemester = userController.maxSemester;
    
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Rekap Absensi'),
        scrolledUnderElevation: 0,
      ),
      body: ChangeNotifierProvider(
        create: (context) => RekapAbsenMahasiswaViewModel(
          initialTahunAjaran: yearList.first,
          initialSemester: maxSemester,
          nrp: userController.nrpMahasiswa,
        ),
        child: Consumer<RekapAbsenMahasiswaViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                // Single child scroll untuk ngecegah overflow di screen kecil
                SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: 24, left: 24, right: 24, bottom: 4,
                  ),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LabeledWidget(
                        labelText: 'Tahun Ajaran',
                        child: DropdownButton(
                          items: yearList.map((year) => DropdownMenuItem(
                            value: year,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 16,
                                right: 8,
                              ),
                              child: Text("$year/${year+1}"),
                            ),
                          )).toList(),
                          onChanged: viewModel.onChangeTahunAjaran,
                          value: viewModel.tahunAjaran,
                        )
                      ),

                      const SizedBox(width: 24,),

                      LabeledWidget(
                          labelText: 'Semester',
                          child: DropdownButton(
                            items: Semester.values.map((semester) => DropdownMenuItem(
                              value: semester,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 16,
                                  right: 8,
                                ),
                                child: Text(semester.name),
                              ),
                            )).toList(),
                            onChanged: viewModel.onChangeSemester,
                            value: viewModel.semester,
                          )
                      ),
                    ],
                  ),
                ),

                const Divider(color: Colors.grey,),

                Expanded(
                  child: Center(
                    child: ApiResponseLoader(
                      apiResponse: viewModel.rekapAbsensiResponse,
                      onRefresh: viewModel.reloadRekapAbsensi,
                      childBuilder: (context, data){
                        return RekapAbsensiTable(
                          rekapAbsensi: data,
                        );
                      }
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
