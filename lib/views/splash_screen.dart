import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peek/views/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 스플래시 화면이 2초간 보이고, 그 후에 로그인 화면으로 이동
    Timer(const Duration(seconds: 2), () {
      Get.off(LoginScreen());
    });

    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
