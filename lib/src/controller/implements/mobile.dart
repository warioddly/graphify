import 'dart:async';
import 'dart:convert';

import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:graphify/src/controller/js_methods.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GraphifyController extends controller_interface.GraphifyController {
  final StreamController<Map<String, dynamic>> _clicks =
      StreamController<Map<String, dynamic>>.broadcast();

  late final WebViewController _connector;

  set connector(WebViewController connector) => _connector = connector;

  String get _quotedUid => '"$uid"';

  @override
  Future<void> update(Map<String, dynamic>? options) async {
    return _eval(
      JsMethods.updateChart,
      [_quotedUid, jsonEncode(options ?? {})],
    );
  }

  @override
  void dispose() async {
    await _clicks.close();
    try {
      await _eval(JsMethods.disposeChart, [_quotedUid]);
    } catch (_) {}
  }

  @override
  Stream<Map<String, dynamic>> get chartClickedEvent => _clicks.stream;

  void onChartClick(String message) {
    try {
      final dynamic decoded = jsonDecode(message);
      if (decoded is Map<String, dynamic>) {
        _clicks.sink.add(decoded);
      }
    } catch (_) {}
  }

  Future<void> _eval(String method, List<String> args) async {
    return _connector.runJavaScript(_buildJsMethod(method, args));
  }

  String _buildJsMethod(String method, List<String> args) {
    return 'window.$method(${args.map((String arg) => arg).join(', ')})';
  }
}
