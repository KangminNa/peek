import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:peek/viewmodels/signup_viewmodel.dart';
import 'package:peek/views/login_screen.dart';
import 'package:peek/widgets/custom_buttom.dart';
import 'package:peek/widgets/login_sign_textfield.dart';

class SignupScreen extends StatelessWidget {
  final SignupViewModel _signupViewModel = Get.put(SignupViewModel());

  SignupScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _modelNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => LoginScreen()); // 뒤로가기를 누르면 로그인 화면으로 이동
        return false; // WillPopScope에 false 반환하여 뒤로가기 동작을 차단
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset('images/logo_test.png'),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => CustomTextField(
                        controller: _emailController,
                        labelText: "Email",
                        onChanged: (value) {
                          _signupViewModel.validateEmail(value);
                        },
                        errorMessageText:
                            _signupViewModel.emailError.value.isNotEmpty
                                ? _signupViewModel.emailError.value
                                : null,
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                        controller: _nameController, labelText: "name"),
                    const SizedBox(height: 5),
                    Obx(
                      () => CustomTextField(
                        controller: _passwordController,
                        labelText: "Password",
                        onChanged: (value) {
                          _signupViewModel.validatePassword(value);
                        },
                        errorMessageText:
                            _signupViewModel.passwordError.value.isNotEmpty
                                ? _signupViewModel.passwordError.value
                                : null,
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                        controller: _modelNumberController,
                        labelText: "Model Number"),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: "Sign Up",
                      onPressed: () {
                        _signupViewModel.signup(
                          _emailController.text,
                          _nameController.text,
                          _passwordController.text,
                          _modelNumberController.text,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
