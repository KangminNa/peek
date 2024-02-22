import 'package:get/get.dart';
import 'package:peek/models/login_model.dart';
import 'package:peek/models/signup_model.dart';
import 'package:peek/models/user_model.dart';


class AuthController extends GetxController {
  var user = User(token: '').obs; // 사용자 정보를 관리합니다.

  void login(LoginModel loginData) {
    // 로그인 로직을 구현합니다.
    // 성공 시 user 정보 업데이트
    // loginData.email, loginData.password를 사용하여 로그인 처리
  }

  void signup(SignupModel signupData) {
    // 회원가입 로직을 구현합니다.
    // 성공 시 user 정보 업데이트
    // signupData.email, signupData.name, signupData.password, signupData.numbering를 사용하여 회원가입 처리
  }

  void logout() {
    // 로그아웃 로직을 구현합니다.
    // user 정보를 초기화합니다.
  }
}
