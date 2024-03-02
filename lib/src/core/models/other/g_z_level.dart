
import 'package:graphify/src/core/models/interface.dart';

class GZLevel extends GraphifyModel {

  const GZLevel({
    this.zLevel = 0,
    this.z = 0,
  });


  final int zLevel;
  final int z;

  @override
  Map<String, dynamic> toJson() {
    return {
      'zLevel': zLevel,
      'z': z,
    };
  }
}