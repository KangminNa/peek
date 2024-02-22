import 'package:get/get.dart';
import 'package:peek/controllers/auth_controller.dart';
import 'package:peek/models/signup_model.dart';


class SignupViewModel extends GetxController {
  final AuthController _authController = Get.find();

  void signup(String email, String name, String password, String numbering) {
    var signupData = SignupModel(email: email, name: name, password: password, numbering: numbering);

    _authController.signup(signupData);
  }
}
