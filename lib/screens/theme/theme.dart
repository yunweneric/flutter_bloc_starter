import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waka_app/screens/theme/colors.dart';

class WakaAppTheme {
  // 1
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.lato(fontSize: 14.0.sp, fontWeight: FontWeight.w700, color: kDark),
    displayLarge: GoogleFonts.lato(fontSize: 32.0.sp, fontWeight: FontWeight.bold, color: kDark),
    displayMedium: GoogleFonts.lato(fontSize: 20.0.sp, fontWeight: FontWeight.w500, color: kDark),
    displaySmall: GoogleFonts.lato(fontSize: 14.0.sp, fontWeight: FontWeight.w600, color: kDark),
    titleMedium: GoogleFonts.lato(fontSize: 16.0.sp, fontWeight: FontWeight.w600, color: kDark),
    labelMedium: TextStyle(fontSize: 14.0.sp, color: kGrey, fontWeight: FontWeight.w500),
  );

  // 2
  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.lato(fontSize: 14.0.sp, fontWeight: FontWeight.w700, color: kWhite),
    displayLarge: GoogleFonts.lato(fontSize: 32.0.sp, fontWeight: FontWeight.bold, color: kWhite),
    displayMedium: GoogleFonts.lato(fontSize: 20.0.sp, fontWeight: FontWeight.w500, color: kWhite),
    displaySmall: GoogleFonts.lato(fontSize: 14.0.sp, fontWeight: FontWeight.w600, color: kWhite),
    titleMedium: GoogleFonts.lato(fontSize: 16.0.sp, fontWeight: FontWeight.w600, color: kWhite),
    labelMedium: TextStyle(fontSize: 14.0.sp, color: kGrey, fontWeight: FontWeight.w500),
  );

  // 3
  static ThemeData light() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: kGreen, primary: kGreen, brightness: Brightness.light),
      brightness: Brightness.light,
      primaryColor: kGreen,
      textTheme: lightTextTheme,
      scaffoldBackgroundColor: kBackground,
      primaryColorDark: kDark,
      primaryColorLight: kWhite,
      shadowColor: Colors.grey,
      bottomAppBarTheme: BottomAppBarTheme(color: kWhite),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: kGreen, foregroundColor: kWhite),
      appBarTheme: AppBarTheme(
        backgroundColor: kBackground,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: kDark),
        iconTheme: IconThemeData(color: kDark),
        titleTextStyle: TextStyle(color: kDark, fontSize: 14.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

  // 4
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: kGreen,
      textTheme: darkTextTheme,
      cardColor: kDarkCard,
      scaffoldBackgroundColor: kDark,
      primaryColorDark: kWhite,
      primaryColorLight: kDark,
      shadowColor: kDarkCard,
      colorScheme: ColorScheme.fromSeed(seedColor: kGreen, primary: kGreen, brightness: Brightness.dark),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: kGreen, foregroundColor: kWhite),
      appBarTheme: AppBarTheme(
        backgroundColor: kDark,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: kWhite),
        iconTheme: IconThemeData(color: kWhite),
        titleTextStyle: TextStyle(color: kWhite, fontSize: 14.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}
