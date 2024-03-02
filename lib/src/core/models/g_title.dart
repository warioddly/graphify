import 'package:graphify/src/core/enums/text_align.dart';
import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/other/g_z_level.dart';
import 'package:graphify/src/core/models/styles/g_border_style.dart';
import 'package:graphify/src/core/models/styles/g_shadow_style.dart';
import 'package:graphify/src/core/models/styles/g_text_style.dart';

class GTitle extends GraphifyModel {

  const GTitle({
    this.title,
    super.show = true,
    this.text,
    this.link,
    this.target = 'blank',
    this.subText = '',
    this.subLink = '',
    this.subTarget = 'blank',
    this.textAlign = GTextAlign.auto,
    this.textAlignVertical = GTextAlignVertical.auto,
    this.triggerEvent = false,
    this.padding = 5,
    this.itemGap = 10,
    this.left = 'auto',
    this.bottom = 'auto',
    this.right = 'auto',
    this.top = 'auto',
    this.backgroundColor = 'transparent',
    this.textStyle = const GTextStyle(),
    this.subTextStyle = const GTextStyle(),
    this.shadowStyle = const GShadowStyle(),
    this.borderStyle = const GBorderStyle(),
    this.zLevel = const GZLevel(z: 2),
  });

  final String? title;
  final String? text;
  final String? link;
  final String? target;
  final String? subText;
  final String? subLink;
  final String? subTarget;
  final GTextAlign textAlign;
  final GTextAlignVertical textAlignVertical;
  final bool triggerEvent;
  final dynamic padding;
  final int itemGap;
  final dynamic left;
  final dynamic top;
  final dynamic right;
  final dynamic bottom;
  final dynamic backgroundColor;
  final GTextStyle textStyle;
  final GTextStyle subTextStyle;
  final GShadowStyle shadowStyle;
  final GBorderStyle borderStyle;
  final GZLevel zLevel;


  GTitle copyWith({
    String? title,
    bool? show,
    String? text,
    String? link,
    String? target,
    String? subText,
    String? subLink,
    String? subTarget,
    GTextAlign? textAlign,
    GTextAlignVertical? textAlignVertical,
    bool? triggerEvent,
    dynamic padding,
    int? itemGap,
    GZLevel? zLevel,
    dynamic left,
    dynamic top,
    dynamic right,
    dynamic bottom,
    dynamic backgroundColor,
    dynamic borderColor,
    int? borderWidth,
    int? borderRadius,
    GShadowStyle? shadowStyle,
    GTextStyle? textStyle,
    GTextStyle? subTextStyle,
    GBorderStyle? borderStyle,
  }) {
    return GTitle(
      title: title ?? this.title,
      show: show ?? this.show,
      text: text ?? this.text,
      link: link ?? this.link,
      target: target ?? this.target,
      subText: subText ?? this.subText,
      subLink: subLink ?? this.subLink,
      subTarget: subTarget ?? this.subTarget,
      textAlign: textAlign ?? this.textAlign,
      textAlignVertical: textAlignVertical ?? this.textAlignVertical,
      triggerEvent: triggerEvent ?? this.triggerEvent,
      padding: padding ?? this.padding,
      itemGap: itemGap ?? this.itemGap,
      zLevel: zLevel ?? this.zLevel,
      left: left ?? this.left,
      top: top ?? this.top,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderStyle: borderStyle ?? this.borderStyle,
      shadowStyle: shadowStyle ?? this.shadowStyle,
      textStyle: textStyle ?? this.textStyle,
      subTextStyle: subTextStyle ?? this.subTextStyle,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'show': show,
      'text': text,
      'link': link,
      'target': target,
      'subText': subText,
      'subLink': subLink,
      'subTarget': subTarget,
      'textAlign': textAlign,
      'textAlignVertical': textAlignVertical,
      'triggerEvent': triggerEvent,
      'padding': padding,
      'itemGap': itemGap,
      'left': left,
      'top': top,
      'right': right,
      'bottom': bottom,
      'backgroundColor': backgroundColor,
      'borderDashOffset': borderStyle.dashOffset,
      'borderColor': borderStyle.color,
      'borderWidth': borderStyle.width,
      'borderRadius': borderStyle.radius,
      'textStyle': textStyle.toJson(),
      'subTextStyle': subTextStyle.toJson(),
      ...zLevel.toJson(),
      ...shadowStyle.toJson(),
    };
  }


}