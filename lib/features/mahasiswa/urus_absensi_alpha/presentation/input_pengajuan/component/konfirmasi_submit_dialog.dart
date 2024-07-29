import 'package:flutter/material.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/input_pengajuan/input_pengajuan_view_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class KonfirmasiSubmitDialog extends Alert {
  final InputPengajuanViewModel viewModel;

  KonfirmasiSubmitDialog({
    required this.viewModel,
    required super.context,
  }) : super(
    type: AlertType.warning,
    desc: "Yakin ingin mensubmit data?",
    buttons: [
      DialogButton(
        color: Colors.red,
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: const Text(
          "Tidak",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )
      ),
      DialogButton(
        color: Colors.blue,
        onPressed: (){
          Navigator.of(context).pop(true);
        },
        child: const Text(
          "Ya",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ]
  );
}