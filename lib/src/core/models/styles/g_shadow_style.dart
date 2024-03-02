
import 'package:graphify/src/core/models/interface.dart';

class GShadowStyle extends GraphifyModel {

  const GShadowStyle({
    this.color = 'transparent',
    this.blur = 0,
    this.offsetX = 0,
    this.offsetY = 0,
  });

  final String? color;
  final int? blur;
  final int? offsetX;
  final int? offsetY;

  GShadowStyle copyWith({
    String? color,
    int? blur,
    int? offsetX,
    int? offsetY,
  }) {
    return GShadowStyle(
      color: color ?? this.color,
      blur: blur ?? this.blur,
      offsetX: offsetX ?? this.offsetX,
      offsetY: offsetY ?? this.offsetY,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'shadowColor': color,
      'shadowBlur': blur,
      'shadowOffsetX': offsetX,
      'shadowOffsetY': offsetY,
    };
  }

}