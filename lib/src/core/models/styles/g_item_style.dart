
import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/styles/g_shadow_style.dart';

class GItemStyle extends GraphifyModel {

  const GItemStyle({
    this.color = '#aaa',
    this.width = 1,
    this.type = 'solid',
    this.dashOffset = 0,
    this.cap = 'butt',
    this.join = 'bevel',
    this.miterLimit = 10,
    this.opacity = 1,
    this.shadowStyle,
  });

  /// Opacity of the component.
  ///
  /// Supports value from 0 to 1, and the component will not be drawn when set to 0.
  final double opacity;


  /// To set the miter limit ratio. Only works when join is set as miter.
  ///
  /// Default value is 10. Negative 0 and Infinity values are ignored.
  final int miterLimit;


  /// To determine the shape used to join two line segments where they meet.
  ///
  /// Possible values are:
  /// '[bevel]': Fills an additional triangular area between the common endpoint of connected segments, and the separate outside rectangular corners of each segment.
  /// '[round]': Rounds off the corners of a shape by filling an additional sector of disc centered at the common endpoint of connected segments.
  /// The radius for these rounded corners is equal to the line width.
  /// '[miter]': Connected segments are joined by extending their outside edges to connect at a single point, with the effect of filling an
  /// additional lozenge-shaped area. This setting is affected by the miterLimit property.
  /// Default value is '[bevel]'.
  final String join;


  /// To specify how to draw the end points of the line.
  ///
  /// Possible values are:
  /// '[butt]': The ends of lines are squared off at the endpoints.
  /// '[round]': The ends of lines are rounded.
  /// '[square]': The ends of lines are squared off by adding a box with an equal width and half the height of the line's thickness.
  /// Default value is 'butt'.
  final String cap;


  /// To set the line dash offset.
  /// With [type], we can make the line style more flexible.
  final int dashOffset;


  /// Line type.
  ///
  /// Possible values are:
  /// '[solid]'
  /// '[dashed]'
  /// '[dotted]'
  final String type;

  /// Line width.
  final int width;

  /// Line color.
  ///
  /// Supports setting as solid color using rgb(255,255,255), rgba(255,255,255,1), #fff, etc.
  /// Also supports setting as gradient color and pattern fill, see [option.color] for details
  final String color;


  /// Shadow style of the line.
  final GShadowStyle? shadowStyle;


  GItemStyle copyWith({
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
    return GItemStyle(
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
      ...?shadowStyle?.toJson(),
    };
  }

}