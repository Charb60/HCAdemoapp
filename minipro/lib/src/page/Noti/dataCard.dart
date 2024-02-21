import 'package:flutter/material.dart';
import 'package:minipro/src/page/Noti/data.dart';
import 'package:minipro/src/page/Noti/dataModel.dart';

class DataCard extends StatelessWidget {
  DataCard({super.key, required this.modelData});
  final ModelData modelData;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Container(
              width: 350,
              height: 70,
              child: Text(
                  "${modelData.user}\n${modelData.massage}\n${modelData.time}"),
            ),
          ),
        ),
      ]),
    );
  }
}
