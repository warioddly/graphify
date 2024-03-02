
String scriptsJs(String id) => """

const dom = document.getElementById('chart');
const context = (window.parent && window.parent.window) || window || {};
const chart = context.echarts.init(dom, 'dark', { renderer: 'canvas', useDirtyRect: false });
var option = {};

context.initChart('$id', chart, option);
context.updateChart('$id', option);

window.addEventListener('resize', chart.resize);

""";

