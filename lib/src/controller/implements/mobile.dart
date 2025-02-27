import 'dart:async';
import 'dart:convert';

import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:graphify/src/utils/js_methods.dart';
import 'package:graphify/src/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GraphifyController implements controller_interface.GraphifyController {
  GraphifyController() {
    uid = Utils.uid();
  }

  late final WebViewController _connector;

  @override
  late final String uid;

  @override
  Future<void> update(Map<String, dynamic>? options) async {
    await _callMethod('window.${JsMethods.updateChart}("$uid", ${jsonEncode(options ?? {})})');
  }

  set connector(WebViewController connector) {
    _connector = connector;
  }

  Future<void> _callMethod(String javaScript) async {
    await _connector.runJavaScript(javaScript);
  }

  @override
  void dispose() async {
    await _callMethod('window.${JsMethods.disposeChart}("$uid")');
  }
}
