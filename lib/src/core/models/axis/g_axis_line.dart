

import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/styles/g_line_style.dart';

class GAxisLine extends GraphifyModel {

  const GAxisLine({
    super.show = true,
    this.onZero = true,
    this.symbol = const ['none', 'none'],
    this.symbolSize = const [10, 15],
    this.symbolOffset = const [0, 0],
    this.onZeroAxisIndex = 0,
    this.lineStyle = const GLineStyle(),
  });


  /// Specifies whether X or Y axis lies on the other's origin position, where value is 0 on axis. Valid only if the other axis is of value type, and contains 0 value.
  final bool onZero;

  /// Symbol of the two ends of the axis.
  /// representing the two ends separately. It's set to be ['none', 'none'] by default, meaning no arrow for either end. If it is set to be ['arrow', 'arrow'],
  /// there shall be two arrows.
  /// If there should only one arrow at the end, it should set to be ['none', 'arrow'].
  final List<String> symbol;

  /// Size of the arrows at two ends. The first is the width perpendicular to the axis, the next is the width parallel to the axis.
  final List<int> symbolSize;

  /// Arrow offset of axis. If is array, the first number is the offset of the arrow at the beginning, and the second number is the offset of the arrow at the end.
  /// If is number, it means the arrows have the same offset.
  final List<int> symbolOffset;

  /// When multiple axes exists, this option can be used to specify which axis can be "onZero" to.
  final int onZeroAxisIndex;
  final GLineStyle lineStyle;


  GAxisLine copyWith({
    bool? show,
    bool? onZero,
    List<String>? symbol,
    List<int>? symbolSize,
    List<int>? symbolOffset,
    int? onZeroAxisIndex,
    GLineStyle? lineStyle,
  }) {
    return GAxisLine(
      show: show ?? this.show,
      onZero: onZero ?? this.onZero,
      symbol: symbol ?? this.symbol,
      symbolSize: symbolSize ?? this.symbolSize,
      symbolOffset: symbolOffset ?? this.symbolOffset,
      onZeroAxisIndex: onZeroAxisIndex ?? this.onZeroAxisIndex,
      lineStyle: lineStyle ?? this.lineStyle,
    );
  }


  @override
  Map<String, dynamic> toJson() {
    return {
      'show': show,
      'onZero': onZero,
      'symbol': symbol,
      'symbolSize': symbolSize,
      'symbolOffset': symbolOffset,
      'onZeroAxisIndex': onZeroAxisIndex,
      'lineStyle': lineStyle.toJson(),
    };
  }

}