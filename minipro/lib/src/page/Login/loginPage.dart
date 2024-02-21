import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// // import 'package:minipro/route.dart';
// import 'package:minipro/src/Controller/passwordController.dart';
import 'package:minipro/src/page/Home/homePage.dart';
// import 'package:minipro/src/page/Login/auth.dart';
// import 'package:minipro/src/page/SignUp/signUpWithgoogle.dart';
import 'package:minipro/src/page/SignUp/signup.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn(BuildContext context) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Get.dialog(
      //   AlertDialog(
      //     title: Text(
      //       'Login Successful',
      //       style: GoogleFonts.nunito(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 15,
      //       ),
      //     ),
      //     content: Text(
      //       'You have successfully Login.',
      //       style: GoogleFonts.nunito(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 12,
      //       ),
      //     ),
      //   ),
      // );
      await Future.delayed(const Duration(seconds: 2));

      Get.back();

      Get.off(() => HomePage());
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';

      if (e.code == 'invalid-email') {
        errorMessage = 'No user found for that email.';
        // print('No user found for that email.');
      } else if (e.code == 'invalid-credential') {
        errorMessage = 'Wrong Email or Password';
        // print('Wrong password provided for that user.');
      } else if (e.code == 'channel-error') {
        errorMessage = 'No input Email or Password';
        // print('No input Email Password');
      }

      Get.back();

      // Show an error dialog
      // ignore: use_build_context_synchronously
      Get.dialog(
        AlertDialog(
          title: Text(
            'Login Failed',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          content: Text(
            errorMessage,
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
                child: Container(
                  width: 330,
                  height: 180,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
              // padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: 330,
                // height: 50,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      child: _loginButton(context),
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
                    const SizedBox(height: 200),
                    Center(
                      child: _signUp(),
                    ),
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
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _loginButton(context) {
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
        onPressed: () {
          signUserIn(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEEC759),
          // minimumSize: const Size(250, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text('Login',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: const Color(0xFF000000),
            )),
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

  Widget _signUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',
          style: GoogleFonts.nunito(
            fontSize: 18,
          ),
        ),
        TextButton(
          onPressed: () {
            Get.dialog(Container(
              color: const Color(0xFF9bb8cd),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ));
            Future.delayed(const Duration(seconds: 1), () {
              Get.back();

              Get.to(() => SignUpPage());
            });
          },
          child: Text(
            'Sign Up',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: const Color(0xFFFF7A00),
            ),
          ),
        ),
      ],
    );
  }
} //end
