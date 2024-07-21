import 'package:graphify/src/shared/enums/g_text_enums.dart';
import 'package:graphify/src/shared/models/interface.dart';
import 'package:graphify/src/shared/models/styles/g_border_style.dart';
import 'package:graphify/src/shared/models/styles/g_shadow_style.dart';

class GTextStyle extends GraphifyModel {

  const GTextStyle({
    super.show = true,
    this.color = '#aaa',
    this.fontStyle = 'normal',
    this.fontWeight = GFontWeight.normal,
    this.fontFamily = 'sans-serif',
    this.fontSize = 12,
    this.lineHeight = 12,
    this.width = 0,
    this.height = 0,
    this.overflow = GTextOverflow.none,
    this.ellipsis = '...',
    this.shadowStyle = const GShadowStyle(),
    this.borderStyle = const GBorderStyle(),
    this.backgroundColor
  });

  /// Text color
  final String color;

  /// Font style.
  ///
  /// Options are:
  ///   '[normal]'
  ///   '[italic]'
  ///   '[oblique]'
  final String fontStyle;

  /// Font thick weight.
  ///
  /// Options are:
  ///   '[GFontWeight.normal]'
  ///   '[GFontWeight.bold]'
  ///   '[GFontWeight.bolder]'
  ///   '[GFontWeight.lighter]'
  ///   [GFontWeight.w100] | [GFontWeight.w200] | [GFontWeight.w300] | [GFontWeight.w400]...
  final GFontWeight fontWeight;


  /// Font family.
  /// Can also be 'serif' , 'monospace', ...
  final String fontFamily;

  /// Font size
  final int fontSize;

  /// Line height of the text fragment.
  final int lineHeight;

  /// Width of text block.
  final int width;

  /// Height of text block.
  final int height;

  /// Determine how to display the text when it's overflow.
  ///
  /// Available when [width] is set.
  /// '[GTextOverflow.truncate]' Truncate the text and trailing with ellipsis.
  /// '[GTextOverflow.breaking]' Break by word
  /// '[GTextOverflow.breakAll]' Break by character.
  final GTextOverflow overflow;

  /// Ellipsis to be displayed when overflow is set to [truncate].
  /// 'truncate' Truncate the overflow lines.
  final String ellipsis;

  /// Shadow style of text.
  final GShadowStyle shadowStyle;

  /// Border style of text.
  final GBorderStyle borderStyle;


  /// Background color of the text fragment.
  ///
  /// Can be color string, like '#123234', 'red', 'rgba(0,23,11,0.3)'.
  /// Or image can be used, for example:
  final String? backgroundColor;


  GTextStyle copyWith({
    bool? show,
    String? color,
    String? fontStyle,
    GFontWeight? fontWeight,
    String? fontFamily,
    int? fontSize,
    int? lineHeight,
    int? width,
    int? height,
    String? textBorderColor,
    int? textBorderWidth,
    String? textBorderType,
    int? textBorderDashOffset,
    GShadowStyle? shadowStyle,
    GBorderStyle? borderStyle,
    GTextOverflow? overflow,
    String? ellipsis,
    String? backgroundColor,
  }) {
    return GTextStyle(
      show: show ?? this.show,
      color: color ?? this.color,
      fontStyle: fontStyle ?? this.fontStyle,
      fontWeight: fontWeight ?? this.fontWeight,
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize ?? this.fontSize,
      lineHeight: lineHeight ?? this.lineHeight,
      width: width ?? this.width,
      height: height ?? this.height,
      borderStyle: borderStyle ?? this.borderStyle,
      shadowStyle: shadowStyle ?? this.shadowStyle,
      overflow: overflow ?? this.overflow,
      ellipsis: ellipsis ?? this.ellipsis,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'show': show,
      'color': color,
      'fontStyle': fontStyle,
      'fontWeight': fontWeight.getName,
      'fontFamily': fontFamily,
      'fontSize': fontSize,
      'lineHeight': lineHeight,
      'width': width,
      'height': height,
      'textBorderColor': borderStyle.color,
      'textBorderWidth': borderStyle.width,
      'textBorderType': borderStyle.type.name,
      'textBorderDashOffset': borderStyle.dashOffset,
      'textShadowColor': shadowStyle.color,
      'textShadowBlur': shadowStyle.blur,
      'textShadowOffsetX': shadowStyle.offsetX,
      'textShadowOffsetY': shadowStyle.offsetY,
      'overflow': overflow.getName,
      'ellipsis': ellipsis,
      'backgroundColor': backgroundColor,
    };
  }

}