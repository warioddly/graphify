import 'dart:async';
import 'dart:convert';

import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:graphify/src/utils/js_methods.dart';
import 'package:graphify/src/utils/uid.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GraphifyController implements controller_interface.GraphifyController {


  /// When create a new instance of [GraphifyController],
  /// it generates a new [uid] for the chart.
  GraphifyController() {
    uid = UID.generate();
  }

  /// The [WebViewController] that is used to interact with the webview.
  late final WebViewController _connector;


  /// The [WebViewController] that is used to interact with the chart.
  @override
  late final String uid;


  /// Updates the chart with the given [options].
  @override
  Future<void> update(Map<String, dynamic>? options) async {
    await _callMethod('window.${JsMethods.updateChart}("$uid", ${jsonEncode(options ?? {})})');
  }


  /// Sets the [connector] to interact with the chart.
  set connector(WebViewController connector) {
    _connector = connector;
  }


  /// Calls the JavaScript method with the given [javaScript] code.
  Future<void> _callMethod(String javaScript) async {
    await _connector.runJavaScript(javaScript);
  }


  /// Disposes the chart.
  @override
  void dispose() async {
    await _callMethod('window.${JsMethods.disposeChart}("$uid")');
  }
}
