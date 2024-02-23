import 'dart:convert';
import 'dart:js' as js;
import 'package:flutter/foundation.dart' show debugPrint;

import 'package:graphify/src/controller/interface.dart' as controller_interface;

class GraphifyController implements controller_interface.GraphifyController {


  js.JsObject? connector;


  @override
  Future<void> update(String options) async {
    debugPrint(connector.toString());
    _debugPrint(connector?.callMethod('setOptions', [options]));
  }



  void _debugPrint(js.JsObject? object) {
    if (object == null) {
      debugPrint("[+] object is null");
      return;
    }

    final stringify = js.context['JSON'].callMethod('stringify', [object]);

    if (stringify == null) {
      debugPrint("[+] stringify is null");
      return;
    }

    final data = jsonDecode(stringify);
    debugPrint(data);
  }

}