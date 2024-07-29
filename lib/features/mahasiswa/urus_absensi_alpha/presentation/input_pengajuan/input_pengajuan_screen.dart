import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/user_interface/style/my_outlined_input_decoration.dart';
import 'package:mypens/controllers/common/user_controller.dart';
import 'package:mypens/common/data/vmy_kuliah/vmy_kuliah_repository.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/mata_kuliah_preview.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/status_absensi.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/input_pengajuan/component/konfirmasi_submit_dialog.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/input_pengajuan/input_pengajuan_view_model.dart';
import 'package:mypens/common/utils/my_date_formatter.dart';

class InputPengajuanScreen extends StatelessWidget {
  const InputPengajuanScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        final userProvider = context.read<UserController>();
        return InputPengajuanViewModel(
          repository: VmyKuliahRepository(),
          idMahasiswa: userProvider.userNomor,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Input Pengajuan"),
          scrolledUnderElevation: 0,
        ),
        body: BlocConsumer<InputPengajuanViewModel , InputPengajuanUiState>(
          buildWhen: (prevState, curState){
            return prevState.tanggal != curState.tanggal ||
              prevState.statusError != curState.statusError ||
              prevState.mataKuliahError != curState.mataKuliahError ||
              prevState.mingguKeError != curState.mingguKeError ||
              prevState.tanggalError != curState.tanggalError ||
              prevState.urlBuktiFileError != curState.urlBuktiFileError ||
              prevState.submitResponse.runtimeType != curState.submitResponse.runtimeType;
          },
          listener: (context, state){
            final submitResponse = state.submitResponse;
            if (submitResponse is ApiResponseSucceed) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pop(true);
              });
            }
            else if (state.submitResponse is ApiResponseFailed){
              final exception = (submitResponse as ApiResponseFailed?)?.exception;
              if (exception != null){
                Fluttertoast.showToast(
                  msg: exception.toString(),
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 5
                );
              }
            }
          },
          builder: (context , state) {
            final viewModel = context.read<InputPengajuanViewModel>();
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(24),
                    children: [
                      DropdownSearch<MataKuliahPreview>(
                        asyncItems: viewModel.loadMataKuliah,
                        itemAsString: (matkul) => matkul.namaMatkul,
                        onChanged: (matkul) => 
                          viewModel.add(OnChangeMataKuliahDipilih(matkul!)),
                        popupProps: const PopupProps.menu(
                          showSearchBox: true,
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              label: Text("Cari Mata Kuliah"),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.search),

                            )
                          )
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)
                            ),
                            label: const Text("Mata Kuliah"),
                            errorText: state.mataKuliahError,
                          )
                        ),
                      ),

                      const SizedBox(height: 24,),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)
                                ),
                                errorMaxLines: 20,
                                label: const Text('Minggu ke'),
                                errorText: state.mingguKeError,
                              ),
                              keyboardType: const TextInputType.numberWithOptions(),
                              onChanged: (text) =>
                                viewModel.add(OnChangeMingguKe(text)),
                            ),
                          ),

                          const SizedBox(width: 24,),

                          Expanded(
                            child: InkWell(
                              onTap: (){
                                showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2015),
                                  lastDate: DateTime(2050),
                                ).then((value){
                                  if (value != null){
                                    viewModel.add(OnChangeTanggal(value));
                                  }
                                });
                              },
                              child: InputDecorator(
                                textAlignVertical: TextAlignVertical.center,
                                isEmpty: state.tanggal == null,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  errorText: state.tanggalError,
                                  label: const Text("Tanggal"),
                                  suffixIcon: const Icon(Icons.calendar_month),
                                  errorMaxLines: 20,
                                ),
                                child: state.tanggal == null ?
                                  null :
                                  Text(
                                    myDateFormatter.format(state.tanggal!),
                                  ),
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 24,),

                      DropdownButtonFormField(
                        items: StatusAbsensi.values.map((status) =>
                          DropdownMenuItem(
                            value: status,
                            child: Text(status.toString()),
                          )
                        ).toList(),
                        value: state.statusYangDiinginkan,
                        decoration: MyOutlinedInputDecoration(
                          label: const Text('Status yang Diinginkan'),
                          errorText: state.statusError,
                        ),
                        onChanged: (status) =>
                          viewModel.add(OnChangeStatusYangDiinginkan(status!))
                      ),

                      const SizedBox(height: 24,),

                      TextField(
                        onChanged: (text) =>
                          viewModel.add(OnChangeUrlBuktiFile(text)),
                        decoration: MyOutlinedInputDecoration(
                          label: const Text("URL Bukti File"),
                          errorText: state.urlBuktiFileError,
                        ),
                      ),

                      const SizedBox(height: 24,),

                      TextField(
                        onChanged: (text) =>
                          viewModel.add(OnChangeKeterangan(text)),
                        decoration: MyOutlinedInputDecoration(
                          label: const Text("Keterangan (Opsional)"),
                        ),
                        minLines: 3,
                        maxLines: null,
                        textAlignVertical: TextAlignVertical.top,
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    bottom: 48,
                  ),
                  child: SizedBox(
                    height: 65,
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: state.submitResponse is ApiResponseLoading ?
                        null :
                        (){
                          KonfirmasiSubmitDialog(
                            viewModel: viewModel,
                            context: context
                          ).show().then((isSubmit){
                            if (isSubmit == true) {
                              viewModel.add(OnSubmit());
                            }
                          });
                        },
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                      child: state.submitResponse is ApiResponseLoading ?
                        const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Colors.white,
                          )
                        ) :
                        const Text("Submit"),
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
