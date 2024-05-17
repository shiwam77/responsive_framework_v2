class ResponsiveConfig {
  num? xs;
  num? sm;
  num? md;
  num? lg;
  num? xl;

  static final ResponsiveConfig _instance = ResponsiveConfig._internal();

  factory ResponsiveConfig({
    required num xs,
    required num sm,
    required num md,
    required num lg,
    required num xl,
  }) {
    _instance.xs = xs;
    _instance.sm = sm;
    _instance.md = md;
    _instance.lg = lg;
    _instance.xl = xl;
    return _instance;
  }

  ResponsiveConfig._internal();

  static ResponsiveConfig get instance => _instance;

  // Method to override configuration temporarily
  ResponsiveConfig copyWith({
    num? xs,
    num? sm,
    num? md,
    num? lg,
    num? xl,
  }) {
    return ResponsiveConfig._internal()
      ..xs = xs ?? this.xs
      ..sm = sm ?? this.sm
      ..md = md ?? this.md
      ..lg = lg ?? this.lg
      ..xl = xl ?? this.xl;
  }
}
