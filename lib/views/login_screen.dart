import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peek/viewmodels/login_viewmodel.dart';
import 'package:peek/views/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final LoginViewModel _loginViewModel = Get.put(LoginViewModel());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // 로그인 버튼 클릭 시 처리
                      _loginViewModel.login(
                        _emailController.text,
                        _passwordController.text,
                      );
                    },
                    child: const Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // 회원가입 버튼 클릭 시 처리
                      Get.off(() => SignupScreen());
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
