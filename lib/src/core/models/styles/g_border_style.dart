
import 'package:graphify/src/core/models/interface.dart';

class GBorderStyle extends GraphifyModel {

  const GBorderStyle({
    this.color = '#000',
    this.width = 0,
    this.type = 'solid',
    this.dashOffset = 0,
    this.radius = 0,
  });

  final String? color;
  final int? width;
  final String? type;
  final int? dashOffset;
  final int radius;

  GBorderStyle copyWith({
    String? color,
    int? width,
    String? type,
    int? dashOffset,
    int? radius,
  }) {
    return GBorderStyle(
      color: color ?? this.color,
      width: width ?? this.width,
      type: type ?? this.type,
      dashOffset: dashOffset ?? this.dashOffset,
      radius: radius ?? this.radius,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'borderColor': color,
      'borderWidth': width,
      'borderType': type,
      'borderDashOffset': dashOffset,
      'borderRadius': radius,
    };
  }

}