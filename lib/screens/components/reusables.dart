import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waka_app/screens/theme/colors.dart';

ActionChip backIcon({required BuildContext context, bool? canPop}) {
  return ActionChip(
    onPressed: canPop == true ? () => Navigator.pop(context) : null,
    padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
    label: Padding(
      padding: EdgeInsets.all(5.h),
      child: Icon(Icons.chevron_left, size: 20.r, color: kWhite),
    ),
  );
}
