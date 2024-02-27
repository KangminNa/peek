import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:peek/controllers/bottom_navigation_bar_controller.dart';
import 'package:peek/views/home_view.dart';
import 'package:peek/views/profile_view.dart';
import 'package:peek/views/settings_view.dart';
import 'package:peek/widgets/custom_bottom_navigation_bar.dart';

class TapPage extends StatelessWidget {
  // 탭별 화면
  static List<Widget> tabPages = <Widget>[
    const HomeView(), // 외부 클래스로 정의
    const ProfileView(),
    const SettingView(),
  ];

  const TapPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 페이지 전환을 위한 MyBottomNavgationBarController 인스턴스화 (의존성 주입)
    // Get.put : 수명이 페이지와 같음
    Get.put(MyBottomNavgationBarController());

    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      // 빈 AppBar 따로 정의
      // MyBottomNavgationBarController의 변수가 변하면 화면(페이지) 변경
      body: Obx(() => SafeArea(
          child:
              // static 변수를 이용해 컨트롤러 접근
              tabPages[MyBottomNavgationBarController.to.selectedIndex.value])),
      // 2번에서 만든 BottomNavgationBar 컴포넌트
      bottomNavigationBar: const MyBottomNavgationBar(),
    );
  }
}
