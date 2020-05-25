import 'package:flutter/material.dart';

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;

  static ScrollConfiguration configureScrollBehavior(Widget child) =>
      ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: child,
      );
}
