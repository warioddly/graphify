import 'dart:ui' show Color;

final class ColorUtils {

  static String colorToRgba(Color color) {
    return 'rgba(${(color.r * 255).toInt()}, ${(color.g * 255).toInt()}, ${(color.b * 255).toInt()}, ${color.a})';
  }

}