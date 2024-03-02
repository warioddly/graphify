

import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/styles/g_line_style.dart';

class GAxisTick<T> extends GraphifyModel {

  const GAxisTick({
    super.show = true,
    this.alignWithLabel = false,
    this.interval = 0,
    this.inside = false,
    this.length = 5,
    this.lineStyle = const GLineStyle(),
  });


  final bool alignWithLabel;
  final int interval;
  final bool inside;
  final int length;
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