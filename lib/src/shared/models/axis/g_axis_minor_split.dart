

import 'package:graphify/src/shared/models/interface.dart';
import 'package:graphify/src/shared/models/styles/g_line_style.dart';

class GAxisSplitLine extends GraphifyModel {

  const GAxisSplitLine({
    super.show = true,
    this.interval = 0,
    this.lineStyle = const GLineStyle(
      color: '#ccc',
      width: 1,
      type: 'solid',
    ),
  });


  /// Set [show] to false to prevent the splitLine from showing. value type axes are shown by default, while category type axes are hidden.
  ///
  /// Interval of Axis splitLine, which is available in category axis. is set to be the same as [interval] by default.
  /// It uses a strategy that labels do not overlap by default.
  /// You may set it to be 0 to display all labels compulsively.
  /// If it is set to be 1, it means that labels are shown once after one label. And if it is set to be 2, it means labels are shown once after two labels,
  /// and so on.
  final int interval;

  /// The style of the axis line.
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