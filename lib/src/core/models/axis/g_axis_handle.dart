import 'dart:ui';
import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/styles/g_shadow_style.dart';

class GAxisHandle extends GraphifyModel {

  const GAxisHandle({
    super.show = false,
    this.icon,
    this.size = const Size(45, 45),
    this.margin = 8,
    this.shadowStyle = const GShadowStyle(),
    this.color = '#333',
    this.throttle = 40,
  });


  final dynamic icon;
  final Size size;
  final int margin;
  final GShadowStyle shadowStyle;
  final String color;
  final int throttle;


  GAxisHandle copyWith({
    bool? show,
    dynamic icon,
    Size? size,
    int? margin,
    GShadowStyle? shadowStyle,
    String? color,
    int? throttle,
  }) {
    return GAxisHandle(
      show: show ?? this.show,
      icon: icon ?? this.icon,
      size: size ?? this.size,
      margin: margin ?? this.margin,
      shadowStyle: shadowStyle ?? this.shadowStyle,
      color: color ?? this.color,
      throttle: throttle ?? this.throttle,
    );
  }


  @override
  Map<String, dynamic> toJson() {
    return {
      'show': show,
      'size': [size.width, size.height],
      'margin': margin,
      'icon': icon,
      'color': color,
      'throttle': throttle,
      ...shadowStyle.toJson(),

    };
  }

}