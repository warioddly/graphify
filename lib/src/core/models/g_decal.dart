import 'dart:ui';
import 'package:graphify/src/core/models/interface.dart';

class GDecal extends GraphifyModel {

  const GDecal({
    this.show = true,
    this.decals = const GDecals(),
  });

  final bool show;
  final GDecals decals;

  @override
  Map<String, dynamic> toJson() {
    return {
      'show': show,
      'decals': decals.toJson(),
    };
  }

}

class GDecals extends GraphifyModel {

  const GDecals({
    this.symbol = 'rect',
    this.symbolSize = 1,
    this.symbolKeepAspect = true,
    this.color = 'rgba(0, 0, 0, 0.2)',
    this.backgroundColor = 'transparent',
    this.dashArrayX = 5,
    this.dashArrayY = 5,
    this.rotation = 0,
    this.maxTileSize = const Size(512, 512),
  });

  final String symbol;
  final int symbolSize;
  final bool symbolKeepAspect;
  final String color;
  final String backgroundColor;
  final int dashArrayX;
  final int dashArrayY;
  final int rotation;
  final Size maxTileSize;

  @override
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'symbolSize': symbolSize,
      'symbolKeepAspect': symbolKeepAspect,
      'color': color,
      'backgroundColor': backgroundColor,
      'dashArrayX': dashArrayX,
      'dashArrayY': dashArrayY,
      'rotation': rotation,
      'maxTileWidth': maxTileSize.width,
      'maxTileHeight': maxTileSize.height,
    };
  }

}
