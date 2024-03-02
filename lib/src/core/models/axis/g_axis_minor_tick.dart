

import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/styles/g_line_style.dart';

class GAxisMinorTick extends GraphifyModel {

  const GAxisMinorTick({
    super.show = true,
    this.splitNumber = 5,
    this.length = 3,
    this.lineStyle = const GLineStyle(),
  });

  final int splitNumber;
  final int length;
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