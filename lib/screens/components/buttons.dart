import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waka_app/screens/utils/sizing.dart';

Widget submitButton({
  required BuildContext context,
  required VoidCallback onPressed,
  required String text,
  required Color color,
  required Color textColor,
  EdgeInsetsGeometry? padding,
  BorderRadiusGeometry? borderRadius,
  double? width,
  bool? isBorder,
  FontWeight? fontWeight,
  double? elevation,
  double? fontSize,
}) {
  return SizedBox(
    width: width != null ? width : kwidth(context),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(8.r)),
        padding: padding ?? EdgeInsets.symmetric(vertical: 15.h),
        backgroundColor: color,
        side: isBorder == null ? BorderSide.none : BorderSide(width: 1.0, color: textColor),
        elevation: elevation,
      ),
      onPressed: () => {
        HapticFeedback.mediumImpact(),
        onPressed(),
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 12.sp,
          color: textColor,
          fontWeight: fontWeight == null ? FontWeight.w500 : fontWeight,
        ),
      ),
    ),
  );
}
