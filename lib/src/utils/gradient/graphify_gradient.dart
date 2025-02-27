import 'dart:ui';

abstract class GraphifyGradient {
  const GraphifyGradient({
    this.colorStops = const [],
    this.global = false,
    this.id,
  });

  String get type;

  final num? id;
  final List<GraphifyGradientColorStop> colorStops;
  final bool global;

  void addColorStop(num offset, Color color) {
    colorStops.add(
      GraphifyGradientColorStop(
        offset: offset,
        color: color,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (id != null) 'id': id,
      'type': type,
      'colorStops': colorStops.map((e) => e.toJson()).toList(),
      'global': global,
    };
  }
}

class GraphifyGradientColorStop {
  const GraphifyGradientColorStop({
    required this.offset,
    required this.color,
  });

  final num offset;
  final Color color;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'offset': offset,
      'color':
          'rgba(${(color.r * 255).toInt()}, ${(color.g * 255).toInt()}, ${(color.b * 255).toInt()}, ${color.a})',
    };
  }
}
