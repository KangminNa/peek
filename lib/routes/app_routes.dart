import 'package:get/get.dart';
import 'package:peek/views/login_screen.dart';
import 'package:peek/views/signup_screen.dart';
import 'package:peek/views/splash_screen.dart';


class AppRoutes {
  static final routes = [
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/signup', page: () => SignupScreen()),
  ];
}
