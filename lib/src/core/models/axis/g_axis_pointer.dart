

import 'package:graphify/src/core/models/axis/g_axis_handle.dart';
import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/other/g_z_level.dart';
import 'package:graphify/src/core/models/styles/g_line_style.dart';
import 'package:graphify/src/core/models/styles/g_shadow_style.dart';
import 'package:graphify/src/core/models/styles/g_text_style.dart';

class GAxisPointer extends GraphifyModel {

  const GAxisPointer({
    super.show = false,
    this.type = 'line',
    this.snap = 'false',
    this.z = const GZLevel(),
    this.triggerEmphasis = true,
    this.triggerTooltip = true,
    this.value = 0,
    this.status = true,
    this.label = const GTextStyle(),
    this.lineStyle = const GLineStyle(),
    this.shadowStyle = const GShadowStyle(),
    this.handle = const GAxisHandle(),
  });


  final String type;
  final String snap;
  final GZLevel z;
  final bool triggerEmphasis;
  final bool triggerTooltip;
  final int value;
  final bool status;
  final GTextStyle label;
  final GLineStyle lineStyle;
  final GShadowStyle shadowStyle;
  final GAxisHandle handle;


  GAxisPointer copyWith({
    bool? show,
    String? type,
    String? snap,
    GZLevel? z,
    bool? triggerTooltip,
    bool? triggerEmphasis,
    int? value,
    bool? status,
    GTextStyle? label,
    GLineStyle? lineStyle,
    GShadowStyle? shadowStyle,
    GAxisHandle? handle,
  }) {
    return GAxisPointer(
      show: show ?? this.show,
      type: type ?? this.type,
      snap: snap ?? this.snap,
      z: z ?? this.z,
      triggerTooltip: triggerTooltip ?? this.triggerTooltip,
      triggerEmphasis: triggerEmphasis ?? this.triggerEmphasis,
      value: value ?? this.value,
      status: status ?? this.status,
      label: label ?? this.label,
      lineStyle: lineStyle ?? this.lineStyle,
      shadowStyle: shadowStyle ?? this.shadowStyle,
      handle: handle ?? this.handle,
    );
  }


  @override
  Map<String, dynamic> toJson() {
    return {
      'show': show,
      'type': type,
      'snap': snap,
      'z': z.z,
      'triggerTooltip': triggerTooltip,
      'triggerEmphasis': triggerEmphasis,
      'value': value,
      'status': status,
      'label': label.toJson(),
      'lineStyle': lineStyle.toJson(),
      'shadowStyle': shadowStyle.toJson(),
      'handle': handle.toJson(),
    };
  }

}