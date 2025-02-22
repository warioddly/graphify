
import 'dart:ui';

import 'package:graphify/src/models/enums/enums.dart';
import 'package:graphify/src/models/animations/g_animation.dart';
import 'package:graphify/src/models/charts/interface.dart';
import 'package:graphify/src/models/other/g_z_level.dart';

class GBarChart extends GChartModel {


  const GBarChart({
    super.name,
    super.colorBy = 'series',
    super.coordinateSystem = 'cartesian2d',
    super.xAxisIndex = 0,
    super.yAxisIndex = 0,
    super.polarIndex = 0,
    super.symbol = 'emptyCircle',
    super.symbolSize = const Size(4, 4),
    super.symbolRotate = 0,
    super.symbolOffset = const Size(0, 0),
    super.symbolKeepAspect = false,
    super.showSymbol = true,
    super.showAllSymbol = true,
    super.legendHoverLink = true,
    super.stack,
    super.stackStrategy = StackStrategy.samesign,
    super.cursor = 'pointer',
    super.connectNulls = false,
    super.clip = true,
    super.triggerLineEvent = false,
    super.step = false,
    super.selectedMode = true,
    super.smooth = false,
    super.smoothMonotone = 'x',
    super.sampling = 'none',
    super.dimensions = const [],
    super.seriesLayoutBy = 'column',
    super.datasetIndex = 0,
    super.dataGroupId,
    super.data = const [],
    super.zLevel = const GZLevel(),
    super.animation = const GAnimation(),
});

  @override
  String get type => 'bar';

  GBarChart copyWith({
    String? name,
    String? colorBy,
    String? coordinateSystem,
    int? xAxisIndex,
    int? yAxisIndex,
    int? polarIndex,
    String? symbol,
    Size? symbolSize,
    int? symbolRotate,
    Size? symbolOffset,
    bool? symbolKeepAspect,
    bool? showSymbol,
    bool? showAllSymbol,
    bool? legendHoverLink,
    String? stack,
    StackStrategy? stackStrategy,
    String? cursor,
    bool? connectNulls,
    bool? clip,
    bool? triggerLineEvent,
    bool? step,
    bool? selectedMode,
    bool? smooth,
    String? smoothMonotone,
    String? sampling,
    List<dynamic>? dimensions,
    String? seriesLayoutBy,
    int? datasetIndex,
    String? dataGroupId,
    List<dynamic>? data,
    GZLevel? zLevel,
    GAnimation? animation,
  }) {
    return GBarChart(
      name: name ?? this.name,
      colorBy: colorBy ?? this.colorBy,
      coordinateSystem: coordinateSystem ?? this.coordinateSystem,
      xAxisIndex: xAxisIndex ?? this.xAxisIndex,
      yAxisIndex: yAxisIndex ?? this.yAxisIndex,
      polarIndex: polarIndex ?? this.polarIndex,
      symbol: symbol ?? this.symbol,
      symbolSize: symbolSize ?? this.symbolSize,
      symbolRotate: symbolRotate ?? this.symbolRotate,
      symbolOffset: symbolOffset ?? this.symbolOffset,
      symbolKeepAspect: symbolKeepAspect ?? this.symbolKeepAspect,
      showSymbol: showSymbol ?? this.showSymbol,
      showAllSymbol: showAllSymbol ?? this.showAllSymbol,
      legendHoverLink: legendHoverLink ?? this.legendHoverLink,
      stack: stack ?? this.stack,
      stackStrategy: stackStrategy ?? this.stackStrategy,
      cursor: cursor ?? this.cursor,
      connectNulls: connectNulls ?? this.connectNulls,
      clip: clip ?? this.clip,
      triggerLineEvent: triggerLineEvent ?? this.triggerLineEvent,
      step: step ?? this.step,
      selectedMode: selectedMode ?? this.selectedMode,
      smooth: smooth ?? this.smooth,
      smoothMonotone: smoothMonotone ?? this.smoothMonotone,
      sampling: sampling ?? this.sampling,
      dimensions: dimensions ?? this.dimensions,
      seriesLayoutBy: seriesLayoutBy ?? this.seriesLayoutBy,
      datasetIndex: datasetIndex ?? this.datasetIndex,
      dataGroupId: dataGroupId ?? this.dataGroupId,
      data: data ?? this.data,
      zLevel: zLevel ?? this.zLevel,
      animation: animation ?? this.animation,
    );
  }


}