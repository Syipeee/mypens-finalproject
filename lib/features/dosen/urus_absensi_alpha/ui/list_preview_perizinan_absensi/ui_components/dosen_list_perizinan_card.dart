
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/preview_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/user_interface/utils/status_pengajuan_color_picker.dart';
import 'package:mypens/common/utils/my_date_formatter.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/list_preview_perizinan_absensi/dosen_list_perizinan_absensi_view_model.dart';

class DosenListPerizinanCard extends StatelessWidget {
  final PreviewPerizinanAbsensiForDosen data;
  final colorPicker = StatusPerizinanAbsensiColorPicker();

  DosenListPerizinanCard({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorPicker.getBackgroundColorBy(data.status),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            blurStyle: BlurStyle.normal,
            color: Color(0x40000000)
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data.namaMatkul,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                myDateFormatter.format(data.tanggalMatkul),
              ),
              drawStatusCard(),
            ],
          ),

          const SizedBox(height: 16,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Oleh : ',
              ),

              const SizedBox(width: 4,),

              Expanded(
                child: Text(
                  data.mahasiswaPengaju,
                )
              ),

              const SizedBox(width: 6,),

              OutlinedButton(
                onPressed: (){
                  Navigator.of(context)
                    .pushNamed(
                      MyPensNavRoutes.dosenDetailPerizinanAbsensi,
                      arguments: data.idPerizinan,
                    ).then((isTerimaOrTolak) {
                    if (isTerimaOrTolak == true){
                      context.read<DosenListPerizinanAbsensiViewModel>()
                        .add(OnReloadListPerizinanAbsensi());
                    }
                  });
                },
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
                ),
                child: const Text(
                  'Lihat Detail',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget drawStatusCard(){
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: colorPicker.getCardColorBy(data.status),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        data.status.name,
        style: TextStyle(
          fontSize: 10,
          color: colorPicker.getCardTextColorBy(data.status)
        ),
      ),
    );
  }


}
