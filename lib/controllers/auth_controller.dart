import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:peek/models/login_model.dart';
import 'package:peek/models/signup_model.dart';
import 'package:peek/models/user_model.dart';
import 'package:peek/views/login_screen.dart';

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

    if (response.statusCode >= 200 && response.statusCode < 300) {
      // 회원가입이 성공하면 로그인 화면으로 이동
      Get.off(LoginScreen());
      // 회원가입 완료 알림 표시
      Get.dialog(
        AlertDialog(
          title: const Text('회원가입 완료'),
          content: const Text('회원가입이 완료되었습니다. 로그인을 해주세요!'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // 알림 창 닫기
              },
              child: const Text('확인'),
            ),
          ],
        ),
      );
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
