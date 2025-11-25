import 'dart:ui' show Color;

extension ColorExtension on Color {
  String get toRGBA {
    final r255 = (r * 255.0).round() & 0xff;
    final g255 = (g * 255.0).round() & 0xff;
    final b255 = (b * 255.0).round() & 0xff;
    final alpha = a; // 0..1
    return 'rgba($r255, $g255, $b255, $alpha)';
  }
}
