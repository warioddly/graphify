
import 'package:graphify/src/shared/models/interface.dart';

class GZLevel extends GraphifyModel {

  const GZLevel({
    this.zLevel = 0,
    this.z = 0,
  });

  /// [zLevel] value of all graphical elements in .
  /// [zLevel] is used to make layers with Canvas. Graphical elements with different [zLevel] values will be placed in different Canvases, which is a common
  /// optimization technique. We can put those frequently changed elements (like those with animations) to a separate [zLevel]. Notice that too many Canvases
  /// will increase memory cost, and should be used carefully on mobile phones to avoid crash.
  /// Canvases with bigger [zLevel] will be placed on Canvases with smaller [zLevel].
  final int zLevel;

  /// [z] value of all graphical elements in , which controls order of drawing graphical components. Components with smaller z values may be overwritten by those
  /// with larger [z] values.
  /// [z] has a lower priority to [zLevel], and will not create new Canvas.
  final int z;

  @override
  Map<String, dynamic> toJson() {
    return {
      'zLevel': zLevel,
      'z': z,
    };
  }
}