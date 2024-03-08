import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/other/g_position.dart';
import 'package:graphify/src/core/models/other/g_z_level.dart';
import 'package:graphify/src/core/models/styles/g_line_style.dart';


class GLabel extends GraphifyModel {

  const GLabel({
    super.id,
    super.show = true,
    this.zLevel = const GZLevel(z: 2),
    this.width = 'auto',
    this.height = 'auto',
    this.orient = 'horizontal',
    this.align = 'auto',
    this.padding = 5,
    this.itemGap = 10,
    this.itemWidth = 25,
    this.itemHeight = 14,
    this.lineStyle = const GLineStyle(),
    this.position = const GPosition(),
    this.type = 'plain',
  });


  /// Type of legend.
  ///
  /// Optional values:
  /// '[plain]': Simple legend. (default)
  /// '[scroll]': Scrollable legend. It helps when too many legend items needed to be shown.
  final String type;


  /// Whether to show the legend component.
  final GZLevel? zLevel;


  /// Distance between legend component and the container.
  final GPosition position;


  /// The width of the legend component.
  final dynamic width;


  /// The height of the legend component.
  final dynamic height;


  /// The layout orientation of legend.
  ///
  /// Options:
  /// '[horizontal]'
  /// '[vertical]'
  final String orient;


  /// Legend marker and text aligning.
  ///
  /// By default, it automatically calculates from component location and orientation.
  /// When left value of this component is 'right', and the vertical layout (orient is '[vertical]'), it would be aligned to 'right'.
  /// Option:
  /// '[auto]'
  /// '[left]'
  /// '[right]'
  final String align;


  /// legend space around content.
  ///
  /// The unit is px. Default values for each position are 5. And they can be set to different values with left, right, top, and bottom.
  /// Examples:
  /// // Set padding to be 5
  /// padding: 5
  /// // Set the top and bottom paddings to be 5, and left and right paddings to be 10
  /// padding: [5, 10]
  /// // Set each of the four paddings separately
  /// padding: [
  ///     5,  // up
  ///     10, // right
  ///     5,  // down
  ///     10, // left
  /// ]
  final dynamic padding;


  /// The distance between each legend, horizontal distance in horizontal layout, and vertical distance in vertical layout.
  final int itemGap;


  /// Image width of legend symbol.
  final int itemWidth;


  /// Image height of legend symbol.
  final int itemHeight;


  /// Legend line style. If its children have values as 'inherit', the values are inherited from corresponding series options.
  final GLineStyle lineStyle;


  // GGrid copyWith({
  //   String? id,
  //   bool? show,
  //
  // }) {
  //   return GGrid(
  //     id: id ?? this.id,
  //     show: show ?? this.show,
  //
  //   );
  // }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'show': show,
      'width': width,
      'height': height,
      'orient': orient,
      'align': align,
      'padding': padding,
      'itemGap': itemGap,
      'itemWidth': itemWidth,
      'itemHeight': itemHeight,
      'lineStyle': lineStyle.toJson(),
      'type': type,
      ...?zLevel?.toJson(),
      ...position.toJson(),
    };
  }


}