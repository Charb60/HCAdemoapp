import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChagePassPage extends StatefulWidget {
  const ChagePassPage({Key? key}) : super(key: key);

  @override
  _PassPageState createState() => _PassPageState();
}

class _PassPageState extends State<ChagePassPage> {
  late TextEditingController _confermNewPasswordController;
  late TextEditingController _newPasswordController;

  @override
  void initState() {
    super.initState();
    _confermNewPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(right: 45),
          child: const Center(
            child: Text(
              'เปลี่ยนรหัสผ่าน',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xFF9bb8cd),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 74,
              width: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 120, 119, 119)
                        .withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 10,
                    // offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: TextField(
                controller: _newPasswordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'รหัสผ่านใหม่',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 74,
              width: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 120, 119, 119)
                        .withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 10,
                    // offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: TextField(
                controller: _confermNewPasswordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'ยืนยันรหัสผ่านใหม่',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _uploadbutton(),
        ],
      ),
    );
  }

  Widget _uploadbutton() {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFB1C381),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 120, 119, 119).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () async {
          Get.defaultDialog(
            title: 'ยืนยันการบันทึก',
            middleText: 'คุณต้องการเปลี่ยนรหัสผ่านหรือไม่?',
            actions: [
              TextButton(
                onPressed: () {
                  Get.back(); // ปิด AlertDialog
                },
                child: Text('ยกเลิก'),
              ),
              TextButton(
                onPressed: () {
                  // ตรวจสอบและบันทึกข้อมูลที่นี่
                  Get.back(); // ปิด AlertDialog
                },
                child: Text('ยืนยัน'),
              ),
            ],
          );
        },
        child: Text(
          'บันทึก',
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xFF000000)),
          ),
        ),
      ),
    );
  }
}
