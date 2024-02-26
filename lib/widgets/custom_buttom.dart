import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromRGBO(42, 200, 235, 1), // 텍스트 색상
          padding: const EdgeInsets.symmetric(vertical: 16), // 버튼 내부 패딩
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // 버튼 모서리를 둥글게 만듭니다.
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
