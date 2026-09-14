import 'package:flutter/material.dart';
import 'package:flutter_learing_codepur/home_page.dart';
import 'package:flutter_learing_codepur/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage()
      },
    );
  }
}
