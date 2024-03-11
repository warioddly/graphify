import 'package:graphify/src/core/enums/g_legend_enums.dart';
import 'package:graphify/src/core/enums/g_text_enums.dart';
import 'package:graphify/src/core/models/animations/g_animation.dart';
import 'package:graphify/src/core/models/other/g_position.dart';
import 'package:graphify/src/core/models/other/g_z_level.dart';
import 'package:graphify/src/core/models/styles/g_border_style.dart';
import 'package:graphify/src/core/models/styles/g_item_style.dart';
import 'package:graphify/src/core/models/styles/g_line_style.dart';
import 'package:graphify/src/core/models/styles/g_shadow_style.dart';
import 'package:graphify/src/core/models/styles/g_text_style.dart';
import 'package:graphify/src/core/models/interface.dart';



class GLegend extends GraphifyModel {

  const GLegend({
    super.id,
    super.show = true,
    this.zLevel = const GZLevel(z: 2),
    this.width = 'auto',
    this.height = 'auto',
    this.padding = 5,
    this.itemGap = 10,
    this.itemWidth = 25,
    this.itemHeight = 14,
    this.selectedMode = true,
    this.orient = GLegendOrient.horizontal,
    this.align = GLegendAlign.auto,
    this.type = GLegendType.plain,
    this.itemStyle = const GItemStyle(),
    this.textStyle = const GTextStyle(
      fontSize: 12,
      fontWeight: GFontWeight.normal,
      backgroundColor: 'transparent',
    ),
    this.lineStyle = const GLineStyle(),
    this.position = const GPosition(left: 'center'),
    this.backgroundColor = 'transparent',
    this.symbolRotate = 'inherit',
    this.inactiveColor = '#ccc',
    this.inactiveBorderColor = '#ccc',
    this.inactiveBorderWidth = 'auto',
    this.data,
    this.selected,
    this.formatter,
    this.icon,
    this.pageFormatter = '{current}/{total}',
    this.pageButtonItemGap = 5,
    this.pageButtonGap,
    this.pageButtonPosition = 'end',
    this.scrollDataIndex = 0,
    this.shadowStyle,
    this.borderStyle,
    this.pageIcons,
    this.pageIconColor = '#2f4554',
    this.pageIconInactiveColor = '#aaa',
    this.pageIconSize = 15,
    this.pageTextStyle = const GTextStyle(
        color: '#333',
        backgroundColor: 'transparent'
    ),
    this.animation = const GAnimation(
      animation: true,
      durationUpdate: 800,
    ),
    this.selector,
    this.selectorPosition = 'end',
    this.selectorItemGap = 7,
    this.selectorButtonGap = 10,
    // this.emphasis = const GEmphasis(),
  });


  /// Type of legend.
  ///
  /// Optional values:
  /// '[LegendType.plain]': Simple legend. (default)
  /// '[LegendType.scroll]': Scrollable legend. It helps when too many legend items needed to be shown.
  final GLegendType type;


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
  final GLegendOrient orient;


  /// Legend marker and text aligning.
  ///
  /// By default, it automatically calculates from component location and orientation.
  /// When left value of this component is '[GLegendAlign.right]', and the vertical layout ([orient] is '[GLegendOrient.vertical]'), it would be aligned to '[GLegendAlign.right]'.
  /// Option:
  /// '[GLegendAlign.auto]'
  /// '[GLegendAlign.left]'
  /// '[GLegendAlign.right]'
  final GLegendAlign align;


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


  /// Legend line style.
  ///
  /// If its children have values as 'inherit', the values are inherited from corresponding series options.
  final GLineStyle lineStyle;


  /// Legend item style.
  ///
  /// If its children have values as 'inherit', the values are inherited from corresponding series options.
  final GItemStyle itemStyle;


  /// Rotation of the symbol, which can be number | 'inherit'. If it's 'inherit', symbolRotate of the series will be used.
  final String symbolRotate;


  /// Formatter is used to format label of legend.
  final String? formatter;


  /// Selected mode of legend, which controls whether series can be toggled displaying by clicking legends.
  ///
  /// It is enabled by default, and you may set it to be false to disable it.
  /// Besides, it can be set to 'single' or 'multiple', for single selection and multiple selection.
  final bool selectedMode;


  /// Legend color when not selected.
  final String inactiveColor;


  /// Legend border color when not selected.
  final String inactiveBorderColor;


  /// Legend border width when not selected.
  ///
  /// If it is '[auto]', the border width is set to be 2 if there is border width in the series, 0 else wise.
  /// If it is '[inherit]', it always takes the border width of the series.
  final String inactiveBorderWidth;


  /// State table of selected legend.
  ///
  /// example:
  /// selected: {
  ///     // selected 'series 1'
  ///     'series 1': true,
  ///     // unselected 'series 2'
  ///     'series 2': false
  /// }
  final Map<String, bool>? selected;


  /// Legend text style.
  final GTextStyle textStyle;


  /// Icon of the legend items.
  ///
  /// Icon types provided by ECharts includes
  /// 'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow', 'none'
  ///
  /// It can be set to an image with 'image://url' , in which URL is the link to an image, or dataURI of an image.
  /// An image URL example:
  /// 'image://http://example.website/a/b.png'
  ///
  /// A dataURI example:
  /// 'image://data:image/gif;base64,R0lGODlhEAAQAMQAAORHHOVSKudfOulrSOp3WOyDZu6QdvCchPGolfO0o/XBs/fNwfjZ0frl3/zy7////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAkAABAALAAAAAAQABAAAAVVICSOZGlCQAosJ6mu7fiyZeKqNKToQGDsM8hBADgUXoGAiqhSvp5QAnQKGIgUhwFUYLCVDFCrKUE1lBavAViFIDlTImbKC5Gm2hB0SlBCBMQiB0UjIQA7'
  /// Icons can be set to arbitrary vector path via 'path://' in ECharts. As compared with a raster image, vector paths prevent jagging and blurring when scaled, and have better control over changing colors. The size of the vector icon will be adapted automatically. Refer to SVG PathData for more information about the format of the path. You may export vector paths from tools like Adobe
  ///
  /// For example:
  /// 'path://M30.9,53.2C16.8,53.2,5.3,41.7,5.3,27.6S16.8,2,30.9,2C45,2,56.4,13.5,56.4,27.6S45,53.2,30.9,53.2z M30.9,3.5C17.6,3.5,6.8,14.4,6.8,27.6c0,13.3,10.8,24.1,24.101,24.1C44.2,51.7,55,40.9,55,27.6C54.9,14.4,44.1,3.5,30.9,3.5z M36.9,35.8c0,0.601-0.4,1-0.9,1h-1.3c-0.5,0-0.9-0.399-0.9-1V19.5c0-0.6,0.4-1,0.9-1H36c0.5,0,0.9,0.4,0.9,1V35.8z M27.8,35.8 c0,0.601-0.4,1-0.9,1h-1.3c-0.5,0-0.9-0.399-0.9-1V19.5c0-0.6,0.4-1,0.9-1H27c0.5,0,0.9,0.4,0.9,1L27.8,35.8L27.8,35.8z'
  final String? icon;


  /// Data array of legend.
  ///
  /// An array item is usually a name representing string. (If it is a pie chart, it could also be the name of a single data in the pie chart) of a series. Legend component would automatically calculate the color and icon according to series. Special string '' (null string) or '\n' (new line string) can be used for a new line.
  /// If data is not specified, it will be auto collected from series. For most of series, it will be collected from series.name or the dimension name specified by seriesName of series.encode. For some types of series like pie and funnel, it will be collected from the name field of series.data.
  ///
  /// If you need to set the style for a single item, you may also set the configuration of it. In this case, name attribute is used to represent name of series.
  ///
  /// Example:
  ///
  /// data: [{
  ///     name: 'series 1',
  ///     // compulsorily set icon as a circle
  ///     icon: 'circle',
  ///     // set up the text in red
  ///     textStyle: {
  ///         color: 'red'
  ///     }
  /// }]
  /// Properties
  /// { name , icon , itemStyle , lineStyle , inactiveColor , inactiveBorderColor , inactiveBorderWidth , symbolRotate , textStyle }
  final List? data;



  /// Background color of legend, which is transparent by default.
  final String backgroundColor;


  /// Legend border style.
  final GBorderStyle? borderStyle;


  /// Shadow style of legend.
  final GShadowStyle? shadowStyle;


  /// It works when [type] is '[GLegendType.scroll]'.
  /// [dataIndex] of the left top most displayed item.
  ///
  /// Although the scrolling of legend items can be controlled by calling setOption and specifying this property,
  /// we suggest that do not control legend in this way unless necessary (setOption might be time-consuming),
  /// but just use action legendScroll to do that.
  final int scrollDataIndex;


  /// It works when [type] is '[GLegendType.scroll]'.
  ///
  /// The gap between page buttons and page info text.
  /// See vertically scrollable legend or horizontally scrollable legend.
  final int pageButtonItemGap;


  /// It works when [type] is '[GLegendType.scroll]'.
  ///
  /// The gap between page buttons and legend items.
  final int? pageButtonGap;


  /// It works when [type] is '[GLegendType.scroll]'.
  ///
  /// The position of page buttons and page info.
  /// Optional values:
  /// 'start': on the left or top.
  /// 'end': on the right or bottom.
  final String pageButtonPosition;


  /// It works when [type] is '[GLegendType.scroll]'.
  ///
  /// Page info formatter. It is '{current}/{total}' by default, where {current} is current page number (start from 1), and {total} is the total page number.
  final String? pageFormatter;


  /// It works when [type] is '[GLegendType.scroll]'.
  ///
  /// The icons of page buttons.
  final Map<String, List>? pageIcons;


  /// It works when [type] is '[GLegendType.scroll]'.
  ///
  /// The color of page buttons.
  final String pageIconColor;


  /// It works when [type] is '[GLegendType.scroll]'.
  ///
  /// The color of page buttons when they are inactive.
  final String pageIconInactiveColor;


  /// It works when [type] is '[GLegendType.scroll]'.
  ///
  /// The size of page buttons.
  /// It can be a number, or an array, like [10, 3], represents [width, height].
  final dynamic pageIconSize;


  /// It works when [type] is '[GLegendType.scroll]'.
  ///
  /// The text style of page info.
  final GTextStyle pageTextStyle;


  /// Whether to use animation when page scrolls.
  final GAnimation animation;


  // /// Highlight style of the graphic.
  // final GEmphasis emphasis;


  /// The selector button in the legend component. Currently, there are two types of button:
  ///
  /// [all]: Select All
  /// [inverse]: Inverse Selection
  /// The selector button doesn't display by default, you need to enable it manually as follows.
  final dynamic selector;


  /// The position of the selector button, which can be placed at the end or start of the legend component,
  /// the corresponding values are 'end' and 'start'.
  ///
  /// By default, when the legend is laid out horizontally, the selector is placed at the end of it, and when the legend is laid out vertically,
  /// the selector is placed at the start of it.
  final String selectorPosition;


  /// The gap between the selector button.
  final int selectorItemGap;


  /// The gap between selector button and legend component.
  final int selectorButtonGap;



  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'show': show,
      'width': width,
      'height': height,
      'orient': orient.name,
      'align': align.name,
      'padding': padding,
      'itemGap': itemGap,
      'itemWidth': itemWidth,
      'itemHeight': itemHeight,
      'lineStyle': lineStyle.toJson(),
      'type': type.name,
      // 'itemStyle': itemStyle.toJson(),
      'textStyle': textStyle.toJson(),
      'backgroundColor': backgroundColor,
      'symbolRotate': symbolRotate,
      'inactiveColor': inactiveColor,
      'inactiveBorderColor': inactiveBorderColor,
      'inactiveBorderWidth': inactiveBorderWidth,
      'selectedMode': selectedMode,
      'selected': selected,
      'data': data,
      'scrollDataIndex': scrollDataIndex,
      'pageButtonItemGap': pageButtonItemGap,
      'pageButtonGap': pageButtonGap,
      'pageButtonPosition': pageButtonPosition,
      'pageFormatter': pageFormatter,
      'pageIcons': pageIcons,
      'pageIconColor': pageIconColor,
      'pageIconInactiveColor': pageIconInactiveColor,
      'pageIconSize': pageIconSize,
      'pageTextStyle': pageTextStyle.toJson(),
      'selector': selector,
      'selectorPosition': selectorPosition,
      'selectorItemGap': selectorItemGap,
      'selectorButtonGap': selectorButtonGap,
      ...animation.toJson(),
      ...?zLevel?.toJson(),
      ...position.toJson(),
      ...?shadowStyle?.toJson(),
      ...?borderStyle?.toJson(),
    };
  }


}