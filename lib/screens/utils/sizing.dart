import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsetsGeometry kph(double size) {
  return EdgeInsets.symmetric(horizontal: size);
}

EdgeInsetsGeometry kpadding(double width, double height) {
  return EdgeInsets.symmetric(horizontal: width, vertical: height);
}

EdgeInsetsGeometry kpv(double size) {
  return EdgeInsets.symmetric(vertical: size);
}

double kwidth(context) {
  return MediaQuery.of(context).size.width;
}

double kheight(context) {
  return MediaQuery.of(context).size.height;
}

Widget kh20Spacer() {
  return SizedBox(height: 20.h);
}

Widget khSpacer(double height) {
  return SizedBox(height: height);
}

Widget kwSpacer(double width) {
  return SizedBox(width: width);
}
