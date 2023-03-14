import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waka_app/routes/names.dart';
import 'package:waka_app/routes/routing.dart';
import 'package:waka_app/screens/theme/theme.dart';

void main() {
  runApp(WakaApp());
}

class WakaApp extends StatefulWidget {
  const WakaApp({super.key});

  @override
  State<WakaApp> createState() => _WakaAppState();
}

class _WakaAppState extends State<WakaApp> {
  bool isDarkMode = false;
  @override
  void initState() {
    changeTheme();
    window.onPlatformBrightnessChanged = () {
      changeTheme();
    };
    super.initState();
  }

  changeTheme() {
    final brightness = window.platformBrightness;
    setState(() {
      isDarkMode = brightness == Brightness.dark;
    });
  }

  final RouteGenerator appRoutes = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) {
        ThemeData theme = isDarkMode ? WakaAppTheme.dark() : WakaAppTheme.light();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cookyaown',
          theme: theme,
          onGenerateRoute: appRoutes.generatedRoutes,
          initialRoute: AppRoutes.base,
          useInheritedMediaQuery: true,
        );
      },
      // child: OnboardingScreen(),
    );
  }
}
