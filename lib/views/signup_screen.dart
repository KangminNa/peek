import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peek/viewmodels/signup_viewmodel.dart';
import 'package:peek/views/login_screen.dart';

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
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => TextField(
                  controller: _emailController,
                  onChanged: (value) {
                    _signupViewModel.validateEmail(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: _signupViewModel.emailError.value.isNotEmpty
                        ? _signupViewModel.emailError.value
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => TextField(
                  controller: _passwordController,
                  onChanged: (value) {
                    _signupViewModel.validatePassword(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: _signupViewModel.passwordError.value.isNotEmpty
                        ? _signupViewModel.passwordError.value
                        : null,
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _modelNumberController,
                decoration: const InputDecoration(
                  labelText: 'Model Number',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _signupViewModel.signup(
                    _emailController.text,
                    _nameController.text,
                    _passwordController.text,
                    _modelNumberController.text,
                  );
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
