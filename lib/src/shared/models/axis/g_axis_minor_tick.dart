

import 'package:graphify/src/shared/models/interface.dart';
import 'package:graphify/src/shared/models/styles/g_line_style.dart';

class GAxisMinorTick extends GraphifyModel {

  const GAxisMinorTick({
    super.show = false,
    this.splitNumber = 5,
    this.length = 3,
    this.lineStyle = const GLineStyle(color: '#eee'),
  });

  /// Number of interval splited by minor ticks.
  final int splitNumber;

  /// Length of minor ticks lines。
  final int length;

  /// The style of the axis line.
  final GLineStyle lineStyle;


  GAxisMinorTick copyWith({
    bool? show,
    int? splitNumber,
    int? length,
    GLineStyle? lineStyle,
  }) {
    return GAxisMinorTick(
      show: show ?? this.show,
      splitNumber: splitNumber ?? this.splitNumber,
      length: length ?? this.length,
      lineStyle: lineStyle ?? this.lineStyle,
    );
  }


  @override
  Map<String, dynamic> toJson() {
    return {
      'show': show,
      'splitNumber': splitNumber,
      'length': length,
      'lineStyle': lineStyle.toJson(),
    };
  }

}