import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro/src/page/Login/auth.dart';
import 'package:minipro/src/page/Profile/editProfile.dart';
import 'package:minipro/src/user/user.dart';
import 'package:minipro/src/user/userModel.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Get.to(() => const AuthPage());
  }

  @override
  Widget build(BuildContext context) {
    final user = Users().modelUser[0];

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 63),
          child: const Text(
            'บัญชีของคุณ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF9bb8cd),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(user),
            SizedBox(
              height: 60,
            ),
            _buildContent(),
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
                  const SizedBox(height: 10),
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Container(
          width: 320,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 120, 119, 119).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {
              Get.to(() => EditProfile());
            },
            child: Text(
              'บัญชีของคุณ',
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF000000)),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            height: 1,
            width: 320,
            color: Color(0xFF666666),
          ),
        ),
        Container(
          width: 320,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 120, 119, 119).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'รายการทรัพย์สินของคุณ',
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF000000)),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 320,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 120, 119, 119).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'การแจ้งเตือน',
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF000000)),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            height: 1,
            width: 320,
            color: Color(0xFF666666),
          ),
        ),
        Container(
          width: 320,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            // borderRadius: const BorderRadius.only(
            //   bottomLeft: Radius.circular(10),
            //   bottomRight: Radius.circular(10),
            // ),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 120, 119, 119).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'รหัสผ่าน',
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF000000)),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            height: 1,
            width: 320,
            color: Color(0xFF666666),
          ),
        ),
        Container(
          width: 320,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 120, 119, 119).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {
              signUserOut();
            },
            child: Text(
              'ออกจากระบบ',
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF000000)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
