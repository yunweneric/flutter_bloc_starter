import 'package:flutter/material.dart';

BoxDecoration appDecoration(BuildContext context, double radius, bool isinnerShadow) {
  return BoxDecoration(
    color: Theme.of(context).cardColor,
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      isinnerShadow ? innerShadow(context) : appShadow(context),
    ],
  );
}

BoxShadow innerShadow(BuildContext context) {
  return BoxShadow(
    color: Theme.of(context).shadowColor.withOpacity(1),
    offset: Offset(10, -5),
    blurRadius: 10,
    spreadRadius: -10,
  );
}

BoxShadow appShadow(BuildContext context) {
  return BoxShadow(
    color: Theme.of(context).shadowColor.withOpacity(0.2),
    offset: Offset(0, 0),
    blurRadius: 20,
    spreadRadius: 10,
  );
}
