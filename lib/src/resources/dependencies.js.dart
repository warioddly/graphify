
import 'package:graphify/src/resources/lib/echarts.gl.min.dart';
import 'package:graphify/src/resources/lib/echarts.min.dart';
import 'package:graphify/src/resources/lib/jquery.min.dart';
import 'package:graphify/src/models/enums/enums.dart';


final dependencies =
    "$jQuery "
    "$echartsMin "
    "$echartsGlMin "
    "$chartScripts";

final htmlDependencies = "<script>$dependencies</script>";


final String chartScripts = """
    
    const graphify_charts = {};
    
    function ${GraphifyMethods.initChart.name}(chart_id, chart, option) {
      option = ${GraphifyMethods.normalizeJson.name}(option);
      chart.setOption(option);
      graphify_charts[chart_id] = { chart, option };
    }
    
    function ${GraphifyMethods.updateChart.name}(chart_id, option) {
      if (!graphify_charts[chart_id]) return;
      const chart = graphify_charts[chart_id].chart;
      option = ${GraphifyMethods.normalizeJson.name}(option);
      chart.setOption(option);
      graphify_charts[chart_id].option = option;
    }
    
    function ${GraphifyMethods.disposeChart.name} (chart_id) {
      const chart = graphify_charts[chart_id]?.chart;
      if (!chart) return;
      chart.dispose();
      delete graphify_charts[chart_id];
    }
    
    function ${GraphifyMethods.normalizeJson.name}(option) {
      if (typeof option === 'object') return option;
      if (option instanceof String && option.length === 0 || option == null) return {};
      return JSON.parse(option);
    }
    
    
    function ${GraphifyMethods.graphicLinearGradient.name}() {
      return new echarts.graphic.LinearGradient(0, 0, 0, 1, [
          {
            offset: 0,
            color: 'rgb(55, 162, 255)'
          },
          {
            offset: 1,
            color: 'rgb(116, 21, 219)'
          }
        ])
    }
    
""";