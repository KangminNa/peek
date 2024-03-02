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
    final url = Uri.parse('http://localhost:8088/api/auth/signup');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'email': signupData.email,
      'name': signupData.name,
      'password': signupData.password,
      'numbering': signupData.numbering,
    });

    try {
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
        Get.dialog(
          AlertDialog(
            title: const Text('회원가입 오류'),
            content: const Text(
                '중복된 이메일 혹은 옳지 않은 \nmodel 번호입니다. 반복될 시 하단 \n고객센터로 연락부탁드립니다.'),
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
        print('Failed to sign up: ${response.statusCode}');
        // 실패한 경우에 대한 처리를 수행할 수 있습니다.
      }
    } catch (e) {
      // 서버 연결 실패 처리
      Get.dialog(
        AlertDialog(
          title: const Text('서버 연결 오류'),
          content: const Text('서버에 연결할 수 없습니다. \n잠시 후 다시 시도해주세요.'),
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
      print('Failed to connect to the server: $e');
    }
  }

  void logout() {
    // 로그아웃 로직을 구현합니다.
    // user 정보를 초기화합니다.
  }
}
