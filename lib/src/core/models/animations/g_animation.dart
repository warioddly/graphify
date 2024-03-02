

import 'package:graphify/src/core/models/interface.dart';

class GAnimation extends GraphifyModel {

  const GAnimation({
    this.animation = true,
    this.animationThreshold = 2000,
    this.animationDuration = 1000,
    this.animationEasing = 'cubicOut',
    this.animationDelay = 0,
    this.animationDurationUpdate = 300,
    this.animationEasingUpdate = 'cubicOut',
    this.animationDelayUpdate = 0,
  });

  final bool animation;
  final int animationThreshold;
  final int animationDuration;
  final String animationEasing;
  final int animationDelay;
  final int animationDurationUpdate;
  final String animationEasingUpdate;
  final int animationDelayUpdate;

  @override
  Map<String, dynamic> toJson() {
    return {
      'animation': animation,
      'animationThreshold': animationThreshold,
      'animationDuration': animationDuration,
      'animationEasing': animationEasing,
      'animationDelay': animationDelay,
      'animationDurationUpdate': animationDurationUpdate,
      'animationEasingUpdate': animationEasingUpdate,
      'animationDelayUpdate': animationDelayUpdate,
    };
  }

}