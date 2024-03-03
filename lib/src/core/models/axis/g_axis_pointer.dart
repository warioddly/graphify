import 'package:graphify/src/core/models/axis/g_axis_handle.dart';
import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/styles/g_line_style.dart';
import 'package:graphify/src/core/models/styles/g_shadow_style.dart';
import 'package:graphify/src/core/models/styles/g_text_style.dart';

class GAxisPointer extends GraphifyModel {

  const GAxisPointer({
    super.show = false,
    this.type = 'line',
    this.snap = false,
    this.z,
    this.triggerEmphasis = true,
    this.triggerTooltip = true,
    this.value = 0,
    this.status = true,
    this.label = const GTextStyle(),
    this.lineStyle = const GLineStyle(),
    this.shadowStyle = const GShadowStyle(),
    this.handle = const GAxisHandle(),
  });


  /// Indicator type.
  ///
  /// Options:
  /// '[line]' line indicator.
  /// '[shadow]' shadow crosshair indicator.
  /// '[none]' no indicator displayed.
  final String type;

  /// Whether [snap] to point automatically.
  ///
  /// The default value is auto determined.
  /// This feature usually makes sense in value axis and time axis, where tiny points can be seeked automatically.
  final bool snap;

  /// z value, which controls order of drawing graphical components.
  /// Components with smaller z values may be overwritten by those with larger z values.
  final int? z;

  /// Whether to trigger emphasis of series.
  final bool triggerEmphasis;

  /// Whether to trigger tooltip.
  final bool triggerTooltip;

  /// current [value]. When using [handle], value can be set to define the initial position of axisPointer.
  final int value;

  /// Current status, can be 'show' or 'hide'.
  final bool status;

  /// It is valid when [type] is '[line]'.
  final GLineStyle lineStyle;

  /// It is valid when [type] is '[shadow]'.
  final GShadowStyle shadowStyle;

  /// A button used to drag axisPointer.
  /// This feature is applicable in touch device. See example. https://echarts.apache.org/examples/en/editor.html?c=line-tooltip-touch&edit=1&reset=1
  final GAxisHandle handle;


  final GTextStyle label;


  GAxisPointer copyWith({
    bool? show,
    String? type,
    bool? snap,
    int? z,
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
      'z': z,
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