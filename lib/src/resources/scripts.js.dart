import 'package:graphify/src/models/enums/enums.dart';

String scriptsJs(String id) => """

const dom = document.getElementById('chart');
const context = (window.parent && window.parent.window) || window || {};
const chart = context.echarts.init(dom, 'dark', { renderer: 'canvas', useDirtyRect: false });

context.${GraphifyMethods.initChart.name}('$id', chart, {});
context.${GraphifyMethods.updateChart.name}('$id', {});

window.addEventListener('resize', chart.resize);

""";

