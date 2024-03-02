import 'package:graphify/src/core/models/animations/g_animation.dart';
import 'package:graphify/src/core/models/animations/g_state_animation.dart';
import 'package:graphify/src/core/models/g_aria.dart';
import 'package:graphify/src/core/models/g_decal.dart';
import 'package:graphify/src/core/models/interface.dart' as model_interface;
import 'package:graphify/src/core/constants/constants.dart' as constants;
import 'package:graphify/src/core/models/g_title.dart';
import 'package:graphify/src/core/models/styles/g_text_style.dart';


class GraphifyModel extends model_interface.GraphifyModel {

  const GraphifyModel({
    this.title,
    this.blendMode = 'source-over',
    this.hoverLayerThreshold = 300,
    this.useUTC = false,
    this.backgroundColor = 'transparent',
    this.color = constants.color,
    this.darkMode = false,
    this.textStyle = const GTextStyle(),
    this.stateAnimation = const GStateAnimation(),
    this.animation = const GAnimation(),
    this.aria = const GAria(),
    this.decal = const GDecal(),
  });


  final GTitle? title;
  final String blendMode;
  final int hoverLayerThreshold;
  final bool useUTC;
  final String backgroundColor;
  final List<String> color;
  final GTextStyle textStyle;
  final bool darkMode;
  final GStateAnimation stateAnimation;
  final GAnimation animation;
  final GAria aria;
  final GDecal? decal;


  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title?.toJson(),
      'blendMode': blendMode,
      'hoverLayerThreshold': hoverLayerThreshold,
      'useUTC': useUTC,
      'backgroundColor': backgroundColor,
      'color': color,
      'darkMode': darkMode,
      'stateAnimation': stateAnimation.toJson(),
      'textStyle': textStyle.toJson(),
      'aria': aria.toJson(),
      'decal': decal?.toJson(),
      ...animation.toJson(),
    };
  }

}