import 'dart:ui' show Color;

extension ColorExtension on Color {

  String get toRGBA {
    return 'rgba(${(red * 255).toInt()}, ${(green * 255).toInt()}, ${(blue * 255).toInt()}, ${opacity})';
  }

}