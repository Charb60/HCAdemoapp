import 'package:dio/dio.dart' as dio; // Use 'dio' as an alias
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro/src/Controller/passwordController.dart';
import 'package:minipro/src/page/Home/homePage.dart';
import 'package:minipro/src/page/Login/auth.dart';
import 'package:minipro/src/page/SignUp/signUpWithGoogle.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final idController = TextEditingController();

  final passwordController = TextEditingController();
  final _dio = dio.Dio();
  // Future<void> _makeApiCall(
  //     String idController, String passwordController) async {
  //   final _dio = Dio();

  //   try {
  //     final formDataArgs = FormData.fromMap({
  //       "idSignUp": idController,
  //       "password": passwordController,
  //     });

  //     final response = await _dio.post(
  //       "http://192.168.84.58:8080/api/v1/signup",
  //       data: formDataArgs,
  //     );

  //     // Handle the API response as needed
  //     print("API call successful. Response: ${response.data}");
  //   } catch (e) {
  //     // Handle errors
  //     print("API call failed. Error: $e");
  //   }
  // }

  Future<void> signUserUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: idController.text,
        password: passwordController.text,
      );

      // Registration successful
      Get.dialog(
        AlertDialog(
          title: Text(
            'Registration Successful',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          content: Text(
            'You have successfully registered.',
            style: GoogleFonts.nunito(
              fontSize: 15,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'OK',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';

      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The Email is invalid';
      }

      // Registration failed
      Get.dialog(
        AlertDialog(
          title: Text(
            'Registration Failed',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          content: Text(
            errorMessage,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'OK',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'สมัครสมาชิก',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF9bb8cd),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 85, bottom: 0),
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
        controller: idController,
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
          String idValue = idController.text;
          String passwordValue = passwordController.text;
          // await signUserUp();
          final dio.FormData formDataArgs = dio.FormData.fromMap({
            "idSignUp": idValue,
            "password": passwordValue,
          });

          final args = {
            "idSignUp": idValue,
            "password": passwordValue,
          };

          final response = await _dio
              .post("http://192.168.84.58:8080/api/v1/signup", data: args);

          print(response.data);
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
        onPressed: () {
          // signInWithGoogle();
        },
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


