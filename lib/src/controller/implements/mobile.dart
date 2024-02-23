

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:webview_flutter/webview_flutter.dart';


class GraphifyController implements controller_interface.GraphifyController {


  late final WebViewController _connector;


  @override
  String identifier = "";


  @override
  Future<void> update(String options) async {

    if (identifier.isEmpty) {
      debugPrint("[+] identifier is empty");
      return;
    }

    await _connector.runJavaScript('window.updateChart("$identifier", ${jsonEncode(jsonDecode(options))})');

  }


  
  set connector(WebViewController connector) {
    _connector = connector;
  }


}