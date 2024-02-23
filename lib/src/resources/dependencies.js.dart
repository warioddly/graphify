
import 'package:graphify/src/resources/lib/echarts.gl.min.dart';
import 'package:graphify/src/resources/lib/echarts.min.dart';
import 'package:graphify/src/resources/lib/jquery.min.dart';


const dependencies =
    "$jQuery "
    "$echartsMin "
    "$echartsGlMin "
    "$chartScripts";

const htmlDependencies = "<script>$dependencies</script>";


const chartScripts = """
    
    const graphify_charts = {};
    
    function initChart(chart_id, chart, option) {
      chart.setOption(option);
      graphify_charts[chart_id] = { chart, option };
    }
    
    function updateChart(chart_id, option) {
      if (!graphify_charts[chart_id]) return;
      const chart = graphify_charts[chart_id].chart;
      option = normalizeOption(option);
      chart.setOption(option);
      graphify_charts[chart_id].option = option;
    }
    
    function disposeChart(chart_id) {
      const chart = graphify_charts[chart_id].chart;
      if (!chart) return;
      chart.dispose();
      delete graphify_charts[chart_id];
    }
    
    function normalizeOption(option) {
      if (typeof option === 'object') return option;
      return JSON.parse(option);
    }
    
    
""";