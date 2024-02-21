import 'package:get/get.dart';
import 'package:minipro/src/user/userModel.dart';

class UserController extends GetxController {
  var user = ModelUser(
    userImage: '',
    name: '',
    email: '',
    line: '',
    phoneNumber: '',
  ).obs;

  void updateUserImage(String newUserImage) {
    user.update((val) {
      val!.userImage = newUserImage;
    });
  }

  void updateUserName(String newName) {
    user.update((val) {
      val!.name = newName;
    });
  }

  void updateUserPhoneNumber(String newPhoneNumber) {
    user.update((val) {
      val!.phoneNumber = newPhoneNumber;
    });
  }
}
