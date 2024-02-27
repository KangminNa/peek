import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peek/viewmodels/login_viewmodel.dart';
import 'package:peek/views/signup_screen.dart';
import 'package:peek/views/splash_screen.dart';
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
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => const SplashScreen()); // 뒤로가기를 누르면 로그인 화면으로 이동
        return false; // WillPopScope에 false 반환하여 뒤로가기 동작을 차단
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                Expanded(
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
                        height: 50,
                      ),
                      Obx(
                        () => CustomTextField(
                          controller: _emailController,
                          labelText: "Email",
                          onChanged: (value) {
                            _loginViewModel.validateEmail(value);
                          },
                          errorMessageText:
                              _loginViewModel.emailError.value.isNotEmpty
                                  ? _loginViewModel.emailError.value
                                  : null,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => CustomTextField(
                          controller: _passwordController,
                          labelText: "Password",
                          onChanged: (value) {
                            _loginViewModel.validatePassword(value);
                          },
                          errorMessageText:
                              _loginViewModel.passwordError.value.isNotEmpty
                                  ? _loginViewModel.passwordError.value
                                  : null,
                          obscureText: true,
                        ),
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
                const SizedBox(
                  height: 80,
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
      ),
    );
  }
}
