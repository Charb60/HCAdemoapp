// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro/src/Controller/passwordController.dart';
import 'package:minipro/src/page/Home/homePage.dart';
import 'package:minipro/src/page/Login/auth.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  Future<void> signUserUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 46, bottom: 9),
              child: Center(
                child: Text(
                  "สมัครสมาชิก",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                // child: Container(
                //   width: 330,
                //   height: 180,
                // ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
              child: Container(
                width: 330,
                // height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'ID',
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    _Id(),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Password',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    _passWord(),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: _signUpButton(context),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Text('Or',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: const Color(0xFF595858))),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: _signInWithGoogleButton(),
                    ),
                    const SizedBox(height: 105),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Id() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 120, 119, 119).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'ID',
        ),
      ),
    );
  }

  Widget _passWord() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 120, 119, 119).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: passwordController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Password',
        ),
      ),
    );
  }

  Widget _signUpButton(BuildContext context) {
    return Container(
      height: 40,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 120, 119, 119).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () async {
          await signUserUp();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('สมัครสมาชิกสำเร็จ',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Get.to(() => AuthPage());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFEEC759),
                  ),
                  child: Text('ตกลง'),
                ),
              ],
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEEC759),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Sign Up',
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color(0xFF000000),
          ),
        ),
      ),
    );
  }

  Widget _signInWithGoogleButton() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 120, 119, 119).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Image.asset(
          'assets/google_logo.png',
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}//end


