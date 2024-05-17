import 'package:flutter/material.dart';
import 'package:responsive_framework_v2/src/extension/context_extension.dart';
import 'package:responsive_framework_v2/src/model/break_point.model.dart';

import 'src/chore/responsive_scale.dart';
import 'src/model/scale_in_between.model.dart';

void main() {
  BreakpointConfig<double>(
    xs: 360,
    sm: 640,
    md: 768,
    lg: 1024,
    xl: 1280,
  );

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final overrideConfig = ResponsiveConfig(
      xs: 320,
      sm: 480,
      md: 640,
      lg: 800,
      xl: 960,
    );
    return MaterialApp(
      home: Scaffold(
        body: ResponsiveScaleRoot(
          breakpoints: [
            ScaleInBetween(start: 500, end: 600, scale: 600),
            ScaleInBetween(start: 400, end: 500, scale: 600),
            ScaleInBetween(start: 300, end: 400, scale: 600),
            ScaleInBetween(
                start: 200,
                end: 300,
                scale: 600), // Scale UI between 600 and 500 to 300
          ],
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 200,
                          color: Colors.blue,
                          child: const Center(
                            child: Text(
                              'Scaled UI (600-700)',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          color: Colors.blue,
                          child: const Center(
                            child: Text(
                              'Scaled UI (600-700)',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          color: Colors.blue,
                          child: const Center(
                            child: Text(
                              'Scaled UI (600-700)',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          color: Colors.blue,
                          child: const Center(
                            child: Text(
                              'Scaled UI (600-700)',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    context.responsive(
                      breakpoints: {
                        600: const Text("Small"),
                        900: Text("Medium"),
                        912: Text('912'),
                        1200: Text("Large"),
                        1400: Text("Extra Large"),
                      },
                      sm: Text('sm'),
                      // md: Text('md'),
                      // lg: Text('lg'),
                      // xl: Text('xl'),
                    ),
                    context.responsive(
                      sm: Text('sm over'),
                      overrideConfig: overrideConfig,
                      // md: Text('md over'),
                      // lg: Text('lg over'),
                      // xl: Text('xl over'),
                    ),
                    context.showOnScreenBreakPoint(
                        breakpoint: 600, widget: Text('showOnScreenWidth 600')),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
