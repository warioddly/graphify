import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/styles/g_border_style.dart';
import 'package:graphify/src/core/models/styles/g_shadow_style.dart';

class GTextStyle extends GraphifyModel {

  const GTextStyle({
    this.color = '#aaa',
    this.fontStyle = 'normal',
    this.fontWeight = 'normal',
    this.fontFamily = 'sans-serif',
    this.fontSize = 12,
    this.align,
    this.verticalAlign,
    this.lineHeight,
    this.width,
    this.height,
    this.overflow = 'none',
    this.ellipsis = '...',
    this.shadowStyle = const GShadowStyle(),
    this.borderStyle = const GBorderStyle(),
  });

  final String? color;
  final String? fontStyle;
  final String? fontWeight;
  final String? fontFamily;
  final int? fontSize;
  final String? align;
  final String? verticalAlign;
  final int? lineHeight;
  final int? width;
  final int? height;
  final String? overflow;
  final String? ellipsis;
  final GShadowStyle shadowStyle;
  final GBorderStyle borderStyle;


  GTextStyle copyWith({
    String? color,
    String? fontStyle,
    String? fontWeight,
    String? fontFamily,
    int? fontSize,
    String? align,
    String? verticalAlign,
    int? lineHeight,
    int? width,
    int? height,
    String? textBorderColor,
    int? textBorderWidth,
    String? textBorderType,
    int? textBorderDashOffset,
    GShadowStyle? shadowStyle,
    GBorderStyle? borderStyle,
    String? overflow,
    String? ellipsis,
  }) {
    return GTextStyle(
      color: color ?? this.color,
      fontStyle: fontStyle ?? this.fontStyle,
      fontWeight: fontWeight ?? this.fontWeight,
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize ?? this.fontSize,
      align: align ?? this.align,
      verticalAlign: verticalAlign ?? this.verticalAlign,
      lineHeight: lineHeight ?? this.lineHeight,
      width: width ?? this.width,
      height: height ?? this.height,
      borderStyle: borderStyle ?? this.borderStyle,
      shadowStyle: shadowStyle ?? this.shadowStyle,
      overflow: overflow ?? this.overflow,
      ellipsis: ellipsis ?? this.ellipsis,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'fontStyle': fontStyle,
      'fontWeight': fontWeight,
      'fontFamily': fontFamily,
      'fontSize': fontSize,
      'align': align,
      'verticalAlign': verticalAlign,
      'lineHeight': lineHeight,
      'width': width,
      'height': height,
      'textBorderColor': borderStyle.color,
      'textBorderWidth': borderStyle.width,
      'textBorderType': borderStyle.type,
      'textBorderDashOffset': borderStyle.dashOffset,
      'textShadowColor': shadowStyle.color,
      'textShadowBlur': shadowStyle.blur,
      'textShadowOffsetX': shadowStyle.offsetX,
      'textShadowOffsetY': shadowStyle.offsetY,
      'overflow': overflow,
      'ellipsis': ellipsis,
    };
  }

}