import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peek/controllers/auth_controller.dart';
import 'package:peek/routes/app_routes.dart';
import 'package:peek/views/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Example',
      initialRoute: '/splash',
      getPages: AppRoutes.routes,
      home: const SplashScreen(),
    );
  }
}
