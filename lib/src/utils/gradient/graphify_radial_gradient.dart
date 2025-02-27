import 'package:graphify/src/utils/gradient/graphify_gradient.dart';

class GraphifyRadialGradient extends GraphifyGradient {

  const GraphifyRadialGradient({
    this.x = .5,
    this.y = .5,
    this.r = .5,
    super.colorStops,
    super.global,
    super.id,
  });

  @override
  String get type => 'radial';

  final num x;
  final num y;
  final num r;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...super.toJson(),
      'x': x,
      'y': y,
      'r': r,
    };
  }
}
