import 'dart:async';
import 'dart:convert';

import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:graphify/src/utils/js_methods.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GraphifyController extends controller_interface.GraphifyController {

  late final WebViewController _connector;

  @override
  Future<void> update(Map<String, dynamic>? options) async {
    await runJavaScript('window.${JsMethods.updateChart}("$uid", ${jsonEncode(options ?? {})})');
  }

  set connector(WebViewController connector) => _connector = connector;

  Future<void> runJavaScript(String javaScript) async {
    await _connector.runJavaScript(javaScript);
  }

  @override
  void dispose() async {
    await runJavaScript('window.${JsMethods.disposeChart}("$uid")');
  }
}
