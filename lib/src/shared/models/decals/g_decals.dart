import 'dart:ui';

import 'package:graphify/src/shared/models/interface.dart';

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


  GDecals copyWith({
    String? symbol,
    int? symbolSize,
    bool? symbolKeepAspect,
    String? color,
    String? backgroundColor,
    int? dashArrayX,
    int? dashArrayY,
    int? rotation,
    Size? maxTileSize,
  }) {
    return GDecals(
      symbol: symbol ?? this.symbol,
      symbolSize: symbolSize ?? this.symbolSize,
      symbolKeepAspect: symbolKeepAspect ?? this.symbolKeepAspect,
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      dashArrayX: dashArrayX ?? this.dashArrayX,
      dashArrayY: dashArrayY ?? this.dashArrayY,
      rotation: rotation ?? this.rotation,
      maxTileSize: maxTileSize ?? this.maxTileSize,
    );
  }


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
