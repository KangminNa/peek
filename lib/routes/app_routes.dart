import 'package:get/get.dart';
import 'package:peek/views/home_view.dart';
import 'package:peek/views/login_screen.dart';
import 'package:peek/views/profile_view.dart';
import 'package:peek/views/settings_view.dart';
import 'package:peek/views/signup_screen.dart';
import 'package:peek/views/splash_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/signup', page: () => SignupScreen()),
    GetPage(name: '/home', page: () => const HomeView()),
    GetPage(name: '/profile', page: () => const ProfileView()),
    GetPage(name: '/setting', page: () => const SettingView()),
  ];
}
