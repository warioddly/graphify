
import 'dart:ui';

import 'package:graphify/src/core/enums/enums.dart';
import 'package:graphify/src/core/models/animations/g_animation.dart';
import 'package:graphify/src/core/models/charts/interface.dart';
import 'package:graphify/src/core/models/other/g_z_level.dart';

class GBarChart extends GChartModel {


  const GBarChart({
    this.name = "12",
    this.colorBy = 'series',
    this.coordinateSystem = 'cartesian2d',
    this.xAxisIndex = 0,
    this.yAxisIndex = 0,
    this.polarIndex = 0,
    this.symbol = 'emptyCircle',
    this.symbolSize = const Size(4, 4),
    this.symbolRotate = 0,
    this.symbolOffset = const Size(0, 0),
    this.symbolKeepAspect = false,
    this.showSymbol = true,
    this.showAllSymbol = true,
    this.legendHoverLink = true,
    this.stack,
    this.stackStrategy = StackStrategy.samesign,
    this.cursor = 'pointer',
    this.connectNulls = false,
    this.clip = true,
    this.triggerLineEvent = false,
    this.step = false,
    this.selectedMode = true,
    this.smooth = false,
    this.smoothMonotone = 'x',
    this.sampling = 'none',
    this.dimensions = const [],
    this.seriesLayoutBy = 'column',
    this.datasetIndex = 0,
    this.dataGroupId,
    this.data = const [],
    this.zLevel = const GZLevel(),
    this.animation = const GAnimation(),
});

  @override
  String get type => 'bar';

  final String name;
  final String colorBy;
  final String coordinateSystem;
  final int xAxisIndex;
  final int yAxisIndex;
  final int polarIndex;
  final String symbol;
  final Size symbolSize;
  final int symbolRotate;
  final Size symbolOffset;
  final bool symbolKeepAspect;
  final bool showSymbol;
  final bool showAllSymbol;
  final bool legendHoverLink;
  final String? stack;
  final StackStrategy stackStrategy;
  final String cursor;
  final bool connectNulls;
  final bool clip;
  final bool triggerLineEvent;
  final bool step;
  final bool selectedMode;
  final bool smooth;
  final String smoothMonotone;
  final String sampling;
  final List<dynamic> dimensions;
  final String seriesLayoutBy;
  final int datasetIndex;
  final String? dataGroupId;
  final List<dynamic> data;
  final GZLevel zLevel;
  final GAnimation animation;


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



  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
      'colorBy': colorBy,
      'coordinateSystem': coordinateSystem,
      'xAxisIndex': xAxisIndex,
      'yAxisIndex': yAxisIndex,
      'polarIndex': polarIndex,
      'symbol': symbol,
      'symbolSize': [symbolSize.width, symbolSize.height],
      'symbolRotate': symbolRotate,
      'symbolOffset': [symbolOffset.width, symbolOffset.height],
      'symbolKeepAspect': symbolKeepAspect,
      'showSymbol': showSymbol,
      'showAllSymbol': showAllSymbol,
      'legendHoverLink': legendHoverLink,
      'stack': stack,
      'stackStrategy': stackStrategy.name,
      'cursor': cursor,
      'connectNulls': connectNulls,
      'clip': clip,
      'triggerLineEvent': triggerLineEvent,
      'step': step,
      'selectedMode': selectedMode,
      'smooth': smooth,
      'smoothMonotone': smoothMonotone,
      'sampling': sampling,
      'dimensions': dimensions,
      'seriesLayoutBy': seriesLayoutBy,
      'datasetIndex': datasetIndex,
      'dataGroupId': dataGroupId,
      'data': data,
      ...zLevel.toJson(),
      ...animation.toJson(),
    };
  }



}