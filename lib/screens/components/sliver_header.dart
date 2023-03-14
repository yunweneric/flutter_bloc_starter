import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waka_app/screens/components/animated_column.dart';
import 'package:waka_app/screens/components/reusables.dart';
import 'package:waka_app/screens/theme/colors.dart';
import 'package:waka_app/screens/utils/sizing.dart';

class AppSliverHeader extends SliverPersistentHeaderDelegate {
  final double extendHeight;
  final String title;
  final Widget child;

  AppSliverHeader(this.child, {required this.title, required this.extendHeight});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Opacity(
          opacity: disappear(shrinkOffset),
          child: Image(
            image: AssetImage(""),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          child: Container(
            height: extendHeight,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Opacity(
          opacity: appear(shrinkOffset),
          child: AppBar(
            automaticallyImplyLeading: true,
            toolbarHeight: kToolbarHeight + 20.h,
            centerTitle: true,
            title: Text(title),
          ),
        ),
        Positioned(
          child: backIcon(context: context, canPop: true),
          top: extendHeight / 4 - shrinkOffset / 1.5,
          left: 20,
        ),
        Positioned(
          top: extendHeight / 1.5 - shrinkOffset / 1.5,
          left: 20,
          right: 20,
          child: animatedColumn(
            context: context,
            children: [
              Container(
                width: kwidth(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold, color: kWhite),
                    ),
                    khSpacer(10.h),
                    CupertinoSearchTextField(
                      placeholder: "Search category",
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  double appear(double shrinkOffset) {
    double op = shrinkOffset / extendHeight;
    return op > 1.0 ? 1.0 : op;
  }

  double disappear(double shrinkOffset) {
    double op = 1 - shrinkOffset / extendHeight;
    return op < 0.0 ? 0.0 : op;
  }

  @override
  double get maxExtent => kToolbarHeight + extendHeight;

  @override
  double get minExtent => appear(extendHeight) + kToolbarHeight * 2;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
