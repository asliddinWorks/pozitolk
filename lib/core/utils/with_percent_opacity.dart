import 'dart:ui';

extension ColorOpacity on Color {
  Color withPercentOpacity(double percent) {
    assert(percent >= 0 && percent <= 1);
    return withAlpha((percent * 255).toInt());
  }
}
