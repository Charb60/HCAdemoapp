import 'package:flutter/material.dart';
import 'package:minipro/src/page/Noti/data.dart';
import 'package:minipro/src/page/Noti/dataCard.dart';
import 'package:minipro/src/page/Noti/dataModel.dart'; // เพิ่มบรรทัดนี้เข้ามา

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    DataType dataType = DataType();
    List<ModelData> modelData = dataType.allNoti;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(right: 45),
          child: const Center(
            child: Text(
              'การแจ้งเตือน',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xFF9bb8cd),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _listNotification(modelData: modelData),
        ]),
      ),
    );
  }

  Widget _listNotification({required List<ModelData> modelData}) {
    return Column(
      children: [
        for (int index = 0; index < modelData.length; index++)
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: DataCard(
              modelData: modelData[index],
            ),
          ),
      ],
    );
  }
}
