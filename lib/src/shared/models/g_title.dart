import 'package:graphify/src/core/utils/colors.dart';
import 'package:graphify/src/shared/enums/enums.dart';
import 'package:graphify/src/shared/enums/g_text_enums.dart';
import 'package:graphify/src/shared/models/interface.dart';
import 'package:graphify/src/shared/models/other/g_position.dart';
import 'package:graphify/src/shared/models/other/g_z_level.dart';
import 'package:graphify/src/shared/models/styles/g_border_style.dart';
import 'package:graphify/src/shared/models/styles/g_shadow_style.dart';
import 'package:graphify/src/shared/models/styles/g_text_style.dart';

class GTitle extends GraphifyModel {

  const GTitle({
    super.id,
    super.show = true,
    this.text = '',
    this.link = '',
    this.target = GTarget.blank,
    this.subText = '',
    this.subLink = '',
    this.subTarget = GTarget.blank,
    this.textAlign = GTextAlign.auto,
    this.textAlignVertical = GTextAlignVertical.auto,
    this.triggerEvent = false,
    this.padding = 5,
    this.itemGap = 10,
    this.backgroundColor = GColors.transparent,
    this.textStyle = const GTextStyle(
      color: GColors.primary,
      fontSize: 18,
      fontWeight: GFontWeight.bolder,
    ),
    this.subTextStyle = const GTextStyle(),
    this.shadowStyle,
    this.borderStyle,
    this.position = const GPosition(),
    this.zLevel = const GZLevel(z: 2),
  });

  /// The main title text, supporting for \n for newlines.
  final String text;


  /// The hyper link of main title text.
  final String link;


  /// Open the hyper link of main title in specified tab.
  ///
  /// options:
  /// '[GTarget.self]' opening it in current tab
  /// '[GTarget.blank]' opening it in a new tab
  final GTarget target;


  /// Subtitle text, supporting for \n for newlines.
  final String subText;


  /// The hyper link of subtitle text.
  final String subLink;


  /// Open the hyper link of subtitle in specified tab, options:
  ///
  /// options:
  /// '[GTarget.self]' opening it in current tab
  /// '[GTarget.blank]' opening it in a new tab
  final GTarget subTarget;


  /// The horizontal align of the component (including "text" and "subtext").
  ///
  /// Options are:
  /// '[GTextAlign.auto]'
  /// '[GTextAlign.left]'
  /// '[GTextAlign.center]'
  /// '[GTextAlign.right]'
  final GTextAlign textAlign;


  /// The vertical align of the component (including "text" and "subtext").
  ///
  /// Options are:
  /// '[GTextAlignVertical.auto]'
  /// '[GTextAlignVertical.top]'
  /// '[GTextAlignVertical.middle]'
  /// '[GTextAlignVertical.bottom]'
  final GTextAlignVertical textAlignVertical;


  /// Set this to true to enable triggering events
  final bool triggerEvent;


  /// Title space around content.
  ///
  /// The unit is px. Default values for each position are 5. And they can be set to different values with left, right, top, and bottom.
  /// Examples:
  /// // Set padding to be 5
  /// padding: 5
  /// // Set the top and bottom paddings to be 5, and left and right paddings to be 10
  /// padding: [5, 10]
  /// // Set each of the four paddings separately
  /// padding: [
  ///     5,  // up
  ///     10, // right
  ///     5,  // down
  ///     10, // left
  /// ]
  final dynamic padding;


  /// The gap between the main title and subtitle.
  final int itemGap;


  /// Distance between title component of the container
  final GPosition position;


  /// Background color of title, which is transparent by default.
  ///
  /// Color can be represented in RGB, for example 'rgb(128, 128, 128)'. RGBA can be used when you need alpha channel, for example 'rgba(128, 128, 128, 0.5)'.
  /// You may also use hexadecimal format, for example '#ccc'.
  final String backgroundColor;


  /// Border style of title.
  final GBorderStyle? borderStyle;


  /// Shadow style of title.
  final GShadowStyle? shadowStyle;


  /// The text style of title.
  /// It works as the style of main title and subtitle by default.
  final GTextStyle? textStyle;


  /// The text style of subtitle.
  /// It works as the style of main title and subtitle by default.
  final GTextStyle? subTextStyle;


  /// [zLevel] value of all graphical elements in .
  final GZLevel zLevel;


  GTitle copyWith({
    String? id,
    bool? show,
    String? text,
    String? link,
    GTarget? target,
    String? subText,
    String? subLink,
    GTarget? subTarget,
    GTextAlign? textAlign,
    GTextAlignVertical? textAlignVertical,
    bool? triggerEvent,
    int? itemGap,
    GZLevel? zLevel,
    GPosition? position,
    String? backgroundColor,
    String? borderColor,
    int? borderWidth,
    int? borderRadius,
    GShadowStyle? shadowStyle,
    GTextStyle? textStyle,
    GTextStyle? subTextStyle,
    GBorderStyle? borderStyle,
    dynamic padding,
  }) {
    return GTitle(
      id: id ?? this.id,
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
      position: position ?? this.position,
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
      'id': id,
      'show': show,
      'text': text,
      'link': link,
      'target': target.name,
      'subText': subText,
      'subLink': subLink,
      'subTarget': subTarget.name,
      'textAlign': textAlign.name,
      'textAlignVertical': textAlignVertical.name,
      'triggerEvent': triggerEvent,
      'padding': padding,
      'itemGap': itemGap,
      'backgroundColor': backgroundColor,
      'textStyle': textStyle?.toJson(),
      'subTextStyle': subTextStyle?.toJson(),
      ...zLevel.toJson(),
      ...?shadowStyle?.toJson(),
      ...?borderStyle?.toJson(),
      ...position.toJson(),
    };
  }


}