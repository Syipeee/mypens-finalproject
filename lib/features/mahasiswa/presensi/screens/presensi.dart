import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../controllers/mahasiswa/presensi.dart';
import '../../../../constants/colors.dart';

class Presensi extends StatefulWidget {
  const Presensi({Key? key}) : super(key: key);

  @override
  State<Presensi> createState() => _PresensiState();
}

class _PresensiState extends State<Presensi> {
  //current Pusat Bahasa PENS lat and long from maps.google.com
  // double lat = -7.275871;
  // double long = 112.794335;
  // double lat = -7.274798416098186;
  // double long = 112.79769197343849;
  //-7.274798416098186, 112.79769197343849

  double deg2rad(double deg) {
    return (deg * pi / 180.0);
  }

  double rad2deg(double rad) {
    return (rad * 180.0 / pi);
  }

  String distance(
      double lat1, double lon1, double lat2, double lon2, String unit) {
    double theta = lon1 - lon2;
    double dist = sin(deg2rad(lat1)) * sin(deg2rad(lat2)) +
        cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * cos(deg2rad(theta));
    dist = acos(dist);
    dist = rad2deg(dist);
    dist = dist * 60 * 1.1515;
    if (unit == 'K') {
      dist = dist * 1.609344;
    } else if (unit == 'N') {
      dist = dist * 0.8684;
    }
    return dist.toStringAsFixed(2);
  }

  List<String> decodeResult(String result, LatLng deviceLocation) {
    List<String> lines = [];
    try {
      lines = result.split('\n');
    } catch (error) {
      rethrow;
    }

    if (lines.length >= 4) {
      List<double> dLines = [];

      try {
        dLines.add(0);
        dLines.add(double.parse(lines[1]));
        dLines.add(double.parse(lines[2]));
        dLines.add(double.parse(lines[3]));
        dLines.add(double.parse(lines[4]));
      } catch (error) {
        rethrow;
      }

      dLines[1] = dLines[1] - (dLines[4] * 5.6);
      dLines[2] = dLines[2] - (dLines[4] * 7.2);

      List<String> qrResult = [];

      double addedCode = (dLines[3] * 1.5);
      int addedCodeInt = addedCode.round();
      String strAddedCode = addedCode.toString();
      String strAddedCodeInt = addedCodeInt.toString();

      if (lines[0].startsWith(strAddedCode)) {
        qrResult.add(lines[0].replaceFirst(strAddedCode, ''));
      } else if (lines[0].startsWith(strAddedCodeInt)) {
        qrResult.add(lines[0].replaceFirst(strAddedCodeInt, ''));
      }

      qrResult.add(dLines[1].toString());
      qrResult.add(dLines[2].toString());

      LatLng targetLocation = LatLng(dLines[2], dLines[1]);

      qrResult.add(distance(targetLocation.latitude, targetLocation.longitude,
          deviceLocation.latitude, deviceLocation.longitude, 'K'));
      return qrResult;
    } else if (lines.length == 1) {
      return lines;
    } else {
      return ['0'];
    }
  }

  @override
  Widget build(BuildContext context) {
    PresensiController presensi = Provider.of<PresensiController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: bluePens,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          title: const Text('Presensi Mahasiswa')),
      body: MobileScanner(
          allowDuplicates: false,
          controller: MobileScannerController(
              facing: CameraFacing.back, torchEnabled: false),
          onDetect: (barcode, args) async {
            HapticFeedback.heavyImpact();
            if (barcode.rawValue == null) {
              debugPrint('Failed to scan Barcode');
            } else {
              final String code = barcode.rawValue!;

              // decode
              var decodedData = decodeResult(
                  code, LatLng(presensi.latitude, presensi.longtitude));
              // List<double> decodedData = [
              //   9783548415,
              //   112.79385800000006,
              //   -7.276580000000081,
              //   0.47
              // ];

              // presensi
              String result = await presensi.doPresensi(
                  presensi.userNrp,
                  int.parse(decodedData[0]),
                  double.parse(decodedData[1]),
                  double.parse(decodedData[2]),
                  double.parse(decodedData[3]));
              // var result = '{"statusMsg":"success", "statusCode":"000"}';

              // response
              if (result == 'fail') {
                //any error
                presensi.setErrorCode('666');
                presensi.setErrorMessage('Failed');
                Navigator.pop(context);
              } else {
                final data = jsonDecode(result);
                switch (data['statusCode']) {
                  case '000':
                    //success
                    presensi.setErrorCode(data['statusCode']);
                    presensi.setErrorMessage(data['statusMsg']);
                    Navigator.pop(context);
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => Home()));
                    break;
                  default:
                    //any error
                    presensi.setErrorCode(data['statusCode']);
                    presensi.setErrorMessage(data['statusMsg']);
                    Navigator.pop(context);
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => Home()));
                }
              }
            }
          }),
    ));
  }
}
