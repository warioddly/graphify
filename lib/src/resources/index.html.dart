// ignore_for_file: leading_newlines_in_multiline_strings

import 'package:graphify/src/resources/dependencies.js.dart';
import 'package:graphify/src/utils/js_methods.dart';

String indexHtml({
  required String id,
  bool enableDependency = true,
  String? backgroundColor,
}) {
  return '''<!DOCTYPE html>
    <html>
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
      <style>
        html, body {
          ${backgroundColor != null ? "background-color: $backgroundColor;" : ""}
          height: -webkit-fill-available;
          box-sizing: content-box;
          margin: 0;
          overflow: hidden;
        }
        #chart {
          height: -webkit-fill-available;
        }
      </style>
    </head>
    <body>
      <div id="chart"></div>
      ${enableDependency ? htmlDependencies : ""}
      <script>
          const dom = document.getElementById('chart');
          const context = (window.parent && window.parent.window) || window || {};
          const chart = context.echarts.init(dom, 'dark', { renderer: 'canvas', useDirtyRect: false });
          
          context.${JsMethods.initChart}('$id', chart, {});
          context.${JsMethods.updateChart}('$id', {});
          
          window.addEventListener('resize', chart.resize);
      </script>
    </body>
    </html>
''';
}
