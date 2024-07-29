import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypens/common/user_interface/api_response_loader.dart';
import 'package:mypens/controllers/common/user_controller.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/list_preview_perizinan_absensi/dosen_list_perizinan_absensi_view_model.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/list_preview_perizinan_absensi/ui_components/dosen_absensi_filter_bottom_sheet.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/list_preview_perizinan_absensi/ui_components/dosen_list_perizinan_card.dart';

class DosenListPerizinanAbsensiScreen extends StatelessWidget {
  const DosenListPerizinanAbsensiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = context.read<UserController>();
    return BlocProvider(
      create: (context) => DosenListPerizinanAbsensiViewModel(
        maxSemester: userController.maxSemester,
        maxTahunAjaran: userController.yearList.first,
        nomorDosen: userController.userNomor,
        
      ),
      child: BlocBuilder<DosenListPerizinanAbsensiViewModel , DosenListPerizinanAbsensiUiState>(
        buildWhen: (prevState, curState){
          return prevState.listPerizinanAbsensiResponse.runtimeType !=
            curState.listPerizinanAbsensiResponse.runtimeType;
        },
        builder: (context, state) {
          final viewModel = context.read<DosenListPerizinanAbsensiViewModel>();

          return Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
              title: const Text("Perizinan Absensi"),
              actions: [
                IconButton(
                  onPressed: (){
                    showModalBottomSheet(
                      context: context,
                      builder: (context) =>
                        DosenAbsensiFilterBottomSheet(viewModel: viewModel),
                    );
                  },
                  icon: const Icon(Icons.filter_list)
                ),
              ],
            ),
            body: Center(
              child: ApiResponseLoader(
                apiResponse: state.listPerizinanAbsensiResponse,
                onRefresh: (){
                  viewModel.add(OnReloadListPerizinanAbsensi());
                },
                childBuilder: (context, listPerizinan){
                  return ListView.separated(
                    padding: const EdgeInsets.all(24),
                    itemBuilder: (context, index){
                      return DosenListPerizinanCard(data: listPerizinan[index]);
                    },
                    separatorBuilder: (context, index){
                      return const SizedBox(height: 24,);
                    },
                    itemCount: listPerizinan.length,
                  );
                }
              ),
            ),
          );
        }
      ),
    );
  }
}
