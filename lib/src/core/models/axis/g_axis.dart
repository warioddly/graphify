import 'package:graphify/src/core/models/animations/g_animation.dart';
import 'package:graphify/src/core/models/axis/g_axis_line.dart';
import 'package:graphify/src/core/models/axis/g_axis_minor_split.dart';
import 'package:graphify/src/core/models/axis/g_axis_minor_split_line.dart';
import 'package:graphify/src/core/models/axis/g_axis_minor_tick.dart';
import 'package:graphify/src/core/models/axis/g_axis_name_truncate.dart';
import 'package:graphify/src/core/models/axis/g_axis_pointer.dart';
import 'package:graphify/src/core/models/axis/g_axis_tick.dart';
import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/other/g_z_level.dart';
import 'package:graphify/src/core/models/styles/g_text_style.dart';

class GAxis extends GraphifyModel {

  const GAxis({
    super.show = true,
    this.gridIndex = 0,
    this.alignTicks = true,
    this.position = 'bottom',
    this.offset = 0,
    this.type = 'category',
    this.name = '',
    this.nameLocation = 'end',
    this.nameGap = '15',
    this.nameRotate = '0',
    this.inverse = false,
    this.boundaryGap = true,
    this.data = const [],
    this.min = '',
    this.max = '',
    this.scale = false,
    this.splitNumber = 5,
    this.minInterval = 0,
    this.maxInterval = 0,
    this.interval = 0,
    this.logBase = 10,
    this.silent = false,
    this.triggerEvent = false,
    this.nameTextStyle = const GTextStyle(),
    this.nameTruncate = const GAxisNameTruncate(),
    this.axisLine = const GAxisLine(),
    this.axisTick = const GAxisTick(),
    this.minorTick = const GAxisMinorTick(),
    this.splitLine = const GAxisSplitLine(),
    this.minorSplitLine = const GAxisMinorSplitLine(),
    this.animation = const GAnimation(),
    this.zLevel = const GZLevel(),
    this.axisPointer = const GAxisPointer(),
  });


  final int gridIndex;
  final bool alignTicks;
  final String position;
  final int offset;
  final String type;
  final String name;
  final String nameLocation;
  final GTextStyle nameTextStyle;
  final GAxisNameTruncate nameTruncate;
  final String nameGap;
  final String nameRotate;
  final bool inverse;
  final bool boundaryGap;
  final List<String> data;
  final String min;
  final String max;
  final bool scale;
  final int splitNumber;
  final int minInterval;
  final int maxInterval;
  final int interval;
  final int logBase;
  final bool silent;
  final bool triggerEvent;
  final GAxisLine axisLine;
  final GAxisTick axisTick;
  final GAxisMinorTick minorTick;
  final GAxisSplitLine splitLine;
  final GAxisMinorSplitLine minorSplitLine;
  final GAnimation animation;
  final GZLevel zLevel;
  final GAxisPointer axisPointer;


  GAxis copyWith({
    bool? show,
    int? gridIndex,
    bool? alignTicks,
    String? position,
    int? offset,
    String? type,
    String? name,
    String? nameLocation,
    GTextStyle? nameTextStyle,
    GAxisNameTruncate? nameTruncate,
    String? nameGap,
    String? nameRotate,
    bool? inverse,
    bool? boundaryGap,
    List<String>? data,
    String? min,
    String? max,
    bool? scale,
    int? splitNumber,
    int? minInterval,
    int? maxInterval,
    int? interval,
    int? logBase,
    bool? silent,
    bool? triggerEvent,
    GAxisLine? axisLine,
    GAxisTick? axisTick,
    GAxisMinorTick? minorTick,
    GAxisSplitLine? splitLine,
    GAxisMinorSplitLine? minorSplitLine,
    GAnimation? animation,
    GZLevel? zLevel,
    GAxisPointer? axisPointer,
  }) {
    return GAxis(
      show: show ?? this.show,
      gridIndex: gridIndex ?? this.gridIndex,
      alignTicks: alignTicks ?? this.alignTicks,
      position: position ?? this.position,
      offset: offset ?? this.offset,
      type: type ?? this.type,
      name: name ?? this.name,
      nameLocation: nameLocation ?? this.nameLocation,
      nameTextStyle: nameTextStyle ?? this.nameTextStyle,
      nameTruncate: nameTruncate ?? this.nameTruncate,
      nameGap: nameGap ?? this.nameGap,
      nameRotate: nameRotate ?? this.nameRotate,
      inverse: inverse ?? this.inverse,
      boundaryGap: boundaryGap ?? this.boundaryGap,
      data: data ?? this.data,
      min: min ?? this.min,
      max: max ?? this.max,
      scale: scale ?? this.scale,
      splitNumber: splitNumber ?? this.splitNumber,
      minInterval: minInterval ?? this.minInterval,
      maxInterval: maxInterval ?? this.maxInterval,
      interval: interval ?? this.interval,
      logBase: logBase ?? this.logBase,
      silent: silent ?? this.silent,
      triggerEvent: triggerEvent ?? this.triggerEvent,
      axisLine: axisLine ?? this.axisLine,
      axisTick: axisTick ?? this.axisTick,
      minorTick: minorTick ?? this.minorTick,
      splitLine: splitLine ?? this.splitLine,
      minorSplitLine: minorSplitLine ?? this.minorSplitLine,
      animation: animation ?? this.animation,
      zLevel: zLevel ?? this.zLevel,
      axisPointer: axisPointer ?? this.axisPointer,
    );
  }


  @override
  Map<String, dynamic> toJson() {
    return {
      'show': show,
      'gridIndex': gridIndex,
      'alignTicks': alignTicks,
      'position': position,
      'offset': offset,
      'type': type,
      'name': name,
      'nameLocation': nameLocation,
      'nameTextStyle': nameTextStyle.toJson(),
      'nameTruncate': nameTruncate.toJson(),
      'nameGap': nameGap,
      'nameRotate': nameRotate,
      'inverse': inverse,
      'boundaryGap': boundaryGap,
      'data': data,
      'min': min,
      'max': max,
      'scale': scale,
      'splitNumber': splitNumber,
      'minInterval': minInterval,
      'maxInterval': maxInterval,
      'interval': interval,
      'logBase': logBase,
      'silent': silent,
      'triggerEvent': triggerEvent,
      'axisLine': axisLine.toJson(),
      'axisTick': axisTick.toJson(),
      'minorTick': minorTick.toJson(),
      'splitLine': splitLine.toJson(),
      'minorSplitLine': minorSplitLine.toJson(),
      'axisPointer': axisPointer.toJson(),
      ...animation.toJson(),
      ...zLevel.toJson(),
    };
  }

}

