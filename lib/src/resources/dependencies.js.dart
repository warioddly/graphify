
import 'package:graphify/src/resources/lib/echarts.gl.min.dart';
import 'package:graphify/src/resources/lib/echarts.min.dart';
import 'package:graphify/src/resources/lib/jquery.min.dart';


const dependencies =
    "$jQuery "
    "$echartsMin "
    "$echartsGlMin "
    "$chartScripts";

const htmlDependencies = "<script>$dependencies</script>";


const chartScripts = r"""
    
    const graphify_charts = {};
    
    function initChart(chart_id, chart, option) {
      option = normalizeOption(option);
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
      if (option instanceof String && option.length === 0) return {};
      return JSON.parse(option.replace(/(['"])?([a-zA-Z0-9_]+)(['"])?:/g, '"$2": ').replace(/'([^']+?)'/g, '"$1"'));
    }
  
    
""";