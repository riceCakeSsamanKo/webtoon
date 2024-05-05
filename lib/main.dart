import 'package:flutter/material.dart';
import 'package:webtoon/screens/home_screen.dart';
import 'package:webtoon/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key}); // 위젯에는 ID와 같은 식별자 역할을 하는 key가 존재한다. MyApp 위젯의 key를 StatelessWidget 슈퍼 클래스로 보냄.

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
