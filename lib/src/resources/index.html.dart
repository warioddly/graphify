// ignore_for_file: leading_newlines_in_multiline_strings

import 'package:graphify/src/resources/dependencies.js.dart';
import 'package:graphify/src/resources/scripts.js.dart';

String indexHtml({ required String id, bool enableDependency = true}) {
  return '''<!DOCTYPE html>
    <html>
    <head>
      <meta charset="UTF-8">
      <meta content="IE=Edge" http-equiv="X-UA-Compatible">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
      <title>Graphify</title>
      <style>
        html, body {
          background-color: #100c2a;
          height: -webkit-fill-available;
          box-sizing: content-box;
          margin: 0;
        }
        #chart {
          height: -webkit-fill-available;
        }
      </style>
    </head>
    <body>
      <div id="chart"></div>
      ${enableDependency ? htmlDependencies : ""}
      <script>${scriptsJs(id)}</script>
    </body>
    </html>
''';
}