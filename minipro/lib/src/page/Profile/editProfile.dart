import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro/src/user/user.dart';
import 'package:minipro/src/user/userModel.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  @override
  Widget build(BuildContext context) {
    final user = Users().modelUser[0];
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 45),
          child: Text('แก้ไขบัญชีของคุณ',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: const Color(0xFFFFFFFF),
              )),
        ),
        backgroundColor: const Color(0xFF9bb8cd),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(user),
            const SizedBox(
              height: 60,
            ),
            _uploadbutton(),
            // _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ModelUser user) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Center(
              child: Container(
                width: 365,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 245, top: 15),
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 231, top: 1),
            child: IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 317, top: 85),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'แก้ไข',
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF0094FF)),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage(
                      user.userImage,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: Container(
                      height: 1,
                      width: 300,
                      color: const Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 150),
                    child: Text(
                      "0" + user.phoneNumber.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.email,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 182),
                    child: Text(
                      user.line,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  // const SizedBox(height: 2),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // _buildContent() {}

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
        onPressed: () async {},
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
