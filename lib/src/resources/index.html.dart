// ignore_for_file: leading_newlines_in_multiline_strings

import 'package:graphify/src/utils/js_methods.dart';

String indexHtml({ required String id, String? dependencies}) {
  return '''<!DOCTYPE html>
    <html>
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
      <style>
        html, body {
          background-color: transparent;
          height: -webkit-fill-available;
          box-sizing: content-box;
          margin: 0;
          overflow: hidden;
          width: 100%;
          height: 100%;
        }
        #chart { height: -webkit-fill-available; }
      </style>
    </head>
    <body>
      <div id="chart"></div>
      ${dependencies ?? ''}
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
