
import 'package:graphify/src/core/models/interface.dart';

class GShadowStyle extends GraphifyModel {

  const GShadowStyle({
    super.show = false,
    this.color = 'transparent',
    this.shadowColor = 'transparent',
    this.blur = 0,
    this.offsetX = 0,
    this.offsetY = 0,
  });


  final String color;

  /// Shadow color. Support same format as color.
  ///
  /// Attention: This property works only if show: true configured.
  final String? shadowColor;

  /// Size of shadow blur.
  ///
  /// This attribute should be used along with shadowColor,shadowOffsetX, shadowOffsetY to set shadow to component.
  final int blur;

  /// Offset distance on the horizontal direction of shadow.
  ///
  /// Attention: This property works only if [show]: true configured.
  final int offsetX;

  /// Offset distance on the vertical direction of shadow.
  ///
  /// Attention: This property works only if show: true configured.
  final int offsetY;


  GShadowStyle copyWith({
    bool? show,
    String? color,
    String? shadowColor,
    int? blur,
    int? offsetX,
    int? offsetY,
  }) {
    return GShadowStyle(
      show: show ?? this.show,
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
      'show': show,
      'color': color,
      'shadowColor': shadowColor,
      'shadowBlur': blur,
      'shadowOffsetX': offsetX,
      'shadowOffsetY': offsetY,
    };
  }

}