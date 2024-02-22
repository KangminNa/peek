import 'package:get/get.dart';
import 'package:peek/controllers/auth_controller.dart';
import 'package:peek/models/signup_model.dart';

class SignupViewModel extends GetxController {
  final AuthController _authController = Get.find();
  var emailError = RxString(''); // 이메일 오류 메시지를 Observable로 관리합니다.
  var passwordError = RxString(''); // 비밀번호 오류 메시지를 Observable로 관리합니다.

  void signup(String email, String name, String password, String numbering) {
    // 이메일 형식 검증
    validateEmail(email);

    // 비밀번호 형식 검증
    validatePassword(password);

    // 오류가 없으면 회원가입 요청
    if (emailError.isEmpty && passwordError.isEmpty) {
      var signupData = SignupModel(
        email: email,
        name: name,
        password: password,
        numbering: numbering,
      );
      _authController.signup(signupData);
    }
  }

  // 이메일 데이터 검증 함수
  void validateEmail(String email) {
    if (!isValidEmail(email)) {
      emailError.value = '올바른 이메일 형식이 아닙니다.';
    } else {
      emailError.value = ''; // 유효한 경우 오류 메시지를 초기화합니다.
    }
  }

// 비밀번호 데이터 검증 함수
  void validatePassword(String password) {
    if (!isValidPassword(password)) {
      passwordError.value = '비밀번호는 8-20자 사이의 특수문자와 숫자를 포함해야 합니다.';
    } else {
      passwordError.value = ''; // 유효한 경우 오류 메시지를 초기화합니다.
    }
  }

  // 이메일 형식 검증 함수
  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // 비밀번호 형식 검증 함수
  bool isValidPassword(String password) {
    return RegExp(
            r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+}{":;\,.<>?/]).{8,20}$')
        .hasMatch(password);
  }
}
