import 'package:flutter/material.dart';
import 'package:responsive_framework_v2/src/model/scale_in_between.model.dart';

// This widget is responsible for scaling its child widget based on the provided width.
class _ResponsiveScaledBox extends StatelessWidget {
  final double width;
  final Widget child;

  const _ResponsiveScaledBox({
    super.key,
    required this.width,
    required this.child,
  });

  @override
  // Builds the widget tree based on the given context and constraints.
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the aspect ratio based on the available constraints.
        double aspectRatio = constraints.maxWidth / constraints.maxHeight;
        // Calculate the scaled height based on the provided width and aspect ratio.
        double scaledHeight = width / aspectRatio;

        // Use a FittedBox to ensure the child widget fits within the scaled dimensions.
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

// This widget is the root of the responsive scaling functionality.
class ResponsiveScaleRoot extends StatelessWidget {
  final Widget child;
  final List<ScaleInBetween> breakpoints;

  const ResponsiveScaleRoot({
    Key? key,
    required this.child,
    required this.breakpoints,
  }) : super(key: key);

  @override
  // Builds the widget tree based on the given context and constraints.
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Get the current screen width.
        final double screenWidth = constraints.maxWidth;
        // Set the initial scaled width to the current screen width.
        double scaledWidth = screenWidth;

        // Find the appropriate scaled width based on the provided breakpoints.
        for (final breakpoint in breakpoints) {
          if (screenWidth >= breakpoint.start &&
              screenWidth <= breakpoint.end) {
            scaledWidth = breakpoint.scale;
            break;
          }
        }

        // Debug print the current screen width for debugging purposes.
        debugPrint(MediaQuery.of(context).size.width.toString());

        // Return the _ResponsiveScaledBox widget with the calculated scaled width.
        return _ResponsiveScaledBox(
          width: scaledWidth,
          child: child,
        );
      },
    );
  }
}
