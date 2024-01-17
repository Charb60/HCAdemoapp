import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro/route.dart';
import 'package:minipro/src/page/Login/loginPage.dart';
import 'package:minipro/src/page/SignUp/signUp.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: const Color(0xFF9bb8cd),
        useMaterial3: true,
      ),
      initialRoute: AppRoute.getSplashRoute(),
      getPages: AppRoute.routes,
      // home: SignUpPage(),
    );
  }
}
