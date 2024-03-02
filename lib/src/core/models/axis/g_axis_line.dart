

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


  final bool onZero;
  final List<String> symbol;
  final List<int> symbolSize;
  final List<int> symbolOffset;
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