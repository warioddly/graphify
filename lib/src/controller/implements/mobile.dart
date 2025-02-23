import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
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
  late String uid;

  @override
  Future<void> update(Map<String, dynamic>? options) async {
    if (uid.isEmpty) {
      debugPrint("[+] identifier is empty");
      return;
    }

    await _eval(
        'window.${JsMethods.updateChart}("$uid", ${jsonEncode(options ?? {})})');
  }

  set connector(WebViewController connector) {
    _connector = connector;
  }

  Future<void> _eval(String js) async {
    if (js.isEmpty) {
      return;
    }
    await _connector.runJavaScript(js);
  }

  @override
  FutureOr<void> dispose() {
    if (uid.isEmpty) {
      debugPrint("[+] identifier is empty");
      return null;
    }
    return _eval('window.${JsMethods.disposeChart}("$uid")');
  }
}
