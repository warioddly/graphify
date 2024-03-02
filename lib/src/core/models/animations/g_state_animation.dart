import 'package:graphify/src/core/models/interface.dart';

class GStateAnimation extends GraphifyModel {

  const GStateAnimation({
    this.duration = 300,
    this.easing = 0,
  });


  final int duration;
  final int easing;


  GStateAnimation copyWith({
    int? duration,
    int? easing,
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