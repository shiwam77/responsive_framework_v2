class ScaleInBetween {
  final double start;
  final double end;
  final double scale;

  ScaleInBetween({required this.start, required this.end, required this.scale})
      : assert(start < end, "Start must be less than end"),
        assert(scale > 0, "Scale must be greater than 0") {
    if (!(start < end)) {
      throw ArgumentError("Start must be less than end");
    }
    if (!(scale > 0)) {
      throw ArgumentError("Scale must be greater than 0");
    }
  }
}
