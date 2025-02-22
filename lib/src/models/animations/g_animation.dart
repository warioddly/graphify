

import 'package:graphify/src/models/enums/g_chart_enums.dart';
import 'package:graphify/src/models/interface.dart';

class GAnimation extends GraphifyModel {

  const GAnimation({
    this.animation = true,
    this.threshold = 2000,
    this.duration = 1000,
    this.easing = GEasing.cubicOut,
    this.delay = 0,
    this.durationUpdate = 300,
    this.easingUpdate = GEasing.cubicOut,
    this.delayUpdate = 0,
  });

  /// Whether to enable animation.
  final bool animation;

  /// Threshold of data amount to enable animation.
  final int threshold;

  /// Duration of the first animation, which supports callback function for different data to have different animation effect:
  final int duration;

  /// Easing method used for the first animation. Varied easing effects can be found at easing effect example.
  /// https://echarts.apache.org/examples/en/editor.html?c=line-easing
  final GEasing easing;

  /// Delay before updating the first animation, which supports callback function
  /// for different data to have different animation effect.
  final int delay;

  /// Time for animation to complete
  final int durationUpdate;

  /// Easing method used for animation.
  final GEasing easingUpdate;

  /// Delay before updating animation, which supports callback function for
  /// different data to have different animation effects.
  ///
  /// https://echarts.apache.org/examples/en/editor.html?c=bar-animation-delay
  final int delayUpdate;


  GAnimation copyWith({
    bool? animation,
    int? threshold,
    int? duration,
    GEasing? easing,
    int? delay,
    int? durationUpdate,
    GEasing? easingUpdate,
    int? delayUpdate,
  }) {
    return GAnimation(
      animation: animation ?? this.animation,
      threshold: threshold ?? this.threshold,
      duration: duration ?? this.duration,
      easing: easing ?? this.easing,
      delay: delay ?? this.delay,
      durationUpdate: durationUpdate ?? this.durationUpdate,
      easingUpdate: easingUpdate ?? this.easingUpdate,
      delayUpdate: delayUpdate ?? this.delayUpdate,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'animation': animation,
      'animationThreshold': threshold,
      'animationDuration': duration,
      'animationEasing': easing.name,
      'animationDelay': delay,
      'animationDurationUpdate': durationUpdate,
      'animationEasingUpdate': easingUpdate.name,
      'animationDelayUpdate': delayUpdate,
    };
  }

}