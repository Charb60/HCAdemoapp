import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minipro/src/page/Login/auth.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Get.to(() => AuthPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
      ]),
    );
  }
}
