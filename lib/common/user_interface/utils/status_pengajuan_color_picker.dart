import 'package:flutter/material.dart';
import 'package:mypens/common/domain/perizinan_absensi/model/status_penerimaan_perizinan.dart';

class StatusPerizinanAbsensiColorPicker {
  Color getBackgroundColorBy(StatusPenerimaanPerizinan status){
    switch(status){
      case StatusPenerimaanPerizinan.diterima:
        return const Color(0xFFE0FFE2);
      case StatusPenerimaanPerizinan.menunggu:
        return const Color(0xFFFFF9BE);
      case StatusPenerimaanPerizinan.ditolak:
        return const Color(0xFFFFDBDB);
    }
  }

  Color getCardColorBy(StatusPenerimaanPerizinan status){
    switch(status){
      case StatusPenerimaanPerizinan.diterima:
        return const Color(0xFF88FF7D);
      case StatusPenerimaanPerizinan.menunggu:
        return const Color(0xFFF6EE1E);
      case StatusPenerimaanPerizinan.ditolak:
        return const Color(0xFFFF9D9D);
    }
  }

  Color getCardTextColorBy(StatusPenerimaanPerizinan status){
    switch(status){
      case StatusPenerimaanPerizinan.diterima:
        return const Color(0xFF027600);
      case StatusPenerimaanPerizinan.menunggu:
        return const Color(0xFF625E00);
      case StatusPenerimaanPerizinan.ditolak:
        return const Color(0xFF750000);
    }
  }
}