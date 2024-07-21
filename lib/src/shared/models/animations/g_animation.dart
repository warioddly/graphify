

import 'package:graphify/src/shared/models/interface.dart';

class GAnimation extends GraphifyModel {

  const GAnimation({
    this.animation = true,
    this.threshold = 2000,
    this.duration = 1000,
    this.easing = 'cubicOut',
    this.delay = 0,
    this.durationUpdate = 300,
    this.easingUpdate = 'cubicOut',
    this.delayUpdate = 0,
  });

  /// Whether to enable animation.
  final bool animation;

  /// Threshold of data amount to enable animation.
  final int threshold;
  final int duration;
  final String easing;
  final int delay;
  final int durationUpdate;
  final String easingUpdate;
  final int delayUpdate;


  GAnimation copyWith({
    bool? animation,
    int? threshold,
    int? duration,
    String? easing,
    int? delay,
    int? durationUpdate,
    String? easingUpdate,
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
      'animationEasing': easing,
      'animationDelay': delay,
      'animationDurationUpdate': durationUpdate,
      'animationEasingUpdate': easingUpdate,
      'animationDelayUpdate': delayUpdate,
    };
  }

}