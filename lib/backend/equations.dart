abstract class Equation {
  double getY(double x);
  Equation copyWith({double? a, double? b, double? c, double? d});
}

class LinearEquation extends Equation {
  LinearEquation({double? a, double? b, double? c})
      : _a = a ?? 0.0,
        _b = b ?? 0.0,
        _c = c ?? 0.0;
  final double _a;
  final double _b;
  final double _c;

  LinearEquation copyWith({double? a, double? b, double? c, double? d}) {
    return LinearEquation(a: a ?? _a, b: b ?? _b, c: c ?? _c);
  }

  @override
  double getY(double x) {
    double value = -(_a * x + _c) / _b;
    return value;
  }
}

class QuadraticEquation extends Equation {
  QuadraticEquation({double? a, double? b, double? c})
      : _a = a ?? 0.0,
        _b = b ?? 0.0,
        _c = c ?? 0.0;
  final double _a;
  final double _b;
  final double _c;

  @override
  double getY(double x) {
    double value = _a * x * x + _b * x + _c;
    return value;
  }

  QuadraticEquation copyWith({double? a, double? b, double? c, double? d}) {
    return QuadraticEquation(a: a ?? _a, b: b ?? _b, c: c ?? _c);
  }
}

class CubicEquation extends Equation {
  CubicEquation({double? a, double? b, double? c, double? d})
      : _a = a ?? 0.0,
        _b = b ?? 0.0,
        _c = c ?? 0.0,
        _d = d ?? 0.0;
  final double _a;
  final double _b;
  final double _c;
  final double _d;

  @override
  double getY(double x) {
    double value = _a * x * x * x + _b * x * x + _c * x + _d;
    return value;
  }

  CubicEquation copyWith({double? a, double? b, double? c, double? d}) {
    return CubicEquation(a: a ?? _a, b: b ?? _b, c: c ?? _c, d: d ?? _d);
  }
}
