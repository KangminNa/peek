import 'package:get/get.dart';
import 'package:peek/controllers/auth_controller.dart';
import 'package:peek/models/login_model.dart';
import 'package:peek/views/tap_page_screen.dart';

class LoginViewModel extends GetxController {
  final AuthController _authController = Get.find();
  var emailError = RxString(''); // 이메일 오류 메시지를 Observable로 관리합니다.
  var passwordError = RxString(''); // 비밀번호 오류 메시지를 Observable로 관리합니다.

  void login(String email, String password) {
    // 이메일 및 비밀번호 형식 검증
    validateEmail(email);
    validatePassword(password);

    // 오류가 없으면 로그인 요청 및 페이지 이동
    if (emailError.isEmpty && passwordError.isEmpty) {
      var loginData = LoginModel(email: email, password: password);
      _authController.login(loginData);
      Get.off(const TapPage());
    }
  }

  // 이메일 데이터 검증 함수
  void validateEmail(String email) {
    if (!isValidEmail(email)) {
      emailError.value = '이메일을 확인해주세요.';
    } else {
      emailError.value = ''; // 유효한 경우 오류 메시지를 초기화합니다.
    }
  }

  // 비밀번호 데이터 검증 함수
  void validatePassword(String password) {
    if (password.isEmpty) {
      passwordError.value = '비밀번호를 입력하세요.';
    } else {
      passwordError.value = ''; // 유효한 경우 오류 메시지를 초기화합니다.
    }
  }

  // 이메일 형식 검증 함수
  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
