import 'package:graphify/src/models/interface.dart';
import 'package:graphify/src/models/other/g_z_level.dart';

class GPolar extends GraphifyModel {

  const GPolar({
    this.zLevel = const GZLevel(),
    this.radius = 0,
    this.center = const ['50%', '50%'],
  });


  final GZLevel zLevel;
  final int radius;
  final List<String> center;

  @override
  Map<String, dynamic> toJson() {
    return {
      ...zLevel.toJson(),
      'radius': radius,
      'center': center,
    };
  }
}