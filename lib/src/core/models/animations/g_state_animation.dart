import 'package:graphify/src/core/models/interface.dart';

class GStateAnimation extends GraphifyModel {

  const GStateAnimation({
    this.duration = 300,
    this.easing = 'cubicOut',
  });


  /// Duration of animation. Animation will be disabled when set to 0.
  final int duration;

  /// Easing of animation.
  final String easing;

  GStateAnimation copyWith({
    int? duration,
    String? easing,
  }) {
    return GStateAnimation(
      duration: duration ?? this.duration,
      easing: easing ?? this.easing,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'duration': duration,
      'easing': easing,
    };
  }


}