import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class RevisiBaseView extends StatelessWidget {
  String dosen, revisi, status;
  RevisiBaseView(this.dosen, this.revisi, this.status);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Dosen',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SelectableText("""${dosen}"""),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Revisi',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SelectableText("""${revisi}"""),
                    SizedBox(
                      height: 10,
                    ),
                    SelectableText(
                      'Status Revisi',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("""${status}"""),
                  ],
                )),
          ])),
    );
  }
}
