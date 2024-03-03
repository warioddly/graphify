import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/other/g_z_level.dart';
import 'package:graphify/src/core/models/styles/g_border_style.dart';
import 'package:graphify/src/core/models/styles/g_shadow_style.dart';


class GGrid extends GraphifyModel {

  const GGrid({
    super.id,
    super.show = false,
    this.zLevel = const GZLevel(z: 2),
    this.left = '10%',
    this.right = '10%',
    this.top = '60',
    this.bottom = '60',
    this.width = 'auto',
    this.height = 'auto',
    this.containLabel = false,
    this.backgroundColor = 'transparent',
    this.borderStyle = const GBorderStyle(),
    this.shadowStyle = const GShadowStyle(),
  });


  final dynamic left;
  final dynamic right;
  final dynamic top;
  final dynamic bottom;
  final dynamic width;
  final dynamic height;
  final bool containLabel;
  final String backgroundColor;
  final GBorderStyle borderStyle;
  final GShadowStyle shadowStyle;
  final GZLevel zLevel;

  GGrid copyWith({
    String? id,
    bool? show,
    dynamic left,
    dynamic right,
    dynamic top,
    dynamic bottom,
    dynamic width,
    dynamic height,
    bool? containLabel,
    String? backgroundColor,
    GBorderStyle? borderStyle,
    GShadowStyle? shadowStyle,
    GZLevel? zLevel,
  }) {
    return GGrid(
      id: id ?? this.id,
      show: show ?? this.show,
      left: left ?? this.left,
      right: right ?? this.right,
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      width: width ?? this.width,
      height: height ?? this.height,
      containLabel: containLabel ?? this.containLabel,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderStyle: borderStyle ?? this.borderStyle,
      shadowStyle: shadowStyle ?? this.shadowStyle,
      zLevel: zLevel ?? this.zLevel,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'show': show,
      'left': left,
      'right': right,
      'top': top,
      'bottom': bottom,
      'width': width,
      'height': height,
      'containLabel': containLabel,
      'backgroundColor': backgroundColor,
      ...borderStyle.toJson(),
      ...shadowStyle.toJson(),
      ...zLevel.toJson(),
    };
  }


}