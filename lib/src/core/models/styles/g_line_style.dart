
import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/styles/g_shadow_style.dart';

class GLineStyle extends GraphifyModel {

  const GLineStyle({
    this.color = '#aaa',
    this.width = 1,
    this.type = 'solid',
    this.dashOffset = 0,
    this.cap = 'butt',
    this.join = 'miter',
    this.miterLimit = 10,
    this.opacity = 1,
    this.shadowStyle = const GShadowStyle(),
  });

  final double opacity;
  final int miterLimit;
  final String join;
  final String cap;
  final int dashOffset;
  final String type;
  final int width;
  final String color;
  final GShadowStyle shadowStyle;

  GLineStyle copyWith({
    String? color,
    int? width,
    String? type,
    int? dashOffset,
    String? cap,
    String? join,
    int? miterLimit,
    double? opacity,
    GShadowStyle? shadowStyle,
  }) {
    return GLineStyle(
      color: color ?? this.color,
      width: width ?? this.width,
      type: type ?? this.type,
      dashOffset: dashOffset ?? this.dashOffset,
      cap: cap ?? this.cap,
      join: join ?? this.join,
      miterLimit: miterLimit ?? this.miterLimit,
      opacity: opacity ?? this.opacity,
      shadowStyle: shadowStyle ?? this.shadowStyle,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'width': width,
      'type': type,
      'dashOffset': dashOffset,
      'cap': cap,
      'join': join,
      'miterLimit': miterLimit,
      'opacity': opacity,
      ...shadowStyle.toJson(),
    };
  }

}