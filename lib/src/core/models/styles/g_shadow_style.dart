
import 'package:graphify/src/core/models/interface.dart';

class GShadowStyle extends GraphifyModel {

  const GShadowStyle({
    this.color = 'transparent',
    this.shadowColor = 'transparent',
    this.blur = 0,
    this.offsetX = 0,
    this.offsetY = 0,
  });

  final String? color;
  final String? shadowColor;
  final int? blur;
  final int? offsetX;
  final int? offsetY;

  GShadowStyle copyWith({
    String? color,
    String? shadowColor,
    int? blur,
    int? offsetX,
    int? offsetY,
  }) {
    return GShadowStyle(
      color: color ?? this.color,
      shadowColor: shadowColor ?? this.shadowColor,
      blur: blur ?? this.blur,
      offsetX: offsetX ?? this.offsetX,
      offsetY: offsetY ?? this.offsetY,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'shadowColor': shadowColor,
      'shadowBlur': blur,
      'shadowOffsetX': offsetX,
      'shadowOffsetY': offsetY,
    };
  }

}