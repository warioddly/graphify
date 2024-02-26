
String scriptsJs(String id, { String? options }) => """

const dom = document.getElementById('chart');
const context = (window.parent && window.parent.window) || window || {};
const chart = context.echarts.init(dom, 'dark', { renderer: 'canvas', useDirtyRect: false });
${ options == null ? 'var option = {}' : 'var option = $options;' }

context.initChart('$id', chart, option);
context.updateChart('$id', option);

window.addEventListener('resize', chart.resize);

""";

