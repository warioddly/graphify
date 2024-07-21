
import 'package:graphify/src/core/utils/helpers.dart';
import 'package:graphify/src/shared/enums/g_chart_enums.dart';
import 'package:graphify/src/shared/models/interface.dart';

class GBorderStyle extends GraphifyModel {

  const GBorderStyle({
    super.show = false,
    this.color = '#000',
    this.width = 1,
    this.type = GBorderType.solid,
    this.dashOffset = 0,
    this.radius = 0,
  });

  /// Border color of title. Support the same color format as [backgroundColor].
  final String color;

  /// Border width of title.
  final int width;

  /// Stroke line type of the text.
  /// Possible values are:
  ///  '[GBorderType.solid]'
  ///  '[GBorderType.dashed]'
  ///  '[GBorderType.dotted]'
  final GBorderType type;

  /// To set the line dash offset. With [type] , we can make the line style more flexible.
  final int dashOffset;

  /// The radius of rounded corner. Its unit is px. And it supports use array to respectively specify the 4 corner radiuses.
  /// For example:
  ///   borderRadius: 5, // consistently set the size of 4 rounded corners
  ///   borderRadius: [5, 5, 0, 0] // (clockwise upper left, upper right, bottom right and bottom left)
  final int radius;

  GBorderStyle copyWith({
    bool? show,
    String? color,
    int? width,
    GBorderType? type,
    int? dashOffset,
    int? radius,
  }) {
    return GBorderStyle(
      show: show ?? this.show,
      color: color ?? this.color,
      width: width ?? this.width,
      type: type ?? this.type,
      dashOffset: dashOffset ?? this.dashOffset,
      radius: radius ?? this.radius,
    );
  }

  @override
  Map<String, dynamic> toJson([String? prefix]) {
    prefix = getPrefix(prefix, 'border');
    return {
      '${prefix}Color': color,
      '${prefix}Width': width,
      '${prefix}Type': type.name,
      '${prefix}DashOffset': dashOffset,
      '${prefix}Radius': radius,
    };
  }

}