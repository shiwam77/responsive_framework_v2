import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_framework_v2/src/model/break_point.model.dart';

extension ResponsiveOnBreakPoint on BuildContext {
  T responsive<T>({
    final Map<int, T>? breakpoints,
    T? xs,
    T? sm,
    T? md,
    T? lg,
    T? xl,
    ResponsiveConfig? overrideConfig,
  }) {
    debugPrint(MediaQuery.of(this).size.width.toString());

    FlutterView? view = View.maybeOf(this);
    final screenWidth = view!.physicalSize.width;
    final config = overrideConfig ?? ResponsiveConfig.instance;

    final Map<num, T> deviceBreakpoints = {
      if (xs != null) config.xs!: xs,
      if (sm != null) config.sm!: sm,
      if (md != null) config.md!: md,
      if (lg != null) config.lg!: lg,
      if (xl != null) config.xl!: xl,
    };

    final mergedBreakpoints = {...deviceBreakpoints, ...breakpoints ?? {}};
    // Sort breakpoints in ascending order
    final sortedBreakpoints = mergedBreakpoints!.keys.toList()..sort();

    // Find the appropriate breakpoint
    num activeBreakpoint = sortedBreakpoints.lastWhere(
        (breakpoint) => screenWidth >= breakpoint,
        orElse: () => sortedBreakpoints.first);

    // Get the corresponding value for the active breakpoint
    final breakpointValue = mergedBreakpoints[activeBreakpoint];

    return breakpointValue!;
  }

  Widget showOnScreenBreakPoint({
    required int breakpoint,
    required Widget widget,
  }) {
    debugPrint(MediaQuery.of(this).size.width.toString());

    final screenWidth = MediaQuery.of(this).size.width;
    return screenWidth <= breakpoint ? widget : const SizedBox.shrink();
  }
}
