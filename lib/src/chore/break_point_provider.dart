import 'package:flutter/material.dart';
import 'package:responsive_framework_v2/src/model/break_point.model.dart';

class ResponsiveConfigProvider extends InheritedWidget {
  final BreakpointConfig config;

  const ResponsiveConfigProvider({
    super.key,
    required this.config,
    required super.child,
  });

  static ResponsiveConfigProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ResponsiveConfigProvider>();
  }

  @override
  bool updateShouldNotify(covariant ResponsiveConfigProvider oldWidget) {
    return config != oldWidget.config;
  }
}
