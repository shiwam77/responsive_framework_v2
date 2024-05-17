# responsive_framework_v2


### Responsive Scaling in Flutter
This Flutter widget setup enables responsive scaling of UI elements based on predefined breakpoints using 
the ResponsiveScaleRoot widget and the ScaleInBetween class.

* Usage Example:

```
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
                    // responsive is used to display different content based on screen width && using breakpoints config from global instance

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
                   //overrideConfig is used to override the default breakpoints

                    context.responsive(
                      sm: Text('sm over'),
                      md: Text('md over'),
                      lg: Text('lg over'),
                      xl: Text('xl over'),
                      overrideConfig: overrideConfig,

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

```



### Features:
 * Responsive Scaling: UI elements are scaled dynamically based on defined breakpoints.
 * Breakpoint Definition: Breakpoints are defined using the ScaleInBetween class,
                           allowing for customization of scaling behavior between specific screen widths.
 * Responsive Widgets: Use context.responsive to display different content based on screen width,
                       and context.showOnScreenBreakPoint to show content only at specific screen widths.