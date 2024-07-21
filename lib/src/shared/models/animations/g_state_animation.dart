import 'package:graphify/src/shared/enums/g_chart_enums.dart';
import 'package:graphify/src/shared/models/interface.dart';

class GStateAnimation extends GraphifyModel {

  const GStateAnimation({
    this.duration = 300,
    this.easing = GEasing.cubicOut,
  });


  /// Duration of animation. Animation will be disabled when set to 0.
  final int duration;

  /// Easing of animation.
  final GEasing easing;


  GStateAnimation copyWith({
    int? duration,
    GEasing? easing,
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
      'easing': easing.name,
    };
  }


}