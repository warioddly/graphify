import 'package:graphify/src/resources/lib/echarts.gl.min.dart';
import 'package:graphify/src/resources/lib/echarts.min.dart';
import 'package:graphify/src/resources/lib/jquery.min.dart';
import 'package:graphify/src/controller/js_methods.dart';

const dependencies = "$jQuery "
    "$echartsMin "
    "$echartsGlMin "
    "$chartScripts";

const String chartScripts = """
    
    const graphify_charts = {};
    
    function ${JsMethods.initChart}(chart_id, chart, option) {
      option = ${JsMethods.normalizeJson}(option);
      chart.setOption(option);
      graphify_charts[chart_id] = { chart, option };
    }
    
    function ${JsMethods.updateChart}(chart_id, option) {
      if (!graphify_charts[chart_id]) return;
      const chart = graphify_charts[chart_id].chart;
      option = ${JsMethods.normalizeJson}(option);
      chart.setOption(option);
      graphify_charts[chart_id].option = option;
    }

    function ${JsMethods.initClickListener}(chart, chart_id) {
      try {
      chart.off && chart.off('click');
      } catch (e) {}

      chart.on('click', function (data) {
        try {
          if (!data) return;

          function safeValue(value, depth) {
            if (value == null) return null;
            if (depth > 3) return undefined;
            const t = typeof value;
            if (t === 'string' || t === 'number' || t === 'boolean') return value;
            if (Array.isArray(value)) return value.map(v => safeValue(v, depth + 1)).filter(v => v !== undefined);
            if (t === 'object') {
              const out = {};
              const keys = ['type', 'componentType', 'seriesType', 'seriesIndex', 'seriesName', 'name', 'dataIndex', 'data', 'value', 'color', 'marker'];
              keys.forEach(k => {
                if (k in value) {
                  const v = safeValue(value[k], depth + 1);
                  if (v !== undefined) out[k] = v;
                }
              });
              // fallback: pick plain props if 'data' is missing
              if (!('data' in out) && value && typeof value === 'object') {
                Object.keys(value).forEach(k => {
                  if (out[k] !== undefined) return;
                  const v = value[k];
                  const vt = typeof v;
                  if (vt === 'string' || vt === 'number' || vt === 'boolean') out[k] = v;
                });
              }
              return out;
            }
            return undefined;
          }

          const sanitized = safeValue(data, 0) || {};
          const payload = JSON.stringify(sanitized);
          // Mobile (WebView) channel
          if (window && window.ClickEventChannel && typeof window.ClickEventChannel.postMessage === 'function') {
            window.ClickEventChannel.postMessage(payload);
          }
          // Web (Flutter web) channel - post directly to the hosting window
          try {
            const envelope = JSON.stringify({
              source: 'graphify',
              chartId: chart_id,
              payload: String(payload)
            });
            window.postMessage(envelope, '*');
          } catch (e) {
            console.error('Error posting window message:', e);
          }
        } catch (e) {
          console.error('Error posting click event:', e);
        }
      });
    }
    
    function ${JsMethods.disposeChart} (chart_id) {
      const chart = graphify_charts[chart_id]?.chart;
      if (!chart) return;
      chart.dispose();
      delete graphify_charts[chart_id];
    }
    
    function ${JsMethods.normalizeJson}(option) {
      if (typeof option === 'object') return option;
      if (option instanceof String && option.length === 0 || option == null) return {};
      return JSON.parse(option);
    }
    
""";
