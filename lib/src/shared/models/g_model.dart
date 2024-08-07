import 'package:graphify/src/core/utils/colors.dart';
import 'package:graphify/src/shared/enums/g_chart_enums.dart';
import 'package:graphify/src/shared/models/animations/g_animation.dart';
import 'package:graphify/src/shared/models/animations/g_state_animation.dart';
import 'package:graphify/src/shared/models/aria/g_aria.dart';
import 'package:graphify/src/shared/models/axis/g_axis.dart';
import 'package:graphify/src/shared/models/axis/g_axis_pointer.dart';
import 'package:graphify/src/shared/models/charts/interface.dart';
import 'package:graphify/src/shared/models/decals/g_decal.dart';
import 'package:graphify/src/shared/models/interface.dart' as model_interface;
import 'package:graphify/src/shared/models/g_title.dart';
import 'package:graphify/src/shared/models/other/g_polar.dart';
import 'package:graphify/src/shared/models/styles/g_text_style.dart';
import 'package:graphify/src/shared/models/g_grid.dart';
import 'package:graphify/src/shared/models/g_legend.dart';


class GraphifyModel extends model_interface.GraphifyModel {

  const GraphifyModel({
    super.show = true,
    super.id,
    this.useUTC = false,
    this.darkMode = false,
    this.series = const [],
    this.hoverLayerThreshold = 300,
    this.backgroundColor = GColors.transparent,
    this.color = GColors.colors,
    this.blendMode = GBlendMode.sourceOver,
    this.title = const GTitle(),
    this.textStyle = const GTextStyle(),
    this.stateAnimation = const GStateAnimation(),
    this.grid = const GGrid(),
    this.aria = const GAria(),
    this.xAxis = const GAxis(),
    this.yAxis = const GAxis(),
    this.decal = const GDecal(),
    this.singleAxis = const GAxis(),
    this.radiusAxis = const GAxis(),
    this.angleAxis = const GAxis(),
    this.axisPointer = const GAxisPointer(),
    this.polar = const GPolar(),
    this.legend,
    this.animation,
  });


  /// Title component, including main title and subtitle.
  final GTitle title;


  /// Sets the type of compositing operation to apply when drawing a new shape.
  ///
  /// The default is 'source-over'. Support settings for each series.
  /// '[GBlendMode.lighter]' is also a common type of compositing operation.
  ///
  /// In this mode, the area where the number of graphics is concentrated is superimposed into a high-brightness color (white).
  /// It often used to highlight the effect of the area.
  /// See the different type: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/globalCompositeOperation.
  final GBlendMode blendMode;


  /// When the number of element of the whole chart is larger than hoverLayerThreshold, a separate hover layer is used to render hovered elements.
  /// The separate hover layer is used to avoid re-painting the whole canvas when hovering on elements. Instead, the hovered elements are rendered in a
  /// separate layer so that other elements don't have to be rendered again.
  final int hoverLayerThreshold;


  /// Whether to use UTC in display.
  ///
  /// true: When axis.type is 'time', ticks is determined according to UTC, and axisLabel and tooltip use UTC by default.
  /// false: When axis.type is 'time', ticks is determined according to local time, and axisLabel and tooltip use local time by default.
  /// The default value of useUTC is false, for sake of considering:
  ///
  /// In many cases, labels should be displayed in local time (whether the time is stored in server in local time or UTC).
  /// If user uses time string (like '2012-01-02') in data, it usually means local time if time zone is not specified. Time should be displayed in its
  /// original time zone by default.
  /// Notice: the setting only affects "display time", not "parse time". For how time value (like 1491339540396, '2013-01-04', ...) is parsed in echarts,
  /// see the time part in date. https://echarts.apache.org/en/option.html#series-line.data
  final bool useUTC;


  /// Background color. Transparent by default.
  ///
  /// Supports setting as solid color using rgb(255,255,255), rgba(255,255,255,1), #fff, etc.
  /// Also supports setting as gradient color and pattern fill, see
  /// [color] for details
  final String backgroundColor;


  /// The [color] list of palette. If no color is set in series, the colors would be adopted sequentially and circularly from this list as the colors of series.
  ///
  /// Defaults:
  /// ['#5470c6', '#91cc75', '#fac858', '#ee6666', '#73c0de', '#3ba272', '#fc8452', '#9a60b4', '#ea7ccc']
  /// Supported color formats.
  /// Use RGB for colors, like 'rgb(128, 128, 128)', or RGBA if you want to add an alpha channel for opacity, like 'rgba(128, 128, 128, 0.5), or use hex
  /// string, like '#ccc'.
  final List<String> color;


  /// Global font style.
  final GTextStyle textStyle;


  /// To specify whether it's dark mode.
  ///
  /// ECharts will automatically detect it via backgroundColor by default and adjust the text color accordingly.
  /// This option is usually used in themes.
  final bool darkMode;


  /// Animation configurations of state switchment.
  /// Can be configured in each series individually.
  final GStateAnimation stateAnimation;


  /// Animation configuration of chart.
  /// Can be configured in each series individually.
  final GAnimation? animation;


  /// Accessibility configuration.
  final GAria aria;


  /// The x axis in cartesian(rectangular) coordinate.
  ///
  /// Usually a single grid component can place at most 2 x axis, one on the bottom and
  /// another on the top.offset can be used to avoid overlap when you need to put more than two x axis.
  final GAxis xAxis;


  /// The y axis in cartesian(rectangular) coordinate.
  ///
  /// Usually a single grid component can place at most 2 y axis, one on the left and another on the right.
  /// offset can be used to avoid overlap when you need to put more than two y axis.
  final GAxis yAxis;


  /// Legend component.
  ///
  /// Legend component shows symbol, color and name of different series.
  /// You can click legends to toggle displaying series in the chart.
  /// If there have to be too many legend items, vertically scrollable legend or horizontally scrollable legend are options to paginate them
  final GLegend? legend;

  final GGrid grid;
  final GDecal? decal;
  final GAxisPointer axisPointer;
  final GAxis singleAxis;
  final GAxis radiusAxis;
  final GAxis angleAxis;
  final GPolar polar;
  final List<GChartModel> series;


  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'show': show,
      'title': title.toJson(),
      'blendMode': blendMode.name,
      'hoverLayerThreshold': hoverLayerThreshold,
      'useUTC': useUTC,
      'backgroundColor': backgroundColor,
      'color': color,
      'darkMode': darkMode,
      'stateAnimation': stateAnimation.toJson(),
      'textStyle': textStyle.toJson(),
      'aria': aria.toJson(),
      'decal': decal?.toJson(),
      'xAxis': xAxis.toJson(),
      'yAxis': yAxis.toJson(),
      'axisPointer': axisPointer.toJson(),
      'singleAxis': singleAxis.toJson(),
      'radiusAxis': radiusAxis.toJson(),
      'angleAxis': angleAxis.toJson(),
      'series': series.map((e) => e.toJson()).toList(),
      'polar': polar.toJson(),
      'grid': grid.toJson(),
      'tooltip': {},
      'legend': legend?.toJson() ?? {},
      ...?animation?.toJson(),
    };
  }

}