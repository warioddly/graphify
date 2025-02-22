import 'package:graphify/src/models/axis/g_axis_pointer.dart';
import 'package:graphify/src/models/interface.dart';
import 'package:graphify/src/models/other/g_position.dart';

/// https://echarts.apache.org/en/option.html#grid.tooltip
class GTooltip extends GraphifyModel {

  const GTooltip({
    super.id,
    super.show = true,
    this.trigger = 'item',
    this.axisPointer = const GAxisPointer(),
    this.position = const GPosition(),
    this.formatter = '{a} <br/>{b} : {c}',
    this.backgroundColor = 'rgba(50,50,50,0.7)',
  });

  /// 'item' | 'axis' | 'none'
  /// 'item': trigger on item elements.
  /// 'axis': trigger on the axis.
  /// 'none': trigger nothing.
  final String trigger;

  /// https://echarts.apache.org/en/option.html#grid.tooltip.axisPointer
  final GAxisPointer axisPointer;

  /// https://echarts.apache.org/en/option.html#grid.tooltip.position
  final GPosition position;

  final String formatter;

  final String backgroundColor;

  @override
  Map<String, dynamic> toJson() {
    return {

    };
  }
}