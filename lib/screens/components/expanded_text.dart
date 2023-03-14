import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ExpandablePanel expandableText({required BuildContext context, required String title, required String desc}) {
  return ExpandablePanel(
    header: Text(
      title,
      style: Theme.of(context).textTheme.titleMedium,
      softWrap: true,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    collapsed: Text(
      desc,
      softWrap: true,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.2.h),
    ),
    expanded: Text(
      desc,
      softWrap: true,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.2.h),
    ),
  );
}
