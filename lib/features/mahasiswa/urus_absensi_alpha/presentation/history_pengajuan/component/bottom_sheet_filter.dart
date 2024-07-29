import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypens/common/domain/common/model/semester.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';
import 'package:mypens/common/user_interface/style/my_outlined_input_decoration.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:mypens/controllers/common/user_controller.dart';
import 'package:mypens/common/user_interface/labeled_widget.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/history_pengajuan/history_pengajuan_view_model.dart';

class BottomSheetFilter extends StatelessWidget {
  final HistoryPengajuanViewModel viewModel;
  const BottomSheetFilter({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = context.read<UserController>();
    final state = viewModel.state;

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Filter Perizinan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),

              const SizedBox(height: 24,),

              LabeledWidget(
                labelText: 'Tahun Ajaran',
                child: DropdownButtonFormField(
                  items: userController.yearList.map((year) =>
                      DropdownMenuItem(
                        value: year,
                        child: Text('$year/${year + 1}'),
                      )
                  ).toList(),
                  decoration: MyOutlinedInputDecoration(),
                  onChanged: (year){
                    if (year != null) {
                      viewModel.add(OnChangeTahunAjaran(tahunAjaran: year));
                    }
                  },
                  value: state.filterState.tahunAjaran,
                ),
              ),

              const SizedBox(height: 24,),

              LabeledWidget(
                labelText: 'Semester',
                child: DropdownButtonFormField(
                  items: Semester.values.map((semester) =>
                      DropdownMenuItem(
                        value: semester,
                        child: Text(semester.name),
                      )
                  ).toList(),
                  onChanged: (semester){
                    if (semester != null){
                      viewModel.add(OnChangeSemester(semester: semester));
                    }
                  },
                  decoration: MyOutlinedInputDecoration(),
                  value: state.filterState.semester,
                ),
              ),

              const SizedBox(height: 24,),

              LabeledWidget(
                labelText: 'Status Perizinan',
                child: DropdownButtonFormField(
                  items:
                    [null, ...StatusPenerimaanPerizinan.values].map((status) =>
                      DropdownMenuItem(
                        value: status,
                        child: Text(status?.name ?? "Semua"),
                      )
                    ).toList(),
                  onChanged: (status){
                    viewModel.add(OnChangeStatusPerizinan(status: status));
                  },
                  decoration: MyOutlinedInputDecoration(),
                  value: state.filterState.status,
                ),
              ),

            ],
          ),
        ),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 24, right: 24, bottom: 16,
          ),
          child: FilledButton(
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )
            ),
            onPressed: (){
              viewModel.add(MahasiswaReloadListPerizinanAbsensi());
              Navigator.of(context).popUntil(
                (route) =>
                  route.settings.name == MyPensNavRoutes.mahasiswaListAbsensiAlpha
              );
            },
            child: const Text('Terapkan'),
          ),
        ),
      ],
    );
  }
}
