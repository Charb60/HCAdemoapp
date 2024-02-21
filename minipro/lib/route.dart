import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:minipro/src/AddProduct/addProduct.dart';
import 'package:minipro/src/page/Home/homePage.dart';
import 'package:minipro/src/page/Login/auth.dart';
import 'package:minipro/src/page/Login/loginPage.dart';
import 'package:minipro/src/page/Map/map.dart';
import 'package:minipro/src/page/Noti/notification.dart';
import 'package:minipro/src/page/Password/chagePassPage.dart';
import 'package:minipro/src/page/Profile/allYourProduct.dart';
import 'package:minipro/src/page/Profile/editProfile.dart';
import 'package:minipro/src/page/SignUp/signUp.dart';
import 'package:minipro/src/page/Profile/profilePage.dart';
import 'package:minipro/src/page/splashScreen.dart';
import 'package:minipro/src/product/allProduct.dart';

class AppRoute {
  static String home = "/home";
  static String login = "/login";
  static String signUp = "/signUp";
  static String splashScreen = "/splashScreen";
  static String auth = "/auth";
  static String profile = "/profile";
  static String addProduct = "/addProduct";
  static String map = "/map";
  static String editProfile = "/editProfile";
  static String allYourProduct = "/allYourProduct";
  static String notification = "/notification";
  static String chagePassPage = "/chagePassPage";
  static String allProduct = "/allProduct";

  static String getHomeRoute() => home;
  static String getLoginRoute() => login;
  static String getSignUpRoute() => signUp;
  static String getSplashRoute() => splashScreen;
  static String getAuthRoute() => auth;
  static String getProfileRoute() => profile;
  static String getAddproductRoute() => addProduct;
  static String getMapRoute() => map;
  static String getEditProfile() => editProfile;
  static String getAllYourProduct() => allYourProduct;
  static String getNotification() => notification;
  static String getChagePassPage() => chagePassPage;
  static String getAllProduct() => allProduct;

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
    GetPage(
      name: addProduct,
      page: (() => AddProduct(
            name: "",
            price: "",
            latitude: "",
            longitude: "",
            area: "",
          )),
    ),
    GetPage(
      name: map,
      page: () => MapScreen(
        name: "",
        price: "",
        onLocationSelected: (LatLng location) {},
      ),
    ),
    GetPage(
      name: map,
      page: () => EditProfile(),
    ),
    GetPage(
      name: allYourProduct,
      page: () => AllYourProduct(),
    ),
    GetPage(
      name: notification,
      page: () => NotificationPage(),
    ),
    GetPage(
      name: chagePassPage,
      page: () => ChagePassPage(),
    ),
    GetPage(
      name: allProduct,
      page: () => AllProduct(),
    ),
  ];
}
