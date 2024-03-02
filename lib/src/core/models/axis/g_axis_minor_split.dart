

import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/styles/g_line_style.dart';

class GAxisSplitLine extends GraphifyModel {

  const GAxisSplitLine({
    super.show = true,
    this.interval = 0,
    this.lineStyle = const GLineStyle(),
  });


  final int interval;
  final GLineStyle lineStyle;


  GAxisSplitLine copyWith({
    bool? show,
    int? interval,
    GLineStyle? lineStyle,
  }) {
    return GAxisSplitLine(
      show: show ?? this.show,
      interval: interval ?? this.interval,
      lineStyle: lineStyle ?? this.lineStyle,
    );
  }


  @override
  Map<String, dynamic> toJson() {
    return {
      'show': show,
      'interval': interval,
      'lineStyle': lineStyle.toJson(),
    };
  }

}