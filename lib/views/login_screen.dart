import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:peek/viewmodels/login_viewmodel.dart';
import 'package:peek/views/signup_screen.dart';
import 'package:peek/widgets/custom_bottom_text.dart';
import 'package:peek/widgets/custom_buttom.dart';
import 'package:peek/widgets/login_sign_textfield.dart';

class LoginScreen extends StatelessWidget {
  final LoginViewModel _loginViewModel = Get.put(LoginViewModel());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "P E E K",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        labelText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _passwordController,
                        labelText: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: 'Login',
                        onPressed: () {
                          // 로그인 버튼 클릭 시 처리
                          _loginViewModel.login(
                            _emailController.text,
                            _passwordController.text,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // SignUp 페이지로 이동하는 코드 추가
                        Get.off(SignupScreen());
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
