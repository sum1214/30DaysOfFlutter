import 'package:flutter/material.dart';
import 'package:flutter_learing_codepur/pages/home_page.dart';
import 'package:flutter_learing_codepur/pages/login_page.dart';
import 'package:flutter_learing_codepur/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage()
      },
    );
  }
}
