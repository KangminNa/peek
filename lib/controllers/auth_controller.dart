import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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

  void signup(SignupModel signupData) async {
    final url =
        Uri.parse('http://localhost:8088/api/auth/signup'); // 서버의 주소로 변경해야 합니다.
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'email': signupData.email,
      'name': signupData.name,
      'password': signupData.password,
      'numbering': signupData.numbering,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Signup successful');
      // 여기에서 필요한 로직을 수행합니다. 예를 들어, 회원가입이 성공한 후의 작업을 수행할 수 있습니다.
    } else {
      print('Failed to sign up: ${response.statusCode}');
      // 실패한 경우에 대한 처리를 수행할 수 있습니다.
    }
  }

  void logout() {
    // 로그아웃 로직을 구현합니다.
    // user 정보를 초기화합니다.
  }
}
