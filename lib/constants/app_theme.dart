import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 44, 62, 80),
    backgroundColor: const Color.fromARGB(255, 44, 62, 80),
    // 밝기는 어둡게
    brightness: Brightness.light,
    // Color의 색상의 배열값? 색의 농도를 의미하며 100부터 900까지 100단위로 설정 가능
    // 사용자와 상호작용하는 앨리먼트들의 기본 색상
    primaryColor: const Color.fromARGB(255, 44, 62, 80),
    // 사용할 폰트
    fontFamily: 'Poppins',
    // 텍스트 테마 설정
    // https://api.flutter.dev/flutter/material/TextTheme-class.html
    // https://material.io/design/typography/the-type-system.html#applying-the-type-scale
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
          color: Colors.black, fontSize: 57, fontWeight: FontWeight.w400),
      displayMedium: GoogleFonts.poppins(
          color: Colors.black, fontSize: 45, fontWeight: FontWeight.w400),
      displaySmall: GoogleFonts.poppins(
          color: Colors.black, fontSize: 36, fontWeight: FontWeight.w400),
      headlineLarge: GoogleFonts.poppins(
          color: Colors.black, fontSize: 32, fontWeight: FontWeight.w400),
      headlineMedium: GoogleFonts.poppins(
          color: Colors.black, fontSize: 28, fontWeight: FontWeight.w400),
      headlineSmall: GoogleFonts.poppins(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400),
      titleLarge: GoogleFonts.poppins(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.w400),
      titleMedium: GoogleFonts.poppins(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
      titleSmall: GoogleFonts.poppins(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
      bodyLarge: GoogleFonts.poppins(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.poppins(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
      bodySmall: GoogleFonts.poppins(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
      // button
      labelLarge: GoogleFonts.poppins(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
      // caption
      labelMedium: GoogleFonts.poppins(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      // overline
      labelSmall: GoogleFonts.poppins(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: Colors.cyan[600]),
    disabledColor: const Color.fromARGB(255, 190, 190, 190),
    focusColor: const Color.fromARGB(255, 44, 62, 80),
  );

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 44, 62, 80),
      backgroundColor: const Color.fromARGB(255, 44, 62, 80),
      // 밝기는 어둡게
      brightness: Brightness.light,
      // Color의 색상의 배열값? 색의 농도를 의미하며 100부터 900까지 100단위로 설정 가능
      // 사용자와 상호작용하는 앨리먼트들의 기본 색상
      primaryColor: const Color.fromARGB(255, 44, 62, 80),
      // 사용할 폰트
      fontFamily: 'Poppins',
      // 텍스트 테마 설정
      // https://api.flutter.dev/flutter/material/TextTheme-class.html
      // https://material.io/design/typography/the-type-system.html#applying-the-type-scale
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
            color: Colors.white, fontSize: 57, fontWeight: FontWeight.w400),
        displayMedium: GoogleFonts.poppins(
            color: Colors.white, fontSize: 45, fontWeight: FontWeight.w400),
        displaySmall: GoogleFonts.poppins(
            color: Colors.white, fontSize: 36, fontWeight: FontWeight.w400),
        headlineLarge: GoogleFonts.poppins(
            color: Colors.white, fontSize: 32, fontWeight: FontWeight.w400),
        headlineMedium: GoogleFonts.poppins(
            color: Colors.white, fontSize: 28, fontWeight: FontWeight.w400),
        headlineSmall: GoogleFonts.poppins(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
        titleLarge: GoogleFonts.poppins(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
        titleMedium: GoogleFonts.poppins(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        titleSmall: GoogleFonts.poppins(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        bodyLarge: GoogleFonts.poppins(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        bodyMedium: GoogleFonts.poppins(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        bodySmall: GoogleFonts.poppins(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
        // button
        labelLarge: GoogleFonts.poppins(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        // caption
        labelMedium: GoogleFonts.poppins(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        // overline
        labelSmall: GoogleFonts.poppins(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          .copyWith(secondary: Colors.cyan[600]),
      disabledColor: const Color.fromARGB(255, 190, 190, 190),
      focusColor: const Color.fromARGB(255, 44, 62, 80),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: GoogleFonts.poppins(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800),
        unselectedLabelStyle: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 190, 190, 190),
            fontSize: 12,
            fontWeight: FontWeight.w800),
      ));
}
