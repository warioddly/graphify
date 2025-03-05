import 'dart:ui' show Color;

final class ColorUtils {

  static String colorToRgba(Color color) {
    return 'rgba(${(color.red * 255).toInt()}, ${(color.green * 255).toInt()}, ${(color.blue * 255).toInt()}, ${color.opacity})';
  }

}