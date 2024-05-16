import 'dart:ui';

import 'package:flutter/material.dart';

extension ResponsiveOnBreakPoint on BuildContext {
  T responsive<T>({
    required final Map<int, T> breakpoints,
  }) {
    debugPrint(MediaQuery.of(this).size.width.toString());

    FlutterView? view = View.maybeOf(this);
    final screenWidth = view!.physicalSize.width;

    // Sort breakpoints in ascending order
    final sortedBreakpoints = breakpoints.keys.toList()..sort();

    // Find the appropriate breakpoint
    int activeBreakpoint = sortedBreakpoints.lastWhere(
        (breakpoint) => screenWidth >= breakpoint,
        orElse: () => sortedBreakpoints.first);

    // Get the corresponding value for the active breakpoint
    final breakpointValue = breakpoints[activeBreakpoint];

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
