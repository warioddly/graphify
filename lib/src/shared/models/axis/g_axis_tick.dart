

import 'package:graphify/src/shared/models/interface.dart';
import 'package:graphify/src/shared/models/styles/g_line_style.dart';

class GAxisTick<T> extends GraphifyModel {

  const GAxisTick({
    super.show = true,
    this.alignWithLabel = false,
    this.interval = 0,
    this.inside = false,
    this.length = 5,
    this.lineStyle = const GLineStyle(),
  });

  /// Align axis tick with label, which is available only when boundaryGap is set to be true in category axis. See the following picture:
  /// https://echarts.apache.org/en/documents/asset/img/axis-align-with-label.png
  final bool alignWithLabel;

  /// Interval of axisTick, which is available in category axis. is set to be the same as axisLabel.interval by default.
  /// It uses a strategy that labels do not overlap by default.
  /// You may set it to be 0 to display all labels compulsively.
  /// If it is set to be 1, it means that labels are shown once after one label. And if it is set to be 2, it means labels are shown once after two labels,
  /// and so on.
  final int interval;

  /// Set this to true so the axis labels face the inside direction.
  final bool inside;

  /// The length of the axis tick.
  final int length;

  /// Line style of axis ticks.
  final GLineStyle lineStyle;


  GAxisTick copyWith({
    bool? show,
    bool? alignWithLabel,
    int? interval,
    bool? inside,
    int? length,
    GLineStyle? lineStyle,
  }) {
    return GAxisTick(
      show: show ?? this.show,
      alignWithLabel: alignWithLabel ?? this.alignWithLabel,
      interval: interval ?? this.interval,
      inside: inside ?? this.inside,
      length: length ?? this.length,
      lineStyle: lineStyle ?? this.lineStyle,
    );
  }



  @override
  Map<String, dynamic> toJson() {
    return {
      'show': show,
      'alignWithLabel': alignWithLabel,
      'interval': interval,
      'inside': inside,
      'length': length,
      'lineStyle': lineStyle.toJson(),
    };
  }

}