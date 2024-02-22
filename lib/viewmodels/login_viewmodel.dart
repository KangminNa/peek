import 'package:get/get.dart';
import 'package:peek/controllers/auth_controller.dart';
import 'package:peek/models/login_model.dart';


class LoginViewModel extends GetxController {
  final AuthController _authController = Get.find();

  void login(String email, String password) {
    var loginData = LoginModel(email: email, password: password);
    _authController.login(loginData);
  }
}
