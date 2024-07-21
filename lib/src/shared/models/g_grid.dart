import 'package:graphify/src/shared/models/interface.dart';
import 'package:graphify/src/shared/models/other/g_z_level.dart';
import 'package:graphify/src/shared/models/styles/g_border_style.dart';
import 'package:graphify/src/shared/models/styles/g_shadow_style.dart';
import 'package:graphify/src/shared/models/other/g_position.dart';


class GGrid extends GraphifyModel {

  const GGrid({
    super.id,
    super.show = false,
    this.width = 'auto',
    this.height = 'auto',
    this.containLabel = false,
    this.backgroundColor = 'transparent',
    this.zLevel = const GZLevel(z: 2),
    this.position = const GPosition(
      left: '10%',
      right: '10%',
      top: '60',
      bottom: '60',
    ),
    this.borderStyle = const GBorderStyle(),
    this.shadowStyle = const GShadowStyle(),
  });


  /// The position of the grid component.
  final GPosition position;
  final dynamic width;
  final dynamic height;
  final bool containLabel;
  final String backgroundColor;
  final GBorderStyle borderStyle;
  final GShadowStyle shadowStyle;

  /// The z-index of the component.
  final GZLevel zLevel;


  GGrid copyWith({
    String? id,
    bool? show,
    GPosition? position,
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
      position: position ?? this.position,
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
      'width': width,
      'height': height,
      'containLabel': containLabel,
      'backgroundColor': backgroundColor,
      ...position.toJson(),
      ...borderStyle.toJson(),
      ...shadowStyle.toJson(),
      ...zLevel.toJson(),
    };
  }


}