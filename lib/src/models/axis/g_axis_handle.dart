import 'dart:ui';
import 'package:graphify/src/models/interface.dart';
import 'package:graphify/src/models/styles/g_shadow_style.dart';

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


  /// The icon of the handle.
  /// It can be set to an image with 'image://url' , in which URL is the link to an image, or dataURI of an image.
  /// For example https://echarts.apache.org/en/option.html#xAxis.axisPointer.handle.icon
  final dynamic icon;

  /// The size of the handle, which can be set an Size(width, height).
  final Size size;

  /// Distance from handle center to axis.
  final int margin;

  /// The shadow style of the handle.
  final GShadowStyle shadowStyle;

  /// The color of the handle.
  /// Default: '#333'
  final String color;

  /// Throttle rate of trigger view update when dragging handle, in ms. Increase the value to improve performance, but decrease the experienc
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