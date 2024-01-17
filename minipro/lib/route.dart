import 'package:get/get.dart';
import 'package:minipro/src/page/Home/homePage.dart';
import 'package:minipro/src/page/Login/auth.dart';
import 'package:minipro/src/page/Login/loginPage.dart';
import 'package:minipro/src/page/SignUp/signUp.dart';
import 'package:minipro/src/page/Profile/profilePage.dart';
import 'package:minipro/src/page/splashScreen.dart';

class AppRoute {
  static String home = "/home";
  static String login = "/login";
  static String signUp = "/signUp";
  static String splashScreen = "/splashScreen";
  static String auth = "/auth";
  static String profile = "/profile";

  static String getHomeRoute() => home;
  static String getLoginRoute() => login;
  static String getSignUpRoute() => signUp;
  static String getSplashRoute() => splashScreen;
  static String getAuthRoute() => auth;
  static String getProfileRoute() => profile;

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: (() => HomePage()),
    ),
    GetPage(
      name: login,
      page: (() => LoginPage()),
    ),
    GetPage(
      name: signUp,
      transition: Transition.fade,
      page: (() => SignUpPage()),
    ),
    GetPage(
      name: splashScreen,
      transition: Transition.fade,
      page: (() => SplashScreen()),
    ),
    GetPage(
      name: auth,
      page: (() => AuthPage()),
    ),
    GetPage(
      name: profile,
      page: (() => Profile()),
    ),
  ];
}
