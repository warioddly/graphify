import 'package:graphify/src/core/models/animations/g_animation.dart';
import 'package:graphify/src/core/models/animations/g_state_animation.dart';
import 'package:graphify/src/core/models/aria/g_aria.dart';
import 'package:graphify/src/core/models/axis/g_axis.dart';
import 'package:graphify/src/core/models/axis/g_axis_pointer.dart';
import 'package:graphify/src/core/models/charts/bar_model.dart';
import 'package:graphify/src/core/models/charts/interface.dart';
import 'package:graphify/src/core/models/decals/g_decal.dart';
import 'package:graphify/src/core/models/interface.dart' as model_interface;
import 'package:graphify/src/core/constants/constants.dart' as constants;
import 'package:graphify/src/core/models/g_title.dart';
import 'package:graphify/src/core/models/other/g_polar.dart';
import 'package:graphify/src/core/models/styles/g_text_style.dart';


class GraphifyModel extends model_interface.GraphifyModel {

  const GraphifyModel({
    this.title,
    this.blendMode = 'source-over',
    this.hoverLayerThreshold = 300,
    this.useUTC = false,
    this.backgroundColor = 'transparent',
    this.color = constants.color,
    this.darkMode = false,
    this.textStyle = const GTextStyle(),
    this.stateAnimation = const GStateAnimation(),
    this.animation = const GAnimation(),
    this.aria = const GAria(),
    this.decal = const GDecal(),
    this.xAxis = const GAxis(
      data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    ),
    this.yAxis = const GAxis(),
    this.axisPointer = const GAxisPointer(),
    this.singleAxis = const GAxis(),
    this.radiusAxis = const GAxis(),
    this.angleAxis = const GAxis(),
    this.series = const [ GBarChart(
      data: [250, 230, 224, 218, 135, 147, 260],
    ) ],
    this.polar = const GPolar(),
  });


  final GTitle? title;
  final String blendMode;
  final int hoverLayerThreshold;
  final bool useUTC;
  final String backgroundColor;
  final List<String> color;
  final GTextStyle textStyle;
  final bool darkMode;
  final GStateAnimation stateAnimation;
  final GAnimation animation;
  final GAria aria;
  final GDecal? decal;
  final GAxis xAxis;
  final GAxis yAxis;
  final GAxisPointer axisPointer;
  final GAxis singleAxis;
  final GAxis radiusAxis;
  final GAxis angleAxis;
  final List<GChartModel> series;
  final GPolar polar;


  @override
  Map<String, dynamic> toJson() {
    return {
      // 'title': title?.toJson(),
      // 'blendMode': blendMode,
      // 'hoverLayerThreshold': hoverLayerThreshold,
      // 'useUTC': useUTC,
      // 'backgroundColor': backgroundColor,
      // 'color': color,
      // 'darkMode': darkMode,
      // 'stateAnimation': stateAnimation.toJson(),
      // 'textStyle': textStyle.toJson(),
      // 'aria': aria.toJson(),
      // 'decal': decal?.toJson(),
      'xAxis': xAxis.toJson(),
      'yAxis': yAxis.toJson(),
      'axisPointer': axisPointer.toJson(),
      'singleAxis': singleAxis.toJson(),
      'radiusAxis': radiusAxis.toJson(),
      'angleAxis': angleAxis.toJson(),
      'series': series.map((e) => e.toJson()).toList(),
      'polar': polar.toJson(),
      // ...animation.toJson(),
    };
  }

}