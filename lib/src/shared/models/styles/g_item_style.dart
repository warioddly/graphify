import 'package:graphify/src/shared/enums/g_chart_enums.dart';
import 'package:graphify/src/shared/models/interface.dart';
import 'package:graphify/src/shared/models/styles/g_border_style.dart';
import 'package:graphify/src/shared/models/decals/g_decals.dart';
import 'package:graphify/src/shared/models/styles/g_shadow_style.dart';


class GItemStyle extends GraphifyModel {

  const GItemStyle({
    this.color,
    this.borderStyle,
    this.shadowStyle,
    this.decal,
    this.opacity,
  });

  /// Сolor.
  ///
  /// Supports setting as solid color using rgb(255,255,255), rgba(255,255,255,1), #fff, etc.
  /// Also supports setting as gradient color and pattern fill
  final String? color;

  /// Border style of item.
  final GItemBorderStyle? borderStyle;

  /// Shadow style of item.
  final GShadowStyle? shadowStyle;

  /// The style of the decal pattern.
  ///
  /// It works only if aria.enabled and aria.decal.show are both set to be true.
  /// If it is set to be '[null]', no decal will be used.
  final GDecals? decal;

  /// Opacity of item.
  final int? opacity;


  GItemStyle copyWith({
    String? color,
    GItemBorderStyle? borderStyle,
    GShadowStyle? shadowStyle,
    GDecals? decal,
    int? opacity,
  }) {
    return GItemStyle(
      color: color ?? this.color,
      borderStyle: borderStyle ?? this.borderStyle,
      shadowStyle: shadowStyle ?? this.shadowStyle,
      decal: decal ?? this.decal,
      opacity: opacity ?? this.opacity,
    );
  }


  @override
  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'decal': decal?.toJson(),
      'opacity': opacity,
      ...?shadowStyle?.toJson(),
      ...?borderStyle?.toJson(),
    };
  }

}


class GItemBorderStyle extends GBorderStyle {


  const GItemBorderStyle({
    super.show = true,
    super.color = '#000',
    super.width = 1,
    super.type = GBorderType.solid,
    super.dashOffset = 0,
    super.radius = 0,
    this.cap = 'butt',
    this.join = 'bevel',
    this.mitterLimit = 10,
  });


  /// To specify how to draw the end points of the line. Possible values are:
  ///
  /// '[butt]': The ends of lines are squared off at the endpoints.
  /// '[round]': The ends of lines are rounded.
  /// '[square]': The ends of lines are squared off by adding a box with an equal width and half the height of the line's thickness.
  /// Default value is '[butt]'. Refer to MDN lineCap for more details.
  final String cap;


  /// To determine the shape used to join two line segments where they meet.
  ///
  /// Possible values are:
  /// '[bevel]': Fills an additional triangular area between the common endpoint of connected segments, and the separate outside rectangular corners of each segment.
  /// '[round]': Rounds off the corners of a shape by filling an additional sector of disc centered at the common endpoint of connected segments.
  /// The radius for these rounded corners is equal to the line width.
  /// '[miter]': Connected segments are joined by extending their outside edges to connect at a single point, with the effect of filling an additional lozenge-shaped area.
  /// This setting is affected by the borderMiterLimit property.
  /// Default value is '[bevel]'. Refer to MDN lineJoin for more details.
  final String join;


  /// To set the miter limit ratio. Only works when borderJoin is set as miter.
  ///
  /// Default value is 10. Negative、0、Infinity and NaN values are ignored.
  final int mitterLimit;



  @override
  GItemBorderStyle copyWith({
    bool? show,
    String? color,
    int? width,
    GBorderType? type,
    int? dashOffset,
    int? radius,
    String? cap,
    String? join,
    int? mitterLimit,
  }) {
    return GItemBorderStyle(
      show: show ?? this.show,
      color: color ?? this.color,
      width: width ?? this.width,
      type: type ?? this.type,
      dashOffset: dashOffset ?? this.dashOffset,
      radius: radius ?? this.radius,
      cap: cap ?? this.cap,
      join: join ?? this.join,
      mitterLimit: mitterLimit ?? this.mitterLimit,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'borderCap': cap,
      'borderJoin': join,
      'borderMiterLimit': mitterLimit,
    };
  }


}