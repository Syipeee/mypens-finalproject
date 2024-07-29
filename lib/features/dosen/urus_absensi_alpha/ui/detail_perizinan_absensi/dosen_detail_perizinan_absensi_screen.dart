import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/detail_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/detail_perizinan_absensi/component/reject_or_accept_perizinan_warning_dialog.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/detail_perizinan_absensi/dosen_detail_perizinan_absensi_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DosenDetailPerizinanScreen extends StatelessWidget {
  final DetailPerizinanAbsensiForDosen data;

  const DosenDetailPerizinanScreen({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<DosenDetailAbsensiAlphaViewModel>();
    final state = viewModel.state;

    final response = state.tolakOrTerimaPerizinanResponse;
    // TODO: Tambahin nampilin toast kalo semisal koneksi gagal
    if (response is ApiResponseSucceed<TertolakOrDiterima>){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Fluttertoast.showToast(
          msg: "Berhasil ${response.data == TertolakOrDiterima.ditolak ?
            "menolak" : "menerima"
          } perizinan absensi",
        );
        Navigator.of(context).pop(true);
      });
    }

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 24,
              top: 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment : CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: buildDataEntry(
                            'Dibuat Pada', data.dibuatPada
                        )
                    ),
                    Expanded(
                        child: buildDataEntry(
                            'Status', data.statusPenerimaan.name
                        )
                    ),
                  ],
                ),

                const SizedBox(height: 24,),

                buildDataEntry('Dibuat Oleh', data.dibuatOleh),

                const SizedBox(height: 24,),

                buildDataEntry('Mata Kuliah', data.namaMatkul),

                const SizedBox(height: 24,),

                buildDataEntry('Tanggal Perkuliahan', data.tanggalPerkuliahan),

                const SizedBox(height: 24,),

                buildDataEntry('Minggu ke', data.mingguKeMatkul.toString()),

                const SizedBox(height: 24,),

                buildDataEntry(
                    'Status Presensi yang Diinginkan',
                    data.statusYangDiinginkan
                ),

                const SizedBox(height: 24,),

                buildDataEntry(
                  'Keterangan',
                  data.keterangan ?? "-",
                ),

                const SizedBox(height: 24,),

                FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    minimumSize: const Size(0, 0),
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    try {
                      await launchUrl(
                          Uri.parse(data.urlBuktiFile)
                      );
                    } catch (e) {
                      Fluttertoast.showToast(
                        msg: '"${data.urlBuktiFile}" bukan URL yang valid'
                      );
                    }
                  },
                  child: const Text('Lihat Bukti File'),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(
            bottom: 48,
            right: 24,
            left: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.tolakOrTerimaPerizinanResponse is ApiResponseLoading)
                const SizedBox(
                  height: 52,
                  width: 52,
                  child: CircularProgressIndicator(),
                )
              else ...[
                Expanded(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFFF0000),
                      minimumSize: const Size(0, 52),
                    ),
                    onPressed: (){
                      RejectOrAcceptPerizinanWarningDialog(
                          context: context,
                          statusPenerimaan: StatusPenerimaanPerizinan.ditolak
                      ).show().then((isConfirmed){
                        if (isConfirmed == true){
                          viewModel.add(OnTolakPerizinanAbsensi());
                        }
                      });
                    },
                    child: const Text(
                      "Tolak",
                    ),
                  ),
                ),

                const SizedBox(width: 16,),

                Expanded(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF2FA5BE),
                      padding: const EdgeInsets.all(16),
                      minimumSize: const Size(0, 52),
                    ),
                    onPressed: (){
                      RejectOrAcceptPerizinanWarningDialog(
                          context: context,
                          statusPenerimaan: StatusPenerimaanPerizinan.diterima
                      ).show().then((isConfirmed){
                        if (isConfirmed == true){
                          viewModel.add(OnTerimaPerizinanAbsensi());
                        }
                      });
                    },
                    child: const Text(
                      "Terima",
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDataEntry(String label, String value){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value,),
      ],
    );
  }

}
