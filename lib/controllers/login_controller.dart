import 'package:get/get.dart';

class LoginController extends GetxController {
  var userID = ''.obs;
  updateUserID(num) {
    userID.value = num;
  }
}
