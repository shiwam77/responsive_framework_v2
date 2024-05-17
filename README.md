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


ResponsiveScaleRoot(
  breakpoints: [
    // Define breakpoints for scaling UI between specific screen widths
    ScaleInBetween(start: 500, end: 600, scale: 600),
    ScaleInBetween(start: 400, end: 500, scale: 600),
    ScaleInBetween(start: 300, end: 400, scale: 600),
    ScaleInBetween(start: 200, end: 300, scale: 600),
  ],
  child: LayoutBuilder(
    builder: (context, constraints) {
      // This example demonstrates the usage of responsive scaling
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Example UI elements with scaled heights
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container with scaled height based on breakpoints
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
                  // Add more containers or UI elements as needed
                ],
              ),
              // Additional UI elements
              const SizedBox(
                height: 20,
              ),
              // Circle container with fixed dimensions
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
              // Responsive widget showing different content based on screen width
              SizedBox(
                height: 20,
              ),
              // Usage of `context.responsive` to display content based on breakpoints
              context.responsive(breakpoints: {
                600: const Text("Small"),
                900: Text("Medium"),
                912: Text('912'),
                1200: Text("Large"),
                1400: Text("Extra Large"),
              }),
              // Usage of `context.showOnScreenBreakPoint` to show content only at specific screen widths
              context.showOnScreenBreakPoint(
                breakpoint: 600,
                widget: Text('Show on Screen Width 600'),
              ),
            ],
          ),
        ),
      );
    },
  ),
)
```



### Features:
 * Responsive Scaling: UI elements are scaled dynamically based on defined breakpoints.
 * Breakpoint Definition: Breakpoints are defined using the ScaleInBetween class,
                           allowing for customization of scaling behavior between specific screen widths.
 * Responsive Widgets: Use context.responsive to display different content based on screen width,
                       and context.showOnScreenBreakPoint to show content only at specific screen widths.