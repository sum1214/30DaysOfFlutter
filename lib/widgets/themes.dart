import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart' show Vx;

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
    primarySwatch: Colors.deepPurple,
    primaryTextTheme: GoogleFonts.latoTextTheme(),
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: lightBluishColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );

  static ThemeData darkTheme() => ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkBluishColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo700;
}
