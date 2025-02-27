import 'package:graphify/src/utils/gradient/graphify_gradient.dart';

class GraphifyLinearGradient extends GraphifyGradient {

  const GraphifyLinearGradient({
    this.x = 0,
    this.y = 0,
    this.x2 = 1,
    this.y2 = 0,
    super.colorStops,
    super.global,
    super.id,
  });

  @override
  String get type => 'linear';

  final num x;
  final num y;
  final num x2;
  final num y2;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...super.toJson(),
      'x': x,
      'y': y,
      'x2': x2,
      'y2': y2,
    };
  }

}
