import 'package:flutter/material.dart';
import 'package:responsive_framework_v2/src/model/scale_in_between.model.dart';

class _ResponsiveScaledBox extends StatelessWidget {
  final double width;
  final Widget child;

  const _ResponsiveScaledBox({
    super.key,
    required this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double aspectRatio = constraints.maxWidth / constraints.maxHeight;
        double scaledHeight = width / aspectRatio;

        return FittedBox(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          child: Container(
            width: width,
            height: scaledHeight,
            alignment: Alignment.center,
            child: child,
          ),
        );
      },
    );
  }
}

class ResponsiveScaleRoot extends StatelessWidget {
  final Widget child;
  final List<ScaleInBetween> breakpoints;

  const ResponsiveScaleRoot({
    super.key,
    required this.child,
    required this.breakpoints,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        double scaledWidth = screenWidth;

        // Find the appropriate scaled width based on breakpoints
        for (final breakpoint in breakpoints) {
          if (screenWidth >= breakpoint.start &&
              screenWidth <= breakpoint.end) {
            scaledWidth = breakpoint.scale;
            break;
          }
        }
        debugPrint(MediaQuery.of(context).size.width.toString());

        return _ResponsiveScaledBox(
          width: scaledWidth,
          child: child,
        );
      },
    );
  }
}
