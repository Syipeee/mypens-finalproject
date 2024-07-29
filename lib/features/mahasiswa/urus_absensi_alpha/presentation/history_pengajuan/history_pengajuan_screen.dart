import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypens/common/data/perizinan_absensi/perizinan_absensi_repository.dart';
import 'package:mypens/common/user_interface/api_response_loader.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:mypens/controllers/common/user_controller.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/history_pengajuan/component/bottom_sheet_filter.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/history_pengajuan/component/kartu_preview_pengajuan.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/history_pengajuan/history_pengajuan_view_model.dart';

class HistoryPengajuanScreen extends StatelessWidget {
  const HistoryPengajuanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = context.read<UserController>();

    return BlocProvider(
      create: (context) => HistoryPengajuanViewModel(
        repository: PerizinanAbsensiRepository(),
        lastYear: userController.yearList.first,
        lastSemester: userController.maxSemester,
        nomorMahasiswa: userController.userNomor,
      ),
      child: BlocBuilder<HistoryPengajuanViewModel , HistoryPengajuanUiState>(
        buildWhen: (prevState, curState){
          return prevState.listPerizinanAbsensiResponse.runtimeType !=
            curState.listPerizinanAbsensiResponse.runtimeType;
        },
        builder: (context , state) {
          final viewModel = context.read<HistoryPengajuanViewModel>();

          return Scaffold(
            appBar: AppBar(
              title: const Text("Urus Absensi Alpha"),
              scrolledUnderElevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: (){
                    showModalBottomSheet(
                      context: context,
                      builder: (context) =>
                        BottomSheetFilter(
                          viewModel: viewModel,
                        )
                    );
                  },
                )
              ],
            ),
            body: Center(
              child: ApiResponseLoader(
                apiResponse: state.listPerizinanAbsensiResponse,
                onRefresh: (){
                  viewModel.add(MahasiswaReloadListPerizinanAbsensi());
                },
                childBuilder: (context, data){
                  return ListView.separated(
                    padding: const EdgeInsets.all(24),
                    itemBuilder: (context, index){
                      return KartuPreviewPengajuan(data: data[index],);
                    },
                    separatorBuilder: (context, index){
                      return const SizedBox(height: 24,);
                    },
                    itemCount: data.length,
                  );
                }
              ),
            ),
            floatingActionButton: FloatingActionButton(
              key: const ValueKey("urus_absensi_fab"),
              child: const Icon(Icons.add),
              onPressed: (){
                Navigator.of(context).pushNamed(
                  MyPensNavRoutes.mahasiswaInputPengajuanAbsensi
                ).then((isInserted){
                  if (isInserted is bool?) {
                    if (isInserted == true) {
                      viewModel.add(MahasiswaReloadListPerizinanAbsensi());
                    }
                  }
                });
              }
            ),
          );
        }
      ),
    );
  }
}
