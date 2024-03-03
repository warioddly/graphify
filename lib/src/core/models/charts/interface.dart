
import 'dart:ui';

import 'package:graphify/src/core/enums/enums.dart';
import 'package:graphify/src/core/models/animations/g_animation.dart';
import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/other/g_z_level.dart';

abstract class GChartModel extends GraphifyModel {

  const GChartModel({
    this.name,
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
    this.animation,
  });


  String get type;

  final String? name;
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
  final GAnimation? animation;



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
      ...?animation?.toJson(),
    };
  }


}