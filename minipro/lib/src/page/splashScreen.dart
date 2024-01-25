import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minipro/src/page/Home/homePage.dart';
import 'package:minipro/src/page/Login/auth.dart';
import 'package:minipro/src/page/Login/loginPage.dart'; // import หน้าที่ต้องการแสดงหลังจาก Splash screen

class SplashScreen extends StatelessWidget {
  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (FirebaseAuth.instance.currentUser != null) {
              return HomePage();
            } else {
              return AuthPage();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
