import 'package:graphify/src/core/models/animations/g_animation.dart';
import 'package:graphify/src/core/models/axis/g_axis_data.dart';
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
    super.id,
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
    this.animation,
    this.nameTextStyle = const GTextStyle(),
    this.nameTruncate = const GAxisNameTruncate(),
    this.axisLine = const GAxisLine(),
    this.axisTick = const GAxisTick(),
    this.minorTick = const GAxisMinorTick(),
    this.splitLine = const GAxisSplitLine(),
    this.minorSplitLine = const GAxisMinorSplitLine(),
    this.zLevel = const GZLevel(),
    this.axisPointer = const GAxisPointer(),
  });


  /// The index of grid which the x axis belongs to. Defaults to be in the first grid.
  final int gridIndex;

  /// [alignTicks] turned on to automatically align ticks when multiple numeric x axes. Only available for axes of type 'value' and 'log'.
  final bool alignTicks;

  /// The position of x axis.
  ///
  /// options:
  ///   'top'
  ///   'bottom'
  /// The first x axis in grid defaults to be on the bottom of the grid, and the second x axis is on the other side against the first x axis.
  /// Notice: Set axisLine.onZero to false to activate this option.
  final String position;

  /// Offset of x axis relative to default position. Useful when multiple x axis has same position value.
  /// Notice: Set xAxis.axisLine.onZero to false to activate this option.
  final int offset;

  /// Type of axis.
  ///
  /// Option:
  /// '[value]' Numerical axis, suitable for continuous data.
  /// '[category]' Category axis, suitable for discrete category data. Category data can be auto retrieved from series.data or dataset.source, or can be
  /// specified via xAxis.data.
  /// '[time]' Time axis, suitable for continuous time series data. As compared to value axis, it has a better formatting for time and a different tick
  /// calculation method. For example, it decides to use month, week, day or hour for tick based on the range of span.
  /// '[log]' Log axis, suitable for log data. Stacked bar or line series with type: 'log' axes may lead to significant visual errors and may have unintended
  /// effects in certain circumstances. Their use should be avoided.
  final String type;

  /// Name of axis.
  final String name;

  /// Location of axis name.
  ///
  /// Options:
  /// '[start]'
  /// '[middle]' or '[center]'
  /// '[end]'
  final String nameLocation;

  /// Text style of axis [name].
  final GTextStyle nameTextStyle;

  /// Truncation of the axis name.
  final GAxisNameTruncate nameTruncate;

  /// Gap between axis name and axis line.
  final String nameGap;

  /// Rotation of axis name.
  final String nameRotate;

  /// Set this to true to invert the axis.
  final bool inverse;

  /// The boundary gap on both sides of a coordinate axis.
  ///
  /// The setting and behavior of category axes and non-category axes are different.
  /// The [boundaryGap] of category axis can be set to either true or false. Default value is set to be true, in which case [axisTick] is served only as a
  /// separation line, and labels and data appear only in the center part of two axis ticks, which is called band.
  final bool boundaryGap;

  /// Category data, available in type: 'category' axis.
  ///
  /// If [type] is not specified, but [data] is specified, the [type] is auto set as '[category]'.
  /// If [type] is specified as '[category]', but [data] is not specified, [data] will be auto collected from series.data. It brings convenience, but we
  /// should notice that axis.data provides then value range of the 'category' axis. If it is auto collected from series.data,
  /// Only the values appearing in series.data can be collected. For example, if series.data is empty, nothing will be collected.
  final List<GAxisData> data;

  /// The minimum value of axis.
  ///
  /// It can be set to a special value 'dataMin' so that the minimum value on this axis is set to be the minimum label.
  /// It will be automatically computed to make sure axis tick is equally distributed when not set.
  /// In category axis, it can also be set as the ordinal number. For example, if a catergory axis has data: ['categoryA', 'categoryB', 'categoryC'], and the
  /// ordinal 2 represents 'categoryC'. Moreover, it can be set as negative number, like -3.
  final String min;

  /// The maximum value of axis.
  ///
  /// It can be set to a special value 'dataMax' so that the minimum value on this axis is set to be the maximum label.
  /// It will be automatically computed to make sure axis tick is equally distributed when not set.
  /// In category axis, it can also be set as the ordinal number. For example, if a catergory axis has data: ['categoryA', 'categoryB', 'categoryC'], and the
  /// ordinal 2 represents 'categoryC'. Moreover, it can be set as negative number, like -3.
  final String max;

  /// It is available only in numerical axis, i.e., type: 'value'.
  /// It specifies whether not to contain zero position of axis compulsively.
  /// When it is set to be true, the axis may not contain zero position, which is useful in the scatter chart for both value axes.
  /// This configuration item is unavailable when the [min] and [max] are set.
  final bool scale;

  /// Number of segments that the axis is split into.
  ///
  /// Note that this number serves only as a recommendation, and the true segments may be adjusted based on readability.
  /// This is unavailable for category axis.
  final int splitNumber;

  /// Minimum gap between split lines.
  ///
  /// For example, it can be set to be 1 to make sure axis label is show as integer.
  /// {
  ///     minInterval: 1
  /// }
  /// It is available only for axis of type 'value' or 'time'.
  final int minInterval;

  /// Maximum gap between split lines.
  ///
  /// For example, in time axis (type is 'time'), it can be set to be 3600 * 24 * 1000 to make sure that the gap between axis labels is less than or equal to
  /// one day.
  /// {
  ///     maxInterval: 3600 * 1000 * 24
  /// }
  /// It is available only for axis of type 'value' or 'time'.
  final int maxInterval;

  /// Compulsively set segmentation interval for axis.
  ///
  /// As splitNumber is a recommendation value, the calculated tick may not be the same as expected. In this case, interval should be used along with min and
  /// max to compulsively set tickings. But in most cases, we do not suggest using this, our automatic calculation is enough for most situations.
  /// This is unavailable for category axis. Timestamp should be passed for type: 'time' axis. Logged value should be passed for type: 'log' axis.
  final int interval;

  /// Base of logarithm, which is valid only for numeric axes with type: 'log'.
  final int logBase;

  /// Set this to true, to prevent interaction with the axis.
  final bool silent;

  /// Set this to true to enable triggering events.
  final bool triggerEvent;

  /// Settings related to axis line.
  final GAxisLine axisLine;

  /// Settings related to axis tick.
  final GAxisTick axisTick;

  /// Settings related minor ticks.
  /// Note: [minorTick] is not available in the category type axis.
  final GAxisMinorTick minorTick;

  /// Split line of axis in [grid] area.
  final GAxisSplitLine splitLine;

  /// Minor split lines of axis in the [grid] area。It will align to the [minorTick]
  final GAxisMinorSplitLine minorSplitLine;

  /// Animation settings of the axis.
  final GAnimation? animation;

  /// [zLevel] value of all graphical elements in x|y axis.
  final GZLevel zLevel;

  /// [axisPointer] settings on the axis.
  ///
  /// [axisPointer] will not be displayed by default. But if tooltip.trigger is set as 'axis' or tooltip.axisPointer.type is set as 'cross', axisPointer will
  /// be displayed automatically. Each coordinate system will automatically chose the axes whose will display its axisPointer. tooltip.axisPointer.axis
  /// can be used to change the choice.
  final GAxisPointer axisPointer;


  GAxis copyWith({
    String? id,
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
    List<GAxisData>? data,
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
      id: id ?? this.id,
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
      'id': id,
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
      'data': data.map((e) => e.toJson()).toList(),
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
      ...?animation?.toJson(),
      ...zLevel.toJson(),
    };
  }

}
