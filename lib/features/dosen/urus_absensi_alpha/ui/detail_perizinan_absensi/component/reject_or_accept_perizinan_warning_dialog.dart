import 'package:flutter/material.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RejectOrAcceptPerizinanWarningDialog extends Alert {
  RejectOrAcceptPerizinanWarningDialog({
    required super.context,
    required StatusPenerimaanPerizinan statusPenerimaan,
  }) : super(
    type: AlertType.warning,
    content: Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text.rich(
        TextSpan(
          text: 'Apakah anda yakin ingin ',
          style: const TextStyle(
            fontSize: 18
          ),
          children: [
            TextSpan(
              text: statusPenerimaan == StatusPenerimaanPerizinan.diterima ?
                'menerima' : 'menolak',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: statusPenerimaan == StatusPenerimaanPerizinan.diterima ?
                  Colors.blue : Colors.red,
              ),
            ),

            const TextSpan(
              text: ' pengajuan ini?',
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    ),
    buttons: [
      DialogButton(
        color: Colors.white,
        border: Border.all(width: 0.4),
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: const Text(
          'Tidak',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      DialogButton(
        color: statusPenerimaan == StatusPenerimaanPerizinan.diterima ?
          Colors.blue : Colors.red,
        onPressed: (){
          // pop true menandakan bahwa user mengkonfirmasi
          Navigator.of(context).pop(true);
        },
        child: const Text(
          'Ya',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        )
      ),
    ]
  );
}